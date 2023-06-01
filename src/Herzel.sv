module Herzel #(
  parameter NF = 2
)(
  // CLK&RST
  input                                rstn     ,
  input                                clk      ,
  // CTRL
  input                                en       ,
  output logic          [NF-1:0]       valid    ,
  // data_i
  input                         [31:0] ns_i     , // (32.0 )
  input                         [63:0] ns_coef_i, // (32.32)
  input          signed [NF-1:0][63:0] alpha_i  , // (32.32)
  input          signed [NF-1:0][63:0] cW_re_i  , // (32.32)
  input          signed [NF-1:0][63:0] cW_im_i  , // (32.32)
  input          signed         [63:0] data_i   , // (32.32)
  output logic unsigned [NF-1:0][31:0] data_o     // (16.16)
);

typedef enum {  
  CALC ,
  MULR ,
  NORMR,
  GRADR,
  MULI ,
  NORMI,
  GRADI,
  VALID 
} state;

state curr_state;
state next_state;

logic signed [NF-1:0][63:0] vm1 ; // (32.32)
logic signed [NF-1:0][63:0] vm2 ; // (32.32)
logic signed [NF-1:0][63:0] tmp ; // (32.32)
logic signed [NF-1:0][63:0] data; // (32.32)
logic                [31:0] indx; // (32.32)

logic signed [NF-1:0][63:0] mul_a; // (32.32)
logic signed [NF-1:0][63:0] mul_b; // (32.32)
logic signed [NF-1:0][63:0] mul_c; // (32.32)

genvar gvar;
generate 
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin : herzel
    mult_sign #(
      .DW    (64),
      .INT1_I(32),
      .INT2_I(32),
      .INT3_O(32) 
    ) u_mult_sign (
      .a_in (mul_a[gvar]),
      .b_in (mul_b[gvar]),
      .c_out(mul_c[gvar]),
      .c_ful(           ) 
    );
  end
endgenerate

always_ff @(negedge clk, negedge rstn) begin
  if (!rstn) begin
    curr_state <= CALC;
  end
  else begin
    curr_state <= next_state;
  end
end

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    valid  <= 0;
    data_o <= 0;
    vm1    <= 0;
    data   <= 0;
    indx   <= 0;
    next_state <= CALC;
  end
  else begin
    case (curr_state)
      CALC : begin
        if (en) begin
          if (indx < ns_i) begin
            if (indx == 0) begin
              for (int i=0;i<NF;i++)
                vm1[i] <= data_i;
            end
            else if (indx == 1) begin
              for (int i=0;i<NF;i++)
                vm1[i] <= data_i + mul_c[i];
            end
            else begin
              for (int i=0;i<NF;i++)
                vm1[i] <= data_i + mul_c[i] - vm2[i];
            end
            indx <= indx + 1;
          end
        end
        if (indx < ns_i - 1)
          next_state <= CALC;
        else
          next_state <= MULR;
      end
      MULR : begin
        data <= mul_c - vm2;
        next_state <= NORMR;
      end
      NORMR : begin
        data <= mul_c;
        next_state <= GRADR;
      end
      GRADR : begin
        for (int i=0;i<NF;i++)
          data_o[i] <= mul_c[i][47:16];
        next_state <= MULI;
      end
      MULI : begin
        data <= mul_c;
        next_state <= NORMI;
      end
      NORMI : begin
        data <= mul_c;
        next_state <= GRADI;
      end
      GRADI : begin
        for (int i=0;i<NF;i++)
          data_o[i] <= data_o[i] + mul_c[i][47:16];
        next_state <= VALID;
      end
      VALID : begin
        for (int i=0;i<NF;i++)
          valid[i] <= 1;
        next_state <= VALID;
      end
      default: next_state <= curr_state;
    endcase
  end
end

always_ff @(negedge clk, negedge rstn) begin
    if (!rstn) begin
    vm2 <= 0;
    tmp <= 0;
  end
  else begin
    case (curr_state)
      CALC : begin
        if (en) begin
          tmp <= vm1;
          vm2 <= tmp;
        end
      end
      default:;
    endcase
  end
end

always_comb begin
  case (curr_state)
    CALC : begin
      mul_a = alpha_i;
      mul_b = vm1  ;
    end
    MULR : begin
      mul_a = vm1  ;
      mul_b = cW_re_i;
    end
    NORMR : begin
      mul_a = data;
      for (int i=0;i<NF;i++)
        mul_b[i] = ns_coef_i;
    end
    GRADR : begin
      mul_a = data;
      mul_b = data;
    end
    MULI : begin
      mul_a = vm1  ;
      mul_b = cW_im_i;
    end
    NORMI : begin
      mul_a = data;
      for (int i=0;i<NF;i++)
        mul_b[i] = ns_coef_i;
    end
    GRADI : begin
      mul_a = data;
      mul_b = data;
    end
    default: begin
      mul_a = 0;
      mul_b = 0;
    end
  endcase
end

endmodule