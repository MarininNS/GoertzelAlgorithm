module Herzel #(
  parameter NF = 11  ,
  parameter NS = 1000
)(
  // CLK&RST
  input                        rstn   ,
  input                        clk    ,
  // CTRL
  input                        en     ,
  output logic                 valid  ,
  // DATA
  input          signed [63:0] alpha_i, // (20.44)
  input          signed [63:0] cW_re_i, // (20.44)
  input          signed [63:0] cW_im_i, // (20.44)
  input          signed [31:0] data_i , // ( 8.24)
  output logic unsigned [31:0] data_o   // (16.16)
);

typedef enum {  
  CALC ,
  MULR ,
  MULI ,
  NORMR,
  NORMI,
  GRADR,
  GRADI,
  VALID 
} state;

state curr_state;
state next_state;

logic signed [63:0] NORM_COEF = 64'h00000000_0019D08E; // (32.32)

logic signed [63:0] alpha    ; // (32.32)
logic signed [63:0] cW_re    ; // (32.32)
logic signed [63:0] cW_im    ; // (32.32)
logic signed [63:0] data     ; // (32.32)
logic signed [63:0] vm1      ; // (32.32)
logic signed [63:0] vm2      ; // (32.32)
logic signed [63:0] tmp      ; // (32.32)
logic signed [63:0] vm1_cW_re; // (32.32)
logic signed [63:0] vm1_cW_im; // (32.32)
logic signed [63:0] data_re  ; // (32.32)
logic signed [63:0] data_im  ; // (32.32)
logic        [31:0] indx     ; // (32.32)

assign alpha = {{13{alpha_i[63]}}, alpha_i[62:12]};
assign cW_re = {{13{cW_re_i[63]}}, cW_re_i[62:12]};
assign cW_im = {{13{cW_im_i[63]}}, cW_im_i[62:12]};
assign data  = {{25{data_i[31]}}, data_i[30:0], {8{1'b0}}};

logic signed [63 :0] mul_a; // (32.32)
logic signed [63 :0] mul_b; // (32.32)
logic signed [63 :0] mul_c; // (32.32)

mult_sign #(
  .DW    (64),
  .INT1_I(32),
  .INT2_I(32),
  .INT3_O(32) 
) u_mult_sign (
  .a_in (mul_a),
  .b_in (mul_b),
  .c_out(mul_c),
  .c_ful(     ) 
);

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
    valid      <= 0;
    data_o     <= 0;
    vm1        <= 0;
    vm1_cW_re  <= 0;
    vm1_cW_im  <= 0;
    data_re    <= 0; 
    data_im    <= 0;
    indx       <= 0;
  end
  else begin
    case (curr_state)
      CALC : begin
        if (en) begin
          if (indx < NS) begin
            if (indx == 0) begin
              vm1 <= data;
            end
            else if (indx == 1) begin
              vm1 <= data + mul_c;
            end
            else begin
              vm1 <= data + mul_c - vm2;
            end
            indx <= indx + 1;
          end
        end
        if (indx < NS - 1)
          next_state <= CALC;
        else
          next_state <= MULR;
      end
      MULR : begin
        vm1_cW_re <= mul_c - vm2;
        next_state <= MULI;
      end
      MULI : begin
        vm1_cW_im <= mul_c;
        next_state <= NORMR;
      end
      NORMR : begin
        data_re <= mul_c;
        next_state <= NORMI;
      end
      NORMI : begin
        data_im <= mul_c;
        next_state <= GRADR;
      end
      GRADR : begin
        data_o <= mul_c[47:16];
        next_state <= GRADI;
      end
      GRADI : begin
        data_o <= data_o + mul_c[47:16];
        next_state <= VALID;
      end
      VALID : begin
        valid  <= 1;
        next_state <= VALID;
      end
      default: next_state <= curr_state;
    endcase
  end
end

always_ff @(negedge clk, negedge rstn) begin
    if (!rstn) begin
    vm2        <= 0;
    tmp        <= 0;
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
      mul_a = alpha;
      mul_b = vm1  ;
    end
    MULR : begin
      mul_a = vm1  ;
      mul_b = cW_re;
    end
    MULI : begin
      mul_a = vm1  ;
      mul_b = cW_im;
    end
    NORMR : begin
      mul_a = vm1_cW_re;
      mul_b = NORM_COEF;
    end
    NORMI : begin
      mul_a = vm1_cW_im;
      mul_b = NORM_COEF;
    end
    GRADR : begin
      mul_a = data_re;
      mul_b = data_re;
    end
    GRADI : begin
      mul_a = data_im;
      mul_b = data_im;
    end
    default: begin
      mul_a = 0;
      mul_b = 0;
    end
  endcase
end

endmodule