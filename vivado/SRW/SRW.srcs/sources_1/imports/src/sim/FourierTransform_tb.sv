module tb_FourierTransform;

localparam SIM_TIM    = 2000000;
localparam CLK_PERIOD = 10    ;
localparam NF         = 11    ;
localparam NS         = 1000;

logic                       rstn  ;
logic                       clk   ;
logic                       cEn   ;
logic                       hEn   ;
logic        [NF-1:0]       ready ;
logic                [7 :0] sample;
logic signed [NF-1:0][31:0] data_o;

FourierTransform #(
  .NF(NF),
  .NS(NS) 
) DUT (
  .rstn  (rstn  ),
  .clk   (clk   ),
  .cEn   (cEn   ),
  .hEn   (hEn   ),
  .ready (ready ),
  .sample(sample),
  .data_o(data_o)
);

integer fd_r_s; 
integer fd_w_v; 
integer fd_w_c; 
integer fd_w_s; 

always #(CLK_PERIOD/2) clk=~clk;

initial begin
  clk    = 0;
  rstn   = 0;
  cEn    = 1;
  hEn    = 0;
  sample = 0;
  repeat(5) @(posedge clk);
  rstn = 1;
end

initial begin
  fd_r_s = $fopen("D:/Desktop/Study_now/SRW/Fourier_Transform/src/sim/sample.csv", "r");
  if (fd_r_s == 0) $finish;
  fd_w_v = $fopen("D:/Desktop/Study_now/SRW/Fourier_Transform/src/sim/vector.csv", "w");
  if (fd_w_v == 0) $finish;
  fd_w_c = $fopen("D:/Desktop/Study_now/SRW/Fourier_Transform/src/sim/cos.csv", "w");
  if (fd_w_c == 0) $finish;
  fd_w_s = $fopen("D:/Desktop/Study_now/SRW/Fourier_Transform/src/sim/sin.csv", "w");
  if (fd_w_s == 0) $finish;
end


initial begin
  wait(DUT.u_Cordic.ready);
  for (int i = 0; i < NF; i = i + 1) begin
    $fwrite(fd_w_c, "%h\n", DUT.u_Cordic.cos_o[i]);
    $fwrite(fd_w_s, "%h\n", DUT.u_Cordic.sin_o[i]);
  end
end

initial begin
  wait(DUT.ready1);
  $fscanf(fd_r_s, "%d\n", sample);
  @(posedge clk);
  hEn = 1;

  fork
    begin 
      while (!$feof(fd_r_s)) begin
        @(posedge clk);
        $fscanf(fd_r_s, "%d\n", sample);
        $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
      end
      @(&ready);
    end
    begin
      #(SIM_TIM);
    end
  join_any

  $fwrite(fd_w_v, "%h\n", DUT.herzel[10].u_Herzel.vm1);
  $fclose(fd_r_s);
  $fclose(fd_w_v);
  $fclose(fd_w_c);
  $fclose(fd_w_s);
  #(5000) $stop;
end

endmodule
