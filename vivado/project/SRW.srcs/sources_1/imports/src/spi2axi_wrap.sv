import axi_pkg::*;

module spi2axi_wrap #(
  parameter SPI_CPOL       = 0 ,
  parameter SPI_CPHA       = 0 ,
  parameter AXI_ADDR_WIDTH = 32 
)(
  input                        axi_arstn_i,
  input                        axi_aclk_i ,
  input                        spi_sck_i  ,
  input                        spi_ss_n_i ,
  input                        spi_mosi_i ,
  output                       spi_miso_o ,
  output axi_pkg::axi_lite_mosi axio_o    ,
  input  axi_pkg::axi_lite_miso axii_i     
);

spi2axi #(
  .SPI_CPOL       (SPI_CPOL      ),
  .SPI_CPHA       (SPI_CPHA      ),
  .AXI_ADDR_WIDTH (AXI_ADDR_WIDTH) 
) u_spi2axi (
  .axi_aclk      (axi_aclk_i    ),
  .axi_aresetn   (axi_arstn_i   ),
  .spi_sck       (spi_sck_i     ),  
  .spi_ss_n      (spi_ss_n_i    ), 
  .spi_mosi      (spi_mosi_i    ), 
  .spi_miso      (spi_miso_o    ),
  .s_axi_awaddr  (axio_o.awaddr ),
  .s_axi_awprot  (axio_o.awprot ),
  .s_axi_awvalid (axio_o.awvalid),
  .s_axi_wdata   (axio_o.wdata  ),
  .s_axi_wstrb   (axio_o.wstrb  ),
  .s_axi_wvalid  (axio_o.wvalid ),
  .s_axi_araddr  (axio_o.araddr ),
  .s_axi_arprot  (axio_o.arprot ),
  .s_axi_arvalid (axio_o.arvalid),
  .s_axi_rready  (axio_o.rready ),
  .s_axi_bready  (axio_o.bready ),
  .s_axi_awready (axii_i.awready),
  .s_axi_wready  (axii_i.wready ),
  .s_axi_arready (axii_i.arready),
  .s_axi_rdata   (axii_i.rdata  ),
  .s_axi_rresp   (axii_i.rresp  ),
  .s_axi_rvalid  (axii_i.rvalid ),
  .s_axi_bresp   (axii_i.bresp  ),
  .s_axi_bvalid  (axii_i.bvalid ) 
);

endmodule