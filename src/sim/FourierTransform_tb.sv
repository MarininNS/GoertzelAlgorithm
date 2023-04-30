`timescale 1ns/1ps

module tb_FourierTransform;

localparam SIM_TIM     = 20000000;
localparam CLK_PER     = 5     ;
localparam SPI_CLK_PER = 1000  ;
localparam NF          = 11    ;
localparam NS          = 1000;

integer fd_r_s; 
integer fd_w_v; 
integer fd_w_c; 
integer fd_w_s; 

spi_if #(.SPI_CLK_PER(SPI_CLK_PER)) spi_if();

logic [31:0] spi_data;
logic [31:0] spi_stat;

logic                       rstn    ;
logic                       clk     ;
logic                       spi_sck ; 
logic                       spi_ss_n; 
logic                       spi_mosi; 
logic                       spi_miso; 
logic                       cEn     ;
logic                       hEn     ;
logic        [NF-1:0]       valid   ;
logic                [7 :0] sample  ;
logic signed [NF-1:0][31:0] data_o  ;

FourierTransform #(
  .NF(NF),
  .NS(NS) 
) DUT (
  .rstn    (rstn    ),
  .clk     (clk     ),
  .spi_sck (spi_sck ),
  .spi_ss_n(spi_ss_n),
  .spi_mosi(spi_mosi),
  .spi_miso(spi_miso),
  .cEn     (cEn     ),
  .hEn     (hEn     ),
  .valid   (valid   ),
  .sample  (sample  ),
  .data_o  (data_o  )
);

assign spi_sck         = spi_if.mst.sck ;
assign spi_ss_n        = spi_if.mst.ss_n;
assign spi_mosi        = spi_if.mst.mosi;
assign spi_if.mst.miso = spi_miso       ;

initial forever #(CLK_PER/2) clk=~clk;

initial begin
  fd_r_s = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/sample.csv", "r");
  if (fd_r_s == 0) $finish;
  fd_w_v = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/vector.csv", "w");
  if (fd_w_v == 0) $finish;
  fd_w_c = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/cos.csv", "w");
  if (fd_w_c == 0) $finish;
  fd_w_s = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/sin.csv", "w");
  if (fd_w_s == 0) $finish;
end

initial begin
  wait(DUT.valid_cordic);
  for (int i = 0; i < NF; i = i + 1) begin
    $fwrite(fd_w_c, "%h\n", DUT.u_Cordic.cos_o[i]);
    $fwrite(fd_w_s, "%h\n", DUT.u_Cordic.sin_o[i]);
  end
end

initial begin
  clk    = 0;
  rstn   = 0;
  cEn    = 1;
  hEn    = 0;
  sample = 0;
  spi_if.init();
  repeat(5) @(posedge clk);
  rstn = 1;

  # 10_000;
  spi_if.read_data(32'h0000_0004, spi_data, spi_stat);
  # 10_000;
  spi_if.read_data(32'h0000_0008, spi_data, spi_stat);
  # 10_000;
  spi_if.write_data(32'h0000_0004, 32'h32024003, spi_stat);
  # 10_000;
  spi_if.write_data(32'h0000_0008, 32'h0F0F_0F0F, spi_stat);
  # 10_000;
  spi_if.read_data(32'h0000_0004, spi_data, spi_stat);
  # 10_000;
  spi_if.read_data(32'h0000_0008, spi_data, spi_stat);
  # 10_000;

  wait(DUT.valid_cordic);
  $fscanf(fd_r_s, "%d\n", sample);
  @(posedge clk);
  hEn = 1;
  while (!$feof(fd_r_s)) begin
    @(posedge clk);
    $fscanf(fd_r_s, "%d\n", sample);
    $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
  end
  @(&valid);

  $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
  $fclose(fd_w_v);
  $fclose(fd_w_c);
  $fclose(fd_w_s);
  $fclose(fd_r_s);
  #(5000) $stop;
end

endmodule
