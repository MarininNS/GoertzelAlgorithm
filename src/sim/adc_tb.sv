`timescale 1ns/1ns

module adc_tb;

localparam CLK_PER = 5;

logic       nrst  ;
logic       clk   ;
logic       ready ;
logic       valid ;
logic [7:0] sample;

adc #(
  .MW(5000)
) DUT (
  .nrst  (nrst  ),
  .clk   (clk   ),
  .ready (ready ),
  .valid (valid ), 
  .sample(sample)
);

initial forever #(CLK_PER/2) clk=~clk;

initial begin
  clk   = 0;
  nrst  = 0;
  ready = 0;
  repeat(5) @(posedge clk);
  nrst = 1;
  #1000;
  ready = 1;
end

endmodule