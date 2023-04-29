`timescale 1ps/1ps

module DataScale_tb;

localparam CLK_PER = 10;
localparam SIM_TIM = 100000;

logic               rstn  ;
logic               clk   ;
logic               en    ;
logic               ready ;
logic        [7 :0] data_i;
logic signed [31:0] data_o;

DataScale DUT(
  .rstn  (rstn  ),
  .clk   (clk   ),
  .en    (en    ),
  .ready (ready ),
  .data_i(data_i),
  .data_o(data_o) 
); 

initial begin
  clk = 0;
  forever #(CLK_PER) clk = ~clk;
end

initial begin
  en     = 1;
  data_i = 0;

  rstn   = 0;
  repeat(5) @(posedge clk);
  rstn   = 1;

  data_i = 8'hFF;
  #(50);

  repeat(10) begin 
    @(negedge clk);
    data_i = $urandom_range(0, 8'hFF);
  end

  // fork
  //   begin
  //     #(SIM_TIM);
  //   end
  //   begin
  //     @(ready);
  //   end
  // join_any

  #(50);
  $stop;
end

endmodule
