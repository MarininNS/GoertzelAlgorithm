module Angel #(
  parameter NF = 11
)(
  input                       rstn   ,
  input                       clk    ,
  input                       en     ,
  output logic                valid  ,
  input        [NF-1:0][31:0] freq_i ,
  output logic [NF-1:0][31:0] angel_o 
);
    
// logic signed [31:0] ANGEL_COEF = 32'h019B_C65b; // 2*pi/1000 (0.32)
logic signed [31:0] ANGEL_COEF = 32'h0004_1E24; // 2*pi/100000 (0.32)

logic signed [NF-1:0][31:0] k_arr; // (32.0)
logic signed [NF-1:0][63:0] angel; // (32.32)
logic                [7 :0] indx ;

genvar gvar1;
generate
  for (gvar1 = 0; gvar1 < NF; gvar1 = gvar1 + 1) begin
    assign k_arr[gvar1] = freq_i[gvar1] >> 1;
  end
endgenerate

genvar gvar2;
generate
  for (gvar2 = 0; gvar2 < NF; gvar2 = gvar2 + 1) begin
    assign angel_o[gvar2] = angel[gvar2][39:8];
  end
endgenerate

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) begin
      valid <= 0;
      angel <= 0;
      indx  <= 0;
    end
    else if (en && !valid) begin
      if (indx < NF) begin
        angel[indx] <= k_arr[indx] * ANGEL_COEF;
        indx        <= indx + 1;
      end
      else begin
        valid <= 1;
      end
    end
end

endmodule