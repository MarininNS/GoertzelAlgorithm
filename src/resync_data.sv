module resync_data #(
  parameter NUM_STAGE = 3,
  parameter DW        = 1 
) (
  input           rstn  ,
  input           clk   ,
  input  [DW-1:0] data_i,
  output [DW-1:0] data_o 
);

localparam STG_DW = NUM_STAGE * DW;

logic [STG_DW-1:0] data_stg;

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    data_stg <= 0;
  end
  else begin
    data_stg <= {data_stg[STG_DW-DW-1:0], data_i};
  end
end

assign data_o = data_stg[STG_DW-1:STG_DW-DW];

endmodule