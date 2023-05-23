import axi_pkg::*;

module spi2axi_wrap (
  input                        axi_rstn_i ,
  input                        axi_clk_i  ,
  input                        spi_sck_i  ,
  input                        spi_ss_n_i ,
  input                        spi_mosi_i ,
  output                       spi_miso_o ,
  output axi_pkg::axi_lite_mosi axio_o    ,
  input  axi_pkg::axi_lite_miso axii_i     
);

spi2axi u_spi2axi (
  .axi_clk     (axi_clk_i     ),
  .axi_rstn    (axi_rstn_i    ),
  .spi_sck     (spi_sck_i     ),  
  .spi_ss      (spi_ss_n_i    ), 
  .spi_mosi    (spi_mosi_i    ), 
  .spi_miso    (spi_miso_o    ),
  .axi_awaddr  (axio_o.awaddr ),
  .axi_awprot  (axio_o.awprot ),
  .axi_awvalid (axio_o.awvalid),
  .axi_wdata   (axio_o.wdata  ),
  .axi_wstrb   (axio_o.wstrb  ),
  .axi_wvalid  (axio_o.wvalid ),
  .axi_araddr  (axio_o.araddr ),
  .axi_arprot  (axio_o.arprot ),
  .axi_arvalid (axio_o.arvalid),
  .axi_rready  (axio_o.rready ),
  .axi_bready  (axio_o.bready ),
  .axi_awready (axii_i.awready),
  .axi_wready  (axii_i.wready ),
  .axi_arready (axii_i.arready),
  .axi_rdata   (axii_i.rdata  ),
  .axi_rresp   (axii_i.rresp  ),
  .axi_rvalid  (axii_i.rvalid ),
  .axi_bresp   (axii_i.bresp  ),
  .axi_bvalid  (axii_i.bvalid ) 
);

endmodule