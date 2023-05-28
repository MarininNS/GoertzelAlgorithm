module Angel #(
  parameter NF = 11
)(
  input                              rstn      ,
  input                              clk       ,
  input                              en        ,
  output logic                       valid     ,
  input               [NF-1:0][63:0] k_arr_i   , // (20.44)
  input                       [63:0] ang_coef_i, // (20.44)
  output logic signed [NF-1:0][63:0] angel_o     // (20.44)
);
    
logic        [7 :0] indx ;
logic signed [63:0] mul_a; // (20.44)
logic signed [63:0] mul_b; // (20.44)
logic signed [63:0] mul_c; // (20.44)

assign mul_a = ang_coef_i ;
assign mul_b = (indx < NF) ? k_arr_i[indx] : 0;

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