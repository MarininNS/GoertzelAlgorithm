module Cordic #(
  parameter NF = 11
)(
  // CLK&RST
  input                              rstn ,
  input                              clk  ,
  // CTRL
  input                              en   ,
  output logic                       ready,
  // DATA
  input        signed [NF-1:0][31:0] ang_i,
  output logic signed [NF-1:0][31:0] cos_o,
  output logic signed [NF-1:0][31:0] sin_o,
  output logic signed [NF-1:0][31:0] alpha
);

logic signed [31:0] PI       = 32'h03_243F6A; // (8.24)
logic signed [31:0] PI2      = 32'h01_921FB5; // (8.24)
logic signed [31:0] COEF_DEF = 32'h00_9B74ED; // (0.32)
logic signed [63:0] ZERO     = 64'h0        ; // (0.32)

logic signed         [31:0] ang  ;
logic signed         [31:0] cos  ;
logic signed         [31:0] sin  ;  
logic signed [NF-1:0][63:0] cos_m;
logic signed [NF-1:0][63:0] sin_m;
logic                [8 :0] indx0;
logic                [8 :0] indx1;
logic                [31:0] atan ;
logic                       init ;
logic                       norm ;
logic                [1 :0] quad ;

always_ff @(posedge clk) begin
  if (!rstn) begin
    ready <= 0;
    cos   <= 32'h01_000000;
    sin   <= 32'h00_000000;
    sin_m <= 0;
    cos_m <= 0;
    indx0 <= 0;
    indx1 <= 0;
    init  <= 0;
    norm  <= 0;
    quad  <= 0;
  end
  else if (en && !init) begin
    ang  <= ang_i[indx0];
    init <= 1;
  end
  else if (en && !norm) begin
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
    norm <= 1;
  end
  else if (en && !ready) begin
    if (indx0 < NF) begin
      if (indx1 < 23) begin
        if (ang[31] == 0) begin
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
      else begin
        if (quad == 2'b10) begin
          cos_m[indx0] <= ZERO - cos * COEF_DEF;
          sin_m[indx0] <= ZERO - sin * COEF_DEF;
        end
        else if (quad == 2'b01) begin
          cos_m[indx0] <= ZERO - sin * COEF_DEF;
          sin_m[indx0] <= cos * COEF_DEF;
        end
        else begin
          cos_m[indx0] <= cos * COEF_DEF;
          sin_m[indx0] <= sin * COEF_DEF;
        end
        cos          <= 32'h01_000000 ;
        sin          <= 32'h00_000000 ;
        indx0        <= indx0 + 1     ;
        indx1        <= 0             ;
        init         <= 0             ;
        norm         <= 0             ;
      end
    end
    else begin
      ready <= 1;
    end
  end
end

genvar gvar;
generate
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin
    assign cos_o[gvar] = {cos_m[gvar][63], cos_m[gvar][54:24]};
    assign sin_o[gvar] = {sin_m[gvar][63], sin_m[gvar][54:24]};
    assign alpha[gvar] = {cos_m[gvar][63], cos_m[gvar][53:23]};
  end
endgenerate

always_comb begin
  case (indx1)
    0      : atan = 32'h00_C90FDA;  //  atanh(2^(-0))
    1      : atan = 32'h00_76B19C;  //  atanh(2^(-1))
    2      : atan = 32'h00_3EB6EB;  //  atanh(2^(-2))
    3      : atan = 32'h00_1FD5BA;  //  atanh(2^(-3))
    4      : atan = 32'h00_0FFAAD;  //  atanh(2^(-4))
    5      : atan = 32'h00_07FF55;  //  atanh(2^(-5))
    6      : atan = 32'h00_03FFEA;  //  atanh(2^(-6))
    7      : atan = 32'h00_01FFFD;  //  atanh(2^(-7))
    8      : atan = 32'h00_00FFFF;  //  atanh(2^(-8))
    9      : atan = 32'h00_007FFF;  //  atanh(2^(-9))
    10     : atan = 32'h00_003FFF;  //  atanh(2^(-10))
    11     : atan = 32'h00_001FFF;  //  atanh(2^(-11))
    12     : atan = 32'h00_000FFF;  //  atanh(2^(-12))
    13     : atan = 32'h00_0007FF;  //  atanh(2^(-13))
    14     : atan = 32'h00_0003FF;  //  atanh(2^(-14))
    15     : atan = 32'h00_0001FF;  //  atanh(2^(-15))
    16     : atan = 32'h00_0000FF;  //  atanh(2^(-16))
    17     : atan = 32'h00_00007F;  //  atanh(2^(-17))
    18     : atan = 32'h00_00003F;  //  atanh(2^(-18))
    19     : atan = 32'h00_00001F;  //  atanh(2^(-19))
    20     : atan = 32'h00_00000F;  //  atanh(2^(-20))
    21     : atan = 32'h00_000007;  //  atanh(2^(-21))
    22     : atan = 32'h00_000003;  //  atanh(2^(-22))
    23     : atan = 32'h00_000001;  //  atanh(2^(-23))
    default: atan = 32'h00_000000;
  endcase
end


endmodule
