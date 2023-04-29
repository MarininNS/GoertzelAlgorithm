module FourierTransform #(
  parameter NF = 11, // NUM_FREQ
  parameter NS = 10  // NUM_SAMPLE

) (
  // CLK&RST
  input                              rstn  ,
  input                              clk   ,
  // CTRL               
  input                              cEn   ,
  input                              hEn   ,
  output logic        [NF-1:0]       ready ,
  // DATA
  input                       [7 :0] sample,
  output logic signed [NF-1:0][31:0] data_o
);

logic        [NF-1:0][31:0] freq_arr ; // (32.0)
logic signed [NF-1:0][31:0] angel_arr;
logic signed [NF-1:0][31:0] coefW_re ;
logic signed [NF-1:0][31:0] coefW_im ;
logic signed [NF-1:0][31:0] alpha    ;
logic signed         [31:0] data     ;

logic ready0     ;
logic ready1     ;
logic herzelEn   ;

assign herzelEn = ready1 && hEn; 

Angel #(
  .NF(NF)
) u_Angel (
  .rstn   (rstn     ),
  .clk    (clk      ),
  .en     (cEn      ),
  .ready  (ready0   ),
  .freq_i (freq_arr ),
  .angel_o(angel_arr) 
);

Cordic #(
  .NF(NF)
) u_Cordic (
  .rstn (rstn     ),
  .clk  (clk      ),
  .en   (ready0   ),
  .ready(ready1   ),
  .ang_i(angel_arr),
  .cos_o(coefW_re ),
  .sin_o(coefW_im ),
  .alpha(alpha    )
);

DataScale u_DataScale (
  .rstn  (rstn    ),
  .clk   (clk     ),
  .data_i(sample  ),
  .data_o(data    ) 
);

logic enn = 0;
always_ff @(posedge clk, negedge rstn) if (herzelEn) enn <= 1;

genvar gvar;
generate 
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin : herzel
    Herzel #(
      .NF(NF),
      .NS(NS) 
    ) u_Herzel (
      .rstn   (rstn          ),
      .clk    (clk           ),
      .en     (enn           ),
      .ready  (ready[gvar]   ),
      .alpha_i(alpha[gvar]   ),
      .cW_re_i(coefW_re[gvar]),
      .cW_im_i(coefW_im[gvar]),
      .data_i (data          ),
      .data_o (data_o[gvar]  ) 
    ); 
  end
endgenerate

initial begin
  freq_arr[0 ] = 32'd6     ;
  freq_arr[1 ] = 32'd60    ;
  freq_arr[2 ] = 32'd80    ;
  freq_arr[3 ] = 32'd100   ;
  freq_arr[4 ] = 32'd200   ;
  freq_arr[5 ] = 32'd300   ;
  freq_arr[6 ] = 32'd400   ; 
  freq_arr[7 ] = 32'd500   ; 
  freq_arr[8 ] = 32'd600   ; 
  freq_arr[9 ] = 32'd800   ; 
  freq_arr[10] = 32'd1000  ; 
end

endmodule