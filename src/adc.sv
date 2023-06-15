module adc (
    input  nrst ,
    input  clk  ,
    output led  
);

assign led = 1;

// always_ff @(posedge clk, negedge nrst) begin
//   if (!nrst) begin
//     led <= 1;
//   end
//   else begin
//     led <= 0; 
//   end
// end

endmodule