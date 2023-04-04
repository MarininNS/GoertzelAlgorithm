module DataScale (
  // CLK&RST
  input                      rstn  ,
  input                      clk   ,
  // DATA
  input               [7 :0] data_i,
  output logic signed [31:0] data_o 
); 

logic [31:0] SCALE_COEF = 32'h00_0D0000; // 13/256 (8.24)
logic [31:0] data  ;
logic [63:0] data_m;

assign data   = {data_i, 24'h00};
assign data_o = data_m[55:24]   ;

always_ff @(posedge clk) begin
  if (!rstn) begin
    data_m <= 0;
  end
  else begin
    data_m <= SCALE_COEF * data;
  end
end

endmodule