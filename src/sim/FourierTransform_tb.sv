`timescale 1ns/1ns
`include "./FourierTransformAM.sv"

module FourierTransform_tb;

localparam CLK_PER     = 10  ;
localparam ADC_CLK_PER = 100 ;
localparam SPI_CLK_PER = 1000;
localparam NF          = 14  ;

logic ok   ;

integer fd_r_s; 
integer fd_r_f; 
integer fd_r_d; 
integer fd_r_l; 
integer fd_w_v;
integer fd_w_r;

spi_if #(.SPI_CLK_PER(SPI_CLK_PER), .DISPLAY(1)) spi_if();

logic [31:0] spi_data;
logic [31:0] spi_stat;

logic [NF-1:0][31:0] mcad_freq;
logic [NF-1:0][31:0] mcad_data;
logic [NF-1:0][31:0] mcad_flog;
logic [NF-1:0][31:0] vlog_data;

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

assign spi_sck     = spi_if.mst.sck ;
assign spi_ss_n    = spi_if.mst.ss_n;
assign spi_mosi    = spi_if.mst.mosi;
assign spi_if.miso = spi_miso       ;

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
  .NF(NF) 
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
  fd_r_f = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/freq.csv", "r");
  if (fd_r_f == 0) $finish;
  fd_r_d = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/data.csv", "r");
  if (fd_r_d == 0) $finish;
  fd_r_l = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/logic.csv", "r");
  if (fd_r_l == 0) $finish;
  fd_w_v = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/vector.csv", "w");
  if (fd_w_v == 0) $finish;
  fd_w_r = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/result.csv", "w");
  if (fd_w_r == 0) $finish;
end
final begin
  $fclose(fd_r_s);
  $fclose(fd_r_f);
  $fclose(fd_r_d);
  $fclose(fd_r_l);
  $fclose(fd_w_v);
  $fclose(fd_w_r);
end

initial begin
  @(posedge enable_p);
  while (!(DUT.herzel[9].u_Herzel.valid)) begin
    @(posedge clk);
    $fwrite(fd_w_v, "%h\n", DUT.herzel[8].u_Herzel.vm1);
  end
  $fwrite(fd_w_v, "%h\n", DUT.herzel[8].u_Herzel.vm1);
end

initial begin
  for (int i = 0; i < NF; i = i + 1) begin
    $fscanf(fd_r_f, "%d\n", mcad_freq[i]);
  end
  for (int i = 0; i < NF; i = i + 1) begin
    $fscanf(fd_r_d, "%d\n", mcad_data[i]);
    mcad_data[i] = mcad_data[i] * 32'h1_0000;
  end
  for (int i = 0; i < NF; i = i + 1) begin
    $fscanf(fd_r_l, "%d\n", mcad_flog[i]);
  end
end

task end_of_test();
  if (ok)
    $display("[%010t] TEST SUCCESS", $time);
  else
    $display("[%010t] TEST FAILED", $time);
  $display("Result:");
  for (int i = 0; i < NF; i = i + 1) begin
    if (mcad_flog[i] == 1) begin
      $display("  %02d: %05d. MCAD - %08h, VLOG - %08h", i, mcad_freq[i], mcad_data[i], vlog_data[i]);
    end
  end
endtask

// task test_spi_rw_regs();
//   logic      [31:0] spi_rdata1;
//   logic      [31:0] spi_rdata2;
//   logic      [31:0] spi_wdata1;
//   logic      [31:0] spi_wdata2;
//   logic [5:0][31:0] spi_stat  ;
//   spi_wdata1 = 32'h3202_4003;
//   spi_wdata2 = 32'h0F0F_0F0F;
//   spi_if.read_data (VERSION, spi_rdata1, spi_stat);
//   spi_if.read_data (DEBUG  , spi_rdata2, spi_stat);
//   spi_if.write_data(VERSION, spi_wdata1, spi_stat);
//   spi_if.write_data(DEBUG  , spi_wdata2, spi_stat);
//   spi_if.read_data (VERSION, spi_rdata1, spi_stat);
//   spi_if.read_data (DEBUG  , spi_rdata2, spi_stat);
//   for (int i=0; i<6; i=i+1)
//     if (|(spi_stat[i])) begin
//       $display("[%010t] SPI status failed! index - %0d", $time, i);
//       ok = 0;
//     end 
//   if (spi_rdata1 != spi_wdata1) begin
//     $display("[%010t] SPI rw failed! write - 0x%0h, read - 0x%0h", $time, spi_wdata1, spi_rdata1);
//     ok = 0;
//   end
//   if (spi_rdata2 != spi_wdata2) begin
//     $display("[%010t] SPI rw failed! write - 0x%0h, read - 0x%0h", $time, spi_wdata2, spi_rdata2);
//     ok = 0;
//   end
// endtask

