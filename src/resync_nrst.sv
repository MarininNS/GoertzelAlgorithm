module resync_nrst #(
  parameter NUM_STAGE = 3
) (
  input  clk   ,
  input  rstn_i,
  output rstn_o 
);

logic [NUM_STAGE-1:0] nrst_stg;

always_ff @(posedge clk, negedge rstn_i) begin
  if (!rstn_i) begin
    nrst_stg <= 0;
  end
  else begin
    nrst_stg <= {nrst_stg[NUM_STAGE-2:0], 1'b1};
  end
end

assign rstn_o = nrst_stg[NUM_STAGE-1];

endmodule