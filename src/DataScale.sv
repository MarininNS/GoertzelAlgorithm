module DataScale (
  // CLK&RST
  input                      rstn  ,
  input                      clk   ,
  // CTRL
  input                      enable,
  output logic               valid ,
  input                      mode  ,
  // DATA
  input               [7 :0] data_i, // (8.0)
  output logic signed [63:0] data_o  // (32.32)
); 

logic [7 :0] SCALE_COEF = 8'h0D; // 13/256 (0.8)
logic [15:0] data_m; // (8.8)

logic enable_syn;
logic enable_old;
logic enable_re ;

assign data_o = {24'h0, data_m[15:0], 24'h0};

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
      data_m <= SCALE_COEF * data_i;
    end
    else begin
      valid  <= 0;
      data_m <= 1;
    end

  end
end

endmodule