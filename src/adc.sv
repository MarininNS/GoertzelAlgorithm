module adc #(
  parameter MW = 5000
) (
  input              nrst  ,
  input              clk   ,
  input              ready ,
  output logic       valid , 
  output logic [7:0] sample,
  output logic       led
);

logic nrst_syn ;
logic ready_syn;

logic [7 :0] memory [MW-1:0];
logic [31:0] addr;
logic        en  ;
logic [31:0] cntr;

resync_nrst u_resync_nrst (
  .clk   (clk     ),
  .rstn_i(nrst    ),
  .rstn_o(nrst_syn) 
);

resync_data u_resync_data (
  .rstn  (nrst_syn ),
  .clk   (clk      ),
  .data_i(ready    ),
  .data_o(ready_syn) 
);

initial begin
  $readmemb("D:/Desktop/Study_now/SRW/GoertzelAlgorithm/src/sim/data/sample_bin.csv", memory);
end

always_ff @(posedge clk, negedge nrst_syn) begin
  if (!nrst_syn) begin
    cntr <= 0;
    en   <= 0;
    led <= 0;
  end
  else begin
    led <= 1;
    if (cntr < 250) begin
      cntr <= cntr + 1;
      en   <= 0;
    end
    else begin
      cntr <= 0;
      en   <= 1;
    end
  end
end

always_ff @(posedge clk, negedge nrst_syn) begin
  if (!nrst_syn) begin
    valid  <= 0;
    sample <= 0;
    addr   <= 0;
  end
  else begin
    if (ready_syn && en && addr < MW) begin
      valid  <= 1;
      sample <= memory[addr];
      addr   <= addr + 1;
    end
    else if (cntr > 20) begin
      valid  = 0;
      sample = 0;
    end
  end
end

endmodule