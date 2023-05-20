module Cordic #(
  parameter NF = 11
)(
  // CLK&RST
  input                              rstn ,
  input                              clk  ,
  // CTRL
  input                              en   ,
  output logic                       valid,
  // DATA
  input        signed [NF-1:0][63:0] ang_i, // (20.44)
  output logic signed [NF-1:0][63:0] cos_o, // (20.44)
  output logic signed [NF-1:0][63:0] sin_o, // (20.44)
  output logic signed [NF-1:0][63:0] alpha  // (20.44)
);

typedef enum {  
  IDLE ,
  INIT ,
  QUAD ,
  CALC ,
  MULC ,
  PRIVC,
  ALPHA,
  MULS ,
  PRIVS,
  NEXT ,
  VALID 
} state;

state curr_state;
state next_state;

logic signed [63:0] PI       = 64'h00003_243F6A8885A; // (20.44)
logic signed [63:0] PI2      = 64'h00001_921FB54442D; // (20.44)
logic signed [63:0] COEF_DEF = 64'h00000_9B74EDA8436; // (20.44)
logic signed [63:0] ZERO     = 64'h00000_00000000000; // (20.44)

logic signed [63:0] ang  ; // (20.44)
logic signed [63:0] cos  ; // (20.44)
logic signed [63:0] sin  ; // (20.44)
logic signed [63:0] atan ; // (20.44)
logic        [8 :0] indx0;
logic        [8 :0] indx1;
logic        [1 :0] quad ;

logic signed [63:0] mul_a; // (20.44)
logic signed [63:0] mul_b; // (20.44)
logic signed [63:0] mul_c; // (20.44)

assign mul_a = COEF_DEF;

mult_sign #(
  .DW    (64),
  .INT1_I(20),
  .INT2_I(20),
  .INT3_O(20) 
) u_mult_sign (
  .a_in (mul_a),
  .b_in (mul_b),
  .c_out(mul_c),
  .c_ful(     ) 
);

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    cos_o <= 0;
    sin_o <= 0;
    alpha <= 0;
    valid <= 0;
    ang   <= 0;
    cos   <= 64'h00001_00000000000;
    sin   <= 64'h00000_00000000000;
    indx0 <= 0;
    indx1 <= 0;
    quad  <= 0;
    mul_b <= 0;
    curr_state <= IDLE;
  end
  else begin
    curr_state = next_state;
  end
end

