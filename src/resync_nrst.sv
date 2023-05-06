module resync_nrst #(
  parameter NUM_STAGE = 3
) (
  input  clk   ,
  input  nrst_i,
  output nrst_o 
);

logic [NUM_STAGE-1:0] nrst_stg;

always_ff @(posedge clk, negedge nrst_i) begin
  if (!nrst_i) begin
    nrst_stg <= 0;
  end
  else begin
    nrst_stg <= {nrst_stg[NUM_STAGE-2:0], 1'b1};
  end
end

assign nrst_o = nrst_stg[NUM_STAGE-1];

endmodule