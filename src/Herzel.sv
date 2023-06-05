module Herzel #(
  parameter NF = 11,
  parameter DW = 64
)(
  // CLK&RST
  input                                  rstn     ,
  input                                  clk      ,
  // CTRL
  input                                  en       ,
  output logic          [NF-1:0]         valid    ,
  // data_i
  input                         [31  :0] ns_i     , // (32.0 )
  input                         [DW-1:0] ns_coef_i, // (32.32)
  input          signed [NF-1:0][DW-1:0] alpha_i  , // (32.32)
  input          signed [NF-1:0][DW-1:0] cW_re_i  , // (32.32)
  input          signed [NF-1:0][DW-1:0] cW_im_i  , // (32.32)
  input          signed         [DW-1:0] data_i   , // (32.32)
  output logic unsigned [NF-1:0][31  :0] data_o     // (16.16)
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

logic signed [NF-1:0][DW-1:0] vm1 ; // (32.32)
logic signed [NF-1:0][DW-1:0] vm2 ; // (32.32)
logic signed [NF-1:0][DW-1:0] data; // (32.32)
logic                [31  :0] indx; // (32.32)

logic signed [NF-1:0][DW-1:0] mul_a; // (32.32)
logic signed [NF-1:0][DW-1:0] mul_b; // (32.32)
logic signed [NF-1:0][DW-1:0] mul_c; // (32.32)

logic          en_r     ;
logic [DW-1:0] data_r   ;
logic          mul_en   ;
logic          mul_start;
logic          mul_busy ;
logic [NF-1:0] mul_valid;

genvar gvar;
generate 
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin : herzel
    mult_sign_clk #(
      .DW    (DW  ),
      .INT1_I(DW/2),
      .INT2_I(DW/2),
      .INT3_O(DW/2) 
    ) u_mult_sign_clk(
      .rstn (rstn           ),
      .clk  (clk            ),
      .en   (mul_start      ),
      .a_in (mul_a[gvar]    ),
      .b_in (mul_b[gvar]    ),
      .valid(mul_valid[gvar]),
      .c_out(mul_c[gvar]    )
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
    en_r   <= 0;
    data_r <= 0;
    valid  <= 0;
    data_o <= 0;
    vm1    <= 0;
    vm2    <= 0;
    data   <= 0;
    indx   <= 0;
    next_state <= CALC;
  end
  else begin
    if (en) begin
      en_r   <= 1;
      data_r <= data_i;
    end
    if (&mul_valid || next_state == VALID) begin
      case (curr_state)
        CALC : begin
          if (en_r) begin
            if (indx < ns_i) begin
              for (int i=0;i<NF;i++) begin
                vm1[i] <= data_r + mul_c[i] - vm2[i];
                vm2[i] <= vm1[i];
              end
              indx <= indx + 1;
            end
            en_r   <= 0;
            data_r <= 0;
          end
          if (indx < ns_i)
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
            data_o[i] <= mul_c[i][DW/2+16-1:DW/2-16];
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
            data_o[i] <= data_o[i] + mul_c[i][DW/2+16-1:DW/2-16];
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
end


always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    mul_a     <= 0;
    mul_b     <= 0;
    mul_en    <= 0;
    mul_start <= 0;
    mul_busy  <= 0;
  end
  else begin
    if (en) begin
      mul_en <= 1;
    end
    if (!mul_busy && (next_state != VALID) && mul_en) begin
      mul_start <= 1;
      mul_busy  <= 1;
    end
    else begin
      mul_start <= 0;
    end
    if (&mul_valid) begin
      mul_busy <= 0;
    end
    case (curr_state)
      CALC : begin
        mul_a <= alpha_i;
        mul_b <= vm1;
      end
      MULR : begin
        mul_a <= vm1;
        mul_b <= cW_re_i;
      end
      NORMR : begin
        mul_a <= data;
        for (int i=0;i<NF;i++)
          mul_b[i] <= ns_coef_i;
      end
      GRADR : begin
        mul_a <= data;
        mul_b <= data;
      end
      MULI : begin
        mul_a <= vm1;
        mul_b <= cW_im_i;
      end
      NORMI : begin
        mul_a <= data;
        for (int i=0;i<NF;i++)
          mul_b[i] <= ns_coef_i;
      end
      GRADI : begin
        mul_a <= data;
        mul_b <= data;
      end
      default: begin
        mul_a <= 0;
        mul_b <= 0;
      end
    endcase
  end
end

endmodule