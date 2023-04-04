`timescale 1ps/1ps

module Cordic_tb;

localparam CLK_PER = 10;
localparam SIM_TIM = 100000;

logic               rstn ;
logic               clk  ;
logic               en   ;
logic               ready;
logic signed [31:0] ang_i;
logic signed [31:0] cos_o;
logic signed [31:0] sin_o;

Cordic DUT (
  .rstn (rstn ),
  .clk  (clk  ),
  .en   (en   ),
  .ready(ready),
  .ang_i(ang_i),
  .cos_o(cos_o),
  .sin_o(sin_o)
);

initial begin
  clk = 0;
  forever #(CLK_PER) clk = ~clk;
end

initial begin
  en    = 1;

  rstn  = 0;
  ang_i = 32'h00_860A91; // 30 grad
  repeat(5) @(posedge clk);
  rstn  = 1;
  @(posedge ready);
  repeat(5) @(posedge clk);
  rstn  = 0;
  ang_i = 32'h01_921FB5; // 90 grad
  repeat(5) @(posedge clk);
  rstn  = 1;
  @(posedge ready);
  repeat(5) @(posedge clk);
  rstn  = 0;
  ang_i = 32'h00_000000; // 00 grad
  repeat(5) @(posedge clk);
  rstn  = 1;
  @(posedge ready);
  repeat(5) @(posedge clk);
  rstn  = 0;
  ang_i = 32'h01_41B2F7; // 72 grad
  repeat(5) @(posedge clk);
  rstn  = 1;

  fork
    begin
      #(SIM_TIM);
    end
    begin
      @(ready);
    end
  join_any

  #(50);
  $stop;
end

endmodule
