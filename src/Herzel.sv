module Herzel #(
  parameter NF = 11  ,
  parameter NS = 1000
)(
  // CLK&RST
  input                      rstn        ,
  input                      clk         ,
  // CTRL
  input                      en          ,
  output logic               valid       ,
  // DATA
  input          signed [63:0] alpha_i   ,
  input          signed [63:0] cW_re_i   ,
  input          signed [63:0] cW_im_i   ,
  input          signed [31:0] data_i    ,
  output logic unsigned [31:0] data_o      
); 

typedef enum {  
  CALC ,
  CONF ,
  MULR ,
  MULI ,
  GRADR,
  GRADI,
  VALID 
} state;

state curr_state;
state next_state;

logic signed   [63:0] data        ; 
logic signed   [63:0] vm1         ; 
logic signed   [63:0] vm2         ;
logic signed   [63:0] tmp         ;
logic signed   [63:0] vm1_cW_re   ;
logic signed   [63:0] vm1_cW_im   ;
logic signed   [31:0] data_re     ;
logic signed   [31:0] data_im     ;
logic          [31:0] indx        ;

logic signed [63:0] alpha;
logic signed [63:0] cW_re;
logic signed [63:0] cW_im;

assign alpha = {{13{alpha_i[63]}}, alpha_i[62:12]};
assign cW_re = {{13{cW_re_i[63]}}, cW_re_i[62:12]};
assign cW_im = {{13{cW_im_i[63]}}, cW_im_i[62:12]};

assign data   = {{25{data_i[31]}}, data_i[30:0], {8{1'b0}}}; // 20.44
assign data_o = data_re + data_im;

logic signed [63 :0] mul_a; // (20.44)
logic signed [63 :0] mul_b; // (20.44)
logic signed [63 :0] mul_c; // (20.44)
logic signed [127:0] c_ful; // (40.88)

mult_sign #(
  .DW    (64),
  .INT1_I(32),
  .INT2_I(32),
  .INT3_O(32) 
) u_mult_sign (
  .a_in (mul_a),
  .b_in (mul_b),
  .c_out(mul_c),
  .c_ful(c_ful) 
);

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    valid      <= 0;
    vm1        <= 0;
    vm2        <= 0;
    tmp        <= 0;
    vm1_cW_re  <= 0;
    vm1_cW_im  <= 0;
    data_re    <= 0; 
    data_im    <= 0;
    indx       <= 0;
    curr_state <= CALC;
  end
  else begin
    curr_state <= next_state;
  end
end

always_ff @(posedge clk) begin
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
      next_state <= GRADR;
    end
    GRADR : begin
      data_re <= c_ful[95:64];
      next_state <= GRADI;
    end
    GRADI : begin
      data_im <= c_ful[95:64];
      next_state <= VALID;
    end
    VALID : begin
      valid  <= 1;
      next_state <= VALID;
    end
    default: next_state <= curr_state;
  endcase
end

always_ff @(negedge clk) begin
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
    GRADR : begin
      mul_a = vm1_cW_re;
      mul_b = vm1_cW_re;
    end
    GRADI : begin
      mul_a = vm1_cW_im;
      mul_b = vm1_cW_im;
    end
    default:;
  endcase
end

endmodule