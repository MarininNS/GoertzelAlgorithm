import axi_pkg::*;

module FourierTransform #(
  parameter NF = 11, // NUM_FREQ
  parameter NS = 10  // NUM_SAMPLE
) (
  // CLK&RST
  input                              rstn    ,
  input                              clk     ,
  // SPI
  input                              spi_sck , 
  input                              spi_ss_n, 
  input                              spi_mosi, 
  output                             spi_miso, 
  // CTRL               
  input                              cEn     ,
  input                              hEn     ,
  output logic        [NF-1:0]       valid   ,
  // DATA
  input                       [7 :0] sample  ,
  output logic signed [NF-1:0][31:0] data_o
);

logic        [NF-1:0][31:0] freq_arr ; // (32.0)
logic signed [NF-1:0][31:0] angel_arr;
logic signed [NF-1:0][31:0] coefW_re ;
logic signed [NF-1:0][31:0] coefW_im ;
logic signed [NF-1:0][31:0] alpha    ;
logic signed         [31:0] data     ;

logic valid_angel ;
logic valid_cordic;
logic en_herzel   ;

axi_lite_mosi axio;
axi_lite_miso axii;

assign en_herzel = valid_cordic && hEn; 

spi2axi_wrap #(
  .AXI_ADDR_WIDTH(32)
) u_spi2axi_wrap (
  .axi_arstn_i(rstn    ),
  .axi_aclk_i (clk     ),
  .spi_sck_i  (spi_sck ),  
  .spi_ss_n_i (spi_ss_n), 
  .spi_mosi_i (spi_mosi), 
  .spi_miso_o (spi_miso), 
  .axio_o     (axio    ),
  .axii_i     (axii    )
);

HerzelRegs u_HerzelRegs (
  .rstn  (rstn  ),
  .clk   (clk   ),
  .axio_i(axio  ),
  .axii_o(axii  ) 
);

Angel #(
  .NF(NF)
) u_Angel (
  .rstn   (rstn       ),
  .clk    (clk        ),
  .en     (cEn        ),
  .valid  (valid_angel),
  .freq_i (freq_arr   ),
  .angel_o(angel_arr  ) 
);

Cordic #(
  .NF(NF)
) u_Cordic (
  .rstn (rstn        ),
  .clk  (clk         ),
  .en   (valid_angel ),
  .valid(valid_cordic),
  .ang_i(angel_arr   ),
  .cos_o(coefW_re    ),
  .sin_o(coefW_im    ),
  .alpha(alpha       )
);

DataScale u_DataScale (
  .rstn  (rstn  ),
  .clk   (clk   ),
  .data_i(sample),
  .data_o(data  ) 
);

logic enn = 0;
always_ff @(posedge clk) if (en_herzel) enn <= 1;

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
      .valid  (valid[gvar]   ),
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