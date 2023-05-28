module DataScale (
  // CLK&RST
  input                      rstn  ,
  input                      clk   ,
  // CTRL
  input                      enable,
  output logic               valid ,
  input                      mode  ,
  // DATA
  input               [7 :0] data_i,
  output logic signed [31:0] data_o 
); 

logic [31:0] SCALE_COEF = 32'h00_0D0000; // 13/256 (8.24)
logic [31:0] data  ;
logic [63:0] data_m;

logic enable_syn;
logic enable_old;
logic enable_re ;

assign data   = {data_i, 24'h00};
assign data_o = data_m[55:24]   ;

resync_data #(
  .NUM_STAGE(2)
) u_resync_enable (
  .rstn  (rstn      ),
  .clk   (clk       ),
  .data_i(enable    ),
  .data_o(enable_syn) 
);

always_ff @(negedge clk, negedge rstn) begin
  if (!rstn) begin
    valid      <= 0;
    data_m     <= 0;
    enable_old <= 0;
    enable_re  <= 0;
  end
  else begin

    enable_old <= enable_syn;
    enable_re  <= ((enable_old == 1'b0) && (enable_syn == 1'b1));

    if (enable_re || mode) begin
      valid  <= enable           ;
      data_m <= SCALE_COEF * data;
    end
    else begin
      valid  <= 0;
      data_m <= 1;
    end

  end
end

endmodule