always_ff @(posedge clk) begin
  case (curr_state)
    IDLE : begin
      if (en)
        next_state <= INIT;
      else
        next_state <= IDLE;
    end
    INIT : begin
      ang <= ang_i[indx0];
      next_state <= QUAD;
    end
    QUAD : begin
      if (ang > PI) begin
        ang  <= ang - PI;
        quad <= 2'b10   ;
      end
      else if (ang > PI2) begin
        ang  <= ang - PI2;
        quad <= 2'b01    ;
      end
      else begin
        quad <= 2'b00;
      end
      next_state <= CALC;
    end
    CALC : begin
      if (indx1 < 45) begin
        if (ang[63] == 0) begin
          cos <= cos - (sin >>> indx1);
          sin <= sin + (cos >>> indx1);
          ang <= ang - atan           ; 
        end
        else begin
          cos <= cos + (sin >>> indx1);
          sin <= sin - (cos >>> indx1);
          ang <= ang + atan           ; 
        end
        indx1 <= indx1 + 1;
      end
      if (indx1 < 45)
        next_state <= CALC;
      else
        next_state <= MULC;
    end
    MULC : begin
      if (quad == 2'b10) begin
        mul_b <= cos;
      end
      else if (quad == 2'b01) begin
        mul_b <= sin;
      end
      else begin
        mul_b <= cos;
      end
      next_state <= PRIVC;
    end
    PRIVC : begin
      if (quad == 2'b10) begin
        cos_o[indx0] <= ZERO - mul_c;
      end
      else if (quad == 2'b01) begin
        cos_o[indx0] <= ZERO - mul_c;
      end
      else begin
        cos_o[indx0] <= mul_c;
      end
      next_state <= ALPHA;
    end
    ALPHA : begin
      alpha[indx0] = cos_o[indx0] <<< 1;
      next_state <= MULS;
    end
    MULS : begin
      if (quad == 2'b10) begin
        mul_b <= sin;
      end
      else if (quad == 2'b01) begin
        mul_b <= cos;
      end
      else begin
        mul_b <= sin;
      end
      next_state <= PRIVS;
    end
    PRIVS : begin
      if (quad == 2'b10) begin
        sin_o[indx0] <= ZERO - mul_c;
      end
      else if (quad == 2'b01) begin
        sin_o[indx0] <= mul_c;
      end
      else begin
        sin_o[indx0] <= mul_c;
      end
      next_state <= NEXT;
    end
    NEXT : begin
      if (indx0 < NF) begin
        cos   <= 64'h00001_00000000000;
        sin   <= 64'h00000_00000000000;
        indx0 <= indx0 + 1            ;
        indx1 <= 0                    ;
      end
      if (indx0 < NF - 1) 
        next_state <= INIT;
      else
        next_state <= VALID;
    end
    VALID : begin
      valid <= 1;
      next_state <= VALID;
    end
    default: next_state <= curr_state;
  endcase
end

always_comb begin
  case (indx1)
    0      : atan = 64'h00000_C90FDAA2217;  //  atanh(2^(-0 ))
    1      : atan = 64'h00000_76B19C1586F;  //  atanh(2^(-1 ))
    2      : atan = 64'h00000_3EB6EBF2590;  //  atanh(2^(-2 ))
    3      : atan = 64'h00000_1FD5BA9AAC3;  //  atanh(2^(-3 ))
    4      : atan = 64'h00000_0FFAADDB968;  //  atanh(2^(-4 ))
    5      : atan = 64'h00000_07FF556EEA6;  //  atanh(2^(-5 ))
    6      : atan = 64'h00000_03FFEAAB777;  //  atanh(2^(-6 ))
    7      : atan = 64'h00000_01FFFD555BC;  //  atanh(2^(-7 ))
    8      : atan = 64'h00000_00FFFFAAAAE;  //  atanh(2^(-8 ))
    9      : atan = 64'h00000_007FFFF5555;  //  atanh(2^(-9 ))
    10     : atan = 64'h00000_003FFFFEAAB;  //  atanh(2^(-10))
    11     : atan = 64'h00000_001FFFFFD55;  //  atanh(2^(-11))
    12     : atan = 64'h00000_000FFFFFFAB;  //  atanh(2^(-12))
    13     : atan = 64'h00000_0007FFFFFF5;  //  atanh(2^(-13))
    14     : atan = 64'h00000_0003FFFFFFF;  //  atanh(2^(-14))
    15     : atan = 64'h00000_00020000000;  //  atanh(2^(-15))
    16     : atan = 64'h00000_00010000000;  //  atanh(2^(-16))
    17     : atan = 64'h00000_00008000000;  //  atanh(2^(-17))
    18     : atan = 64'h00000_00004000000;  //  atanh(2^(-18))
    19     : atan = 64'h00000_00002000000;  //  atanh(2^(-19))
    20     : atan = 64'h00000_00001000000;  //  atanh(2^(-20))
    21     : atan = 64'h00000_00000800000;  //  atanh(2^(-21))
    22     : atan = 64'h00000_00000400000;  //  atanh(2^(-22))
    23     : atan = 64'h00000_00000200000;  //  atanh(2^(-23))
    24     : atan = 64'h00000_00000100000;  //  atanh(2^(-24))
    25     : atan = 64'h00000_00000080000;  //  atanh(2^(-25))
    26     : atan = 64'h00000_00000040000;  //  atanh(2^(-26))
    27     : atan = 64'h00000_00000020000;  //  atanh(2^(-27))
    28     : atan = 64'h00000_00000010000;  //  atanh(2^(-28))
    29     : atan = 64'h00000_00000008000;  //  atanh(2^(-29))
    30     : atan = 64'h00000_00000004000;  //  atanh(2^(-30))
    31     : atan = 64'h00000_00000002000;  //  atanh(2^(-31))
    32     : atan = 64'h00000_00000001000;  //  atanh(2^(-32))
    33     : atan = 64'h00000_00000000800;  //  atanh(2^(-33))
    34     : atan = 64'h00000_00000000400;  //  atanh(2^(-34))
    35     : atan = 64'h00000_00000000200;  //  atanh(2^(-35))
    36     : atan = 64'h00000_00000000100;  //  atanh(2^(-36))
    37     : atan = 64'h00000_00000000080;  //  atanh(2^(-37))
    38     : atan = 64'h00000_00000000040;  //  atanh(2^(-38))
    39     : atan = 64'h00000_00000000020;  //  atanh(2^(-39))
    40     : atan = 64'h00000_00000000010;  //  atanh(2^(-40))
    41     : atan = 64'h00000_00000000008;  //  atanh(2^(-41))
    42     : atan = 64'h00000_00000000004;  //  atanh(2^(-42))
    43     : atan = 64'h00000_00000000002;  //  atanh(2^(-43))
    44     : atan = 64'h00000_00000000001;  //  atanh(2^(-44))
    default: atan = 64'h00000_00000000000;
  endcase
end

endmodule
