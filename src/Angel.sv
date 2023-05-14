module Angel #(
  parameter NF = 11
)(
  input                       rstn   ,
  input                       clk    ,
  input                       en     ,
  output logic                valid  ,
  input        [NF-1:0][31:0] freq_i ,
  output logic [NF-1:0][63:0] angel_o 
);
    
// logic signed [31:0] ANGEL_COEF = 32'h019B_C65b; // 2*pi/1000 (20.44)
logic signed [31:0] ANGEL_COEF = 32'h00000_00041E24C11; // 2*pi/100000 (20.44)

logic signed [NF-1:0][63:0] k_arr; // (20.40)
logic                [7 :0] indx ;

genvar gvar;
generate
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin
    assign k_arr[gvar] = {freq_i[gvar][19:0], {44{1'b0}}} >> 1;
  end
endgenerate

logic signed [63:0] mul_a;
logic signed [63:0] mul_b;
logic signed [63:0] mul_c;

assign mul_a = ANGEL_COEF ;
assign mul_b = k_arr[indx];

mult_sign #(
  .DW    (64),
  .INT1_I(20),
  .INT2_I(20),
  .INT3_O(20) 
) u_mult_sign (
  .a_in (mul_a),
  .b_in (mul_b),
  .c_out(mul_c),
  .c_ful(     ) 
);

always_ff @(posedge clk, negedge rstn) begin
    if (!rstn) begin
      valid   <= 0;
      angel_o <= 0;
      indx    <= 0;
    end
    else if (en && !valid) begin
      if (indx < NF) begin
        angel_o[indx] <= mul_c   ;
        indx          <= indx + 1;
      end
      else begin
        valid <= 1;
      end
    end
end

endmodule