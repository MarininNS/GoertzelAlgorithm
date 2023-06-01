module mult_sign #(
  parameter DW     = 32, // 
  parameter INT1_I = 32, // (32.0)
  parameter INT2_I = 32, // (32.0)
  parameter INT3_O = 32  // (32.0)
) (
  input                    rstn ,
  input                    clk  ,
  input                    en   ,
  input  signed [DW-1  :0] a_in , // (INT1_I.FRQ1_I)
  input  signed [DW-1  :0] b_in , // (INT2_I.FRQ2_I)
  output                   valid,
  output signed [DW-1  :0] c_out, // (INT3_O.FRQ3_O)
  output signed [DW*2-1:0] c_ful  // (INT3_O.FRQ3_O)
);

localparam FRQ1_I  = DW     - INT1_I; // 
localparam FRQ2_I  = DW     - INT2_I; // 
localparam FRQ3_O  = DW     - INT3_O; // 16
localparam INT3    = INT1_I + INT2_I; // 20
localparam FRQ3    = DW     - INT3_O; // 44

logic signed [DW*2-1:0] c; // (INT3.FRQ3)

assign c_out = {c[DW*2-1], c[DW*2-INT3+INT3_O-2:DW*2-INT3], c[DW*2-INT3-1:DW*2-INT3-FRQ3_O]};
assign c_ful = c;

Booth_Multiplier_1xA #(
  .N(DW)
) u_Booth_Multiplier_1xA (
  .Rst  (rstn ),
  .Clk  (clk  ),
  .Ld   (en   ),
  .M    (a_in ),
  .R    (b_in ),
  .Valid(valid),
  .P    (c    ) 
);

endmodule