task herzel_wait_all_valid();
  while (spi_data&STATUS_HERZEL_MSK != STATUS_HERZEL_MSK) begin
    spi_if.read_data(STATUS, spi_data, spi_stat);
  end
endtask

task herzel();
  spi_if.write_data(EN_CORDIC, 1       , spi_stat);
  spi_if.read_data (STATUS   , spi_data, spi_stat);
  while (!(spi_data&STATUS_CORDIC_MSK)) begin
    spi_if.read_data(STATUS, spi_data, spi_stat);
  end
  @(posedge clk);
  if (fd_r_s != 0)
    $fclose(fd_r_s);
  fd_r_s = $fopen("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/sample.csv", "r");
  if (DUT.u_DataScale.mode == 1) begin
    $fscanf(fd_r_s, "%d\n", sample_p);
    enable_p = 1;
    while (!$feof(fd_r_s)) begin
      @(posedge clk);
      $fscanf(fd_r_s, "%d\n", sample_p);
    end
    enable_p = 0;
  end
  else begin
    while (!$feof(fd_r_s)) begin
      #(ADC_CLK_PER/2);
      enable_p = 1;
      $fscanf(fd_r_s, "%d\n", sample_p);
      #(ADC_CLK_PER/2);
      enable_p = 0;
    end
  end
  herzel_wait_all_valid();
endtask

initial begin
  ok        = 1;
  clk       = 0;
  rstn      = 0;
  enable_p  = 0;
  sample_p  = 0;
  spi_data  = 0;
  vlog_data = 0;
  spi_if.init();
  repeat(5) @(posedge clk);
  rstn = 1;
  repeat(20) @(posedge clk);

  spi_if.write_data(NUM_SAMP , 32'd5000, spi_stat);
  spi_if.write_data(SAMP_FREQ, 32'd100000, spi_stat);
  spi_if.write_data(MODE     , 32'd1, spi_stat);

  $display("[%010t] Write freq", $time);
  for (int i = 0; i < NF; i = i + 1) begin
    spi_if.write_data(FREQ_1 + 32'h4*i, mcad_freq[i], spi_stat);
  end
  
  repeat(1) begin
    spi_if.write_data(RESET_ALL, 32'd1, spi_stat);
    repeat(5) @(posedge clk);
    spi_if.write_data(RESET_ALL, 32'd0, spi_stat);

    $display("[%010t] Start Herzel", $time);
    herzel();

    $display("[%010t] Read result", $time);
    for (int i = 0; i < NF; i = i + 1) begin
      spi_if.read_data(DATA_1 + 32'h4*i, vlog_data[i], spi_stat);
      $fwrite(fd_w_r, "%d\n", vlog_data[i][31:16]);
    end

    $display("[%010t] Start check", $time);
    for (int i = 0; i < NF; i = i + 1) begin
      if (mcad_flog[i] == 1) begin
        if ((vlog_data[i] < mcad_data[i]*0.95) | (vlog_data[i] > mcad_data[i]*1.05)) begin
          $display("[%010t] Error at freq %0d: %0d. MCAD - %0h, VLOG - %0h", $time, i, mcad_freq[i], mcad_data[i], vlog_data[i]);
          ok = 0;
        end
      end
    end
  end

  # 5000;
  end_of_test();
  $stop;
end

endmodule
