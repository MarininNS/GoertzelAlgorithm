`timescale 1ns/1ps
`include "./FourierTransformAM.sv"

module FourierTransform_tb;

localparam CLK_PER     = 5     ;
localparam SPI_CLK_PER = 1000  ;
localparam NF          = 11    ; // dont touch
localparam NS          = 100000  ; // dont touch

logic ok;

integer fd_r_s; 
integer fd_w_v; 
integer fd_w_c; 
integer fd_w_s; 

spi_if #(.SPI_CLK_PER(SPI_CLK_PER), .DISPLAY(1)) spi_if();

logic [31:0] spi_data;
logic [31:0] spi_stat;

logic        rstn    ;
logic        clk     ;
logic        spi_sck ;
logic        spi_ss_n;
logic        spi_mosi;
logic        spi_miso;
logic        enable_p;
logic        enable_n;
logic [7 :0] sample_p;
logic [7 :0] sample_n;

assign spi_sck         = spi_if.mst.sck ;
assign spi_ss_n        = spi_if.mst.ss_n;
assign spi_mosi        = spi_if.mst.mosi;
assign spi_if.mst.miso = spi_miso       ;

assign enable_n    = ~enable_p   ;
assign sample_n[0] = ~sample_p[0];
assign sample_n[1] = ~sample_p[1];
assign sample_n[2] = ~sample_p[2];
assign sample_n[3] = ~sample_p[3];
assign sample_n[4] = ~sample_p[4];
assign sample_n[5] = ~sample_p[5];
assign sample_n[6] = ~sample_p[6];
assign sample_n[7] = ~sample_p[7];

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
  .enable_p(enable_p),
  .enable_n(enable_n),
  .sample_p(sample_p),
  .sample_n(sample_n) 
);

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
final begin
  $fclose(fd_w_v);
  $fclose(fd_w_c);
  $fclose(fd_w_s);
  $fclose(fd_r_s);
end

initial begin
  wait(DUT.valid_cordic);
  for (int i = 0; i < NF; i = i + 1) begin
    $fwrite(fd_w_c, "%h\n", DUT.u_Cordic.cos_o[i]);
    $fwrite(fd_w_s, "%h\n", DUT.u_Cordic.sin_o[i]);
  end
end

task end_of_test();
  if (ok)
    $display("[%0t] TEST SUCCESS", $time);
  else
    $display("[%0t] TEST FAILED", $time);
endtask

task test_spi_rw_regs();
  logic      [31:0] spi_rdata1;
  logic      [31:0] spi_rdata2;
  logic      [31:0] spi_wdata1;
  logic      [31:0] spi_wdata2;
  logic [5:0][31:0] spi_stat  ;
  spi_wdata1 = 32'h3202_4003;
  spi_wdata2 = 32'h0F0F_0F0F;
  spi_if.read_data (VERSION, spi_rdata1, spi_stat);
  spi_if.read_data (DEBUG  , spi_rdata2, spi_stat);
  spi_if.write_data(VERSION, spi_wdata1, spi_stat);
  spi_if.write_data(DEBUG  , spi_wdata2, spi_stat);
  spi_if.read_data (VERSION, spi_rdata1, spi_stat);
  spi_if.read_data (DEBUG  , spi_rdata2, spi_stat);
  for (int i=0; i<6; i=i+1)
    if (|(spi_stat[i])) begin
      $display("[%0t] SPI status failed! index - %0d", $time, i);
      ok = 0;
    end 
  if (spi_rdata1 != spi_wdata1) begin
    $display("[%0t] SPI rw failed! write - 0x%0h, read - 0x%0h", $time, spi_wdata1, spi_rdata1);
    ok = 0;
  end
  if (spi_rdata2 != spi_wdata2) begin
    $display("[%0t] SPI rw failed! write - 0x%0h, read - 0x%0h", $time, spi_wdata2, spi_rdata2);
    ok = 0;
  end
endtask

task herzel_wait_all_valid();
  while (spi_data&STATUS_HERZEL_ALL_MSK != STATUS_HERZEL_ALL_MSK) begin
    spi_if.read_data(STATUS, spi_data, spi_stat);
  end
endtask

task herzel();
  spi_if.read_data (EN_CORDIC, spi_data, spi_stat);
  spi_if.write_data(EN_CORDIC, 1       , spi_stat);
  spi_if.read_data (STATUS   , spi_data, spi_stat);
  while (!(spi_data&STATUS_CORDIC_MSK)) begin
    spi_if.read_data(STATUS, spi_data, spi_stat);
  end
  $fscanf(fd_r_s, "%d\n", sample_p);
  @(posedge clk);
  enable_p = 1;
  while (!$feof(fd_r_s)) begin
    @(posedge clk);
    $fscanf(fd_r_s, "%d\n", sample_p);
    $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
  end
  herzel_wait_all_valid();
  $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
endtask

initial begin
  ok       = 1;
  clk      = 0;
  rstn     = 0;
  enable_p = 0;
  sample_p = 0;
  spi_if.init();
  repeat(5) @(posedge clk);
  rstn = 1;

  spi_if.write_data(FREQ_1 , 1000 , spi_stat);
  spi_if.write_data(FREQ_2 , 1500 , spi_stat);
  spi_if.write_data(FREQ_3 , 2000 , spi_stat);
  spi_if.write_data(FREQ_4 , 3000 , spi_stat);
  spi_if.write_data(FREQ_5 , 4000 , spi_stat);
  spi_if.write_data(FREQ_6 , 5000 , spi_stat);
  spi_if.write_data(FREQ_7 , 6000 , spi_stat);
  spi_if.write_data(FREQ_8 , 7000 , spi_stat);
  spi_if.write_data(FREQ_9 , 8000 , spi_stat);
  spi_if.write_data(FREQ_10, 9000 , spi_stat);
  spi_if.write_data(FREQ_11, 10000, spi_stat);

  // test_spi_rw_regs();
  herzel();

  spi_if.read_data(DATA_1 , spi_data, spi_stat);
  spi_if.read_data(DATA_2 , spi_data, spi_stat);
  spi_if.read_data(DATA_3 , spi_data, spi_stat);
  spi_if.read_data(DATA_4 , spi_data, spi_stat);
  spi_if.read_data(DATA_5 , spi_data, spi_stat);
  spi_if.read_data(DATA_6 , spi_data, spi_stat);
  spi_if.read_data(DATA_7 , spi_data, spi_stat);
  spi_if.read_data(DATA_8 , spi_data, spi_stat);
  spi_if.read_data(DATA_9 , spi_data, spi_stat);
  spi_if.read_data(DATA_10, spi_data, spi_stat);
  spi_if.read_data(DATA_11, spi_data, spi_stat);

  # 5000;
  end_of_test();
  $stop;
end

endmodule
