`timescale 1ps/1ps

module Cordic_tb;

localparam CLK_PER = 10;
localparam SIM_TIM = 100000;

logic               rstn    ;
logic               clk     ;
logic               en      ;
logic               ready   ;
logic signed [31:0] alpha   ;
logic signed [31:0] coefW_re;
logic signed [31:0] coefW_im;
logic signed [31:0] data_i  ;
logic signed [31:0] data_o  ;

FourierTransform #(
  .NUM_SAMPLE(50000)
) DUT (
  .rstn    (rstn    ),
  .clk     (clk     ),
  .en      (en      ),
  .ready   (ready   ),
  .alpha   (alpha   ),
  .coefW_re(coefW_re),
  .coefW_im(coefW_im),
  .data_i  (data_i  ),
  .data_o  (data_o  ) 
); 

initial begin
  clk = 0;
  forever #(CLK_PER) clk = ~clk;
end

initial begin
  en    = 1;

  rstn  = 0;
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
