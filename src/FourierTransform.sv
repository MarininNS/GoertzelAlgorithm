import axi_pkg::*;

// `define TEST

module FourierTransform #(
  parameter NF = 7 // NUM_FREQ
) (
  // CLK&RST
  input        rstn    ,
  input        clk     ,
  // input        clk_p   ,
  // input        clk_n   ,
  // SPI
  input        spi_sck ,
  input        spi_ss_n,
  input        spi_mosi,
  output       spi_miso,
  // CTRL               
  input        enable_p,
  input        enable_n,
  // // DATA
  input  [7:0] sample_p,
  input  [7:0] sample_n 
);


// logic clk;
// IBUFDS IBUFDS_clk
// (
//    .I (clk_p),
//    .IB(clk_n),
//    .O (clk  ) 
// );

// logic       enable_p;
// logic       enable_n;
// logic [7:0] sample_p;
// logic [7:0] sample_n;


wire       clkd;

wire       enable    ;
wire [7:0] sample    ;
wire       enable_syn;
wire [7:0] sample_syn;
wire       rstn_syn  ;

wire mode       ;
wire reset_all_r;
wire reset_h_r  ;
wire rstn_all   ;
wire rstn_h     ;

wire                [31:0] num_samp ;
wire                [31:0] samp_freq;
wire        [NF-1:0][31:0] freq_arr ;
wire        [NF-1:0][63:0] k_arr    ;
wire                [63:0] ang_coef ;
wire                [63:0] ns_coef  ;
wire signed [NF-1:0][63:0] angel_arr;
wire signed [NF-1:0][63:0] coefW_re ;
wire signed [NF-1:0][63:0] coefW_im ;
wire signed [NF-1:0][63:0] alpha    ;
wire signed         [63:0] data_scl ;
wire signed [NF-1:0][31:0] data_hrz ;

wire          en_cordic   ;
wire          en_scl      ;
wire          valid_div   ;
wire          valid_angel ;
wire          valid_cordic;
wire          valid_scl   ;
wire [NF-1:0] valid_herzel;

axi_lite_mosi axio;
axi_lite_miso axii;

assign rstn_all = rstn_syn && (~reset_all_r);
assign rstn_h   = rstn_syn && (~reset_all_r) && (~reset_h_r);

// clk_div u_clk_div (
//   .clk_i(clk ),
//   .clk_o(clkd) 
// );

assign clkd = clk;


  // IBUFDS IBUFDS_enable 
  // (
  //    .I (enable_p),
  //    .IB(enable_n),
  //    .O (enable  ) 
  // );
  // genvar gvar_buf;
  // generate
  //   for (gvar_buf = 0; gvar_buf < 8; gvar_buf = gvar_buf + 1) begin : IBUFDS_sample
  //     IBUFDS IBUFDS_sample
  //     (
  //       .I (sample_p[gvar_buf]),
  //       .IB(sample_n[gvar_buf]),
  //       .O (sample  [gvar_buf]) 
  //     );
  //   end
  // endgenerate

  assign enable = enable_p;
  genvar gvar_buf;
  generate
    for (gvar_buf = 0; gvar_buf < 8; gvar_buf = gvar_buf + 1) begin : assign_sample
      assign sample[gvar_buf] = sample_p[gvar_buf];
    end
  endgenerate


resync_nrst u_resync_nrst(
  .clk   (clkd    ),
  .rstn_i(rstn    ),
  .rstn_o(rstn_syn) 
);

resync_data #(
  .DW(1)
) u_resync_enable (
  .rstn  (rstn_syn  ),
  .clk   (clkd      ),
  .data_i(enable    ),
  .data_o(enable_syn) 
);

resync_data #(
  .DW(8)
) u_resync_sample (
  .rstn  (rstn_syn  ),
  .clk   (clkd      ),
  .data_i(sample    ),
  .data_o(sample_syn) 
);

spi2axi_wrap u_spi2axi_wrap (
  .axi_rstn_i (rstn_syn),
  .axi_clk_i  (clkd    ),
  .spi_sck_i  (spi_sck ),  
  .spi_ss_n_i (spi_ss_n), 
  .spi_mosi_i (spi_mosi), 
  .spi_miso_o (spi_miso), 
  .axio_o     (axio    ),
  .axii_i     (axii    )
);

HerzelRegs #(
  .NF(NF)
) u_HerzelRegs (
  .rstn          (rstn_syn    ),
  .clk           (clkd        ),
  .freq_arr_o    (freq_arr    ),
  .en_cordic_o   (en_cordic   ),
  .valid_angel_i (valid_angel ),
  .valid_cordic_i(valid_cordic),
  .valid_herzel_i(valid_herzel),
  .data_arr_i    (data_hrz    ),
  .num_samp_o    (num_samp    ),
  .samp_freq_o   (samp_freq   ),
  .mode_o        (mode        ),
  .reset_all_o   (reset_all_r ),
  .reset_h_o     (reset_h_r   ),
  .axio_i        (axio        ),
  .axii_o        (axii        ) 
);

div_all #(
  .NF(NF)
) u_div_all(
  .rstn       (rstn_all ),
  .clk        (clkd     ),
  .en         (en_cordic),
  .valid      (valid_div),
  .num_samp_i (num_samp ),
  .samp_freq_i(samp_freq),
  .freq_i     (freq_arr ),
  .k_arr_o    (k_arr    ),
  .ang_coef_o (ang_coef ),
  .ns_coef_o  (ns_coef  ) 
);

Angel #(
  .NF(NF)
) u_Angel (
  .rstn      (rstn_all   ),
  .clk       (clkd       ),
  .en        (valid_div  ),
  .valid     (valid_angel),
  .k_arr_i   (k_arr      ),
  .ang_coef_i(ang_coef   ),
  .angel_o   (angel_arr  ) 
);

Cordic #(
  .NF(NF)
) u_Cordic (
  .rstn (rstn_all    ),
  .clk  (clkd        ),
  .en   (valid_angel ),
  .valid(valid_cordic),
  .ang_i(angel_arr   ),
  .cos_o(coefW_re    ),
  .sin_o(coefW_im    ),
  .alpha(alpha       )
);

assign en_scl = valid_cordic && enable_syn;

DataScale u_DataScale (
  .rstn  (rstn_all  ),
  .clk   (clkd      ),
  .enable(en_scl    ),
  .valid (valid_scl ),
  .mode  (mode      ),
  .data_i(sample_syn),
  .data_o(data_scl  ) 
);

Herzel #(
  .NF(NF)
) u_Herzel (
  .rstn     (rstn_h      ),
  .clk      (clkd        ),
  .en       (valid_scl   ),
  .valid    (valid_herzel),
  .ns_i     (num_samp    ),
  .ns_coef_i(ns_coef     ),
  .alpha_i  (alpha       ),
  .cW_re_i  (coefW_re    ),
  .cW_im_i  (coefW_im    ),
  .data_i   (data_scl    ),
  .data_o   (data_hrz    ) 
); 

endmodule