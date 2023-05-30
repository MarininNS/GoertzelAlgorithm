module clk_div (
  input  clk_i,
  output clk_o 
);

logic clkt1 = 0;
logic clkt2 = 0;

always_ff @(posedge clk_i) clkt1 <= ~clkt1;
always_ff @(posedge clkt1) clkt2 <= ~clkt2;

assign clk_o = clkt2;

endmodule