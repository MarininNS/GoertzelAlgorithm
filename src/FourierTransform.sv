import axi_pkg::*;

`define TEST 1

module FourierTransform #(
  parameter NF = 11  , // NUM_FREQ
  parameter NS = 1000  // NUM_SAMPLE
) (
  // CLK&RST
  input        rstn    ,
  input        clk     ,
  // SPI
  input        spi_sck , 
  input        spi_ss_n, 
  input        spi_mosi, 
  output       spi_miso, 
  // CTRL               
  input        enable_p,
  input        enable_n,
  // DATA
  input  [7:0] sample_p,
  input  [7:0] sample_n 
);

logic       rstn_syn;
logic       enable  ;
logic [7:0] sample  ;

logic        [NF-1:0][31:0] freq_arr ; // (32.0)
logic signed [NF-1:0][31:0] angel_arr;
logic signed [NF-1:0][31:0] coefW_re ;
logic signed [NF-1:0][31:0] coefW_im ;
logic signed [NF-1:0][31:0] alpha    ;
logic signed         [31:0] data_scl ;
logic signed [NF-1:0][31:0] data_hrz ;

logic          en_cordic   ;
logic          en_scl      ;
logic          valid_angel ;
logic          valid_cordic;
logic          valid_scl   ;
logic [NF-1:0] valid_herzel;

axi_lite_mosi axio;
axi_lite_miso axii;

`ifndef TEST
  IBUFDS IBUFDS_inst 
  (
     .I (enable_p),
     .IB(enable_n),
     .O (enable  ) 
  );
  genvar gvar_buf;
  generate
    for (gvar_buf = 0; gvar_buf < 8; gvar_buf = gvar_buf + 1) begin : buf
      IBUFDS IBUFDS_inst 
      (
        .I (sample_p[gvar_buf]),
        .IB(sample_n[gvar_buf]),
        .O (sample  [gvar_buf]) 
      );
    end
  endgenerate
`else
  assign enable = enable_p;
  genvar gvar_buf;
  generate
    for (gvar_buf = 0; gvar_buf < 8; gvar_buf = gvar_buf + 1) begin
      assign sample[gvar_buf] = sample_p[gvar_buf];
    end
  endgenerate
`endif

resync_nrst u_resync_nrst(
  .clk   (clk     ),
  .nrst_i(rstn    ),
  .nrst_o(rstn_syn) 
);

spi2axi_wrap #(
  .AXI_ADDR_WIDTH(32)
) u_spi2axi_wrap (
  .axi_arstn_i(rstn_syn),
  .axi_aclk_i (clk     ),
  .spi_sck_i  (spi_sck ),  
  .spi_ss_n_i (spi_ss_n), 
  .spi_mosi_i (spi_mosi), 
  .spi_miso_o (spi_miso), 
  .axio_o     (axio    ),
  .axii_i     (axii    )
);

HerzelRegs u_HerzelRegs (
  .rstn          (rstn_syn    ),
  .clk           (clk         ),
  .freq_arr_o    (freq_arr    ),
  .en_cordic_o   (en_cordic   ),
  .valid_angel_i (valid_angel ),
  .valid_cordic_i(valid_cordic),
  .valid_herzel_i(valid_herzel),
  .data_arr_i    (data_hrz    ),
  .axio_i        (axio        ),
  .axii_o        (axii        ) 
);

Angel #(
  .NF(NF)
) u_Angel (
  .rstn   (rstn_syn   ),
  .clk    (clk        ),
  .en     (en_cordic  ),
  .valid  (valid_angel),
  .freq_i (freq_arr   ),
  .angel_o(angel_arr  ) 
);

Cordic #(
  .NF(NF)
) u_Cordic (
  .rstn (rstn_syn    ),
  .clk  (clk         ),
  .en   (valid_angel ),
  .valid(valid_cordic),
  .ang_i(angel_arr   ),
  .cos_o(coefW_re    ),
  .sin_o(coefW_im    ),
  .alpha(alpha       )
);

assign en_scl = valid_cordic && enable;

DataScale u_DataScale (
  .rstn  (rstn_syn ),
  .clk   (clk      ),
  .enable(en_scl   ),
  .valid (valid_scl),
  .data_i(sample   ),
  .data_o(data_scl ) 
);

genvar gvar;
generate 
  for (gvar = 0; gvar < NF; gvar = gvar + 1) begin : herzel
    Herzel #(
      .NF(NF),
      .NS(NS) 
    ) u_Herzel (
      .rstn   (rstn_syn          ),
      .clk    (clk               ),
      .en     (valid_scl         ),
      .valid  (valid_herzel[gvar]),
      .alpha_i(alpha[gvar]       ),
      .cW_re_i(coefW_re[gvar]    ),
      .cW_im_i(coefW_im[gvar]    ),
      .data_i (data_scl          ),
      .data_o (data_hrz[gvar]    ) 
    ); 
  end
endgenerate

endmodule