module spi2axi (
  // SPI
  input  logic        spi_sck     ,
  input  logic        spi_ss      ,
  input  logic        spi_mosi    ,
  output logic        spi_miso    ,
  // AXI
  input  logic        axi_clk     ,
  input  logic        axi_rstn    ,
  output logic        axi_awvalid ,
  output logic [31:0] axi_awaddr  ,
  output logic [2 :0] axi_awprot  , //
  input  logic        axi_awready ,
  output logic        axi_wvalid  ,
  output logic [31:0] axi_wdata   ,
  output logic [3 :0] axi_wstrb   , //
  input  logic        axi_wready  ,
  input  logic        axi_bvalid  ,
  input  logic [1 :0] axi_bresp   ,
  output logic        axi_bready  , 
  output logic        axi_arvalid ,
  output logic [31:0] axi_araddr  ,
  output logic [2 :0] axi_arprot  , // 
  input  logic        axi_arready ,
  input  logic        axi_rvalid  ,
  input  logic [31:0] axi_rdata   ,
  input  logic [1 :0] axi_rresp   ,
  output logic        axi_rready   
);


typedef enum {
  SPI_IDLE , 
  SPI_CMD  , 
  SPI_ADDR ,
  SPI_WDATA,
  SPI_RDATA,
  SPI_DUMM ,
  SPI_STAT  
} spi_state;


typedef enum {
  AXI_IDLE ,
  AXI_CMD  ,
  AXI_RADDR,
  AXI_RDATA,
  AXI_WADDR,
  AXI_WDATA,
  AXI_WRESP 
} axi_state;


spi_state spi_cstate;
spi_state spi_nstate;
axi_state axi_cstate;
axi_state axi_nstate;

logic        spi_sck_syn;
logic        spi_sck_old;
logic        spi_sck_re ;
logic        spi_sck_fe ;
logic [7 :0] spi_cntr   ;

logic [7 :0] spi_cmd    ;
logic [31:0] spi_addr   ;
logic [31:0] spi_wdata  ;
logic [31:0] spi_rdata  ; //
logic [7 :0] spi_dumm   ;
logic [7 :0] spi_stat   ; //

logic       spi_ss_syn  ;
logic       spi_ss_old  ;
logic       spi_ss_fe   ;


resync_data u_resync_sck (
  .rstn  (axi_rstn   ),
  .clk   (axi_clk    ),
  .data_i(spi_sck    ),
  .data_o(spi_sck_syn) 
);

resync_data u_resync_ss (
  .rstn  (axi_rstn  ),
  .clk   (axi_clk   ),
  .data_i(spi_ss    ),
  .data_o(spi_ss_syn) 
);


always_ff @(negedge axi_clk, negedge axi_rstn) begin : spi_current_state
  if (!axi_rstn) begin
    spi_cstate <= SPI_IDLE;
  end
  else begin
    spi_cstate <= spi_nstate;
  end
end

always_ff @(posedge axi_clk, negedge axi_rstn) begin : spi_next_state
  if (!axi_rstn) begin
    spi_miso    <= 0;
    spi_sck_old <= 0;
    spi_sck_re  <= 0;
    spi_sck_fe  <= 0;
    spi_ss_old  <= 0;
    spi_ss_fe   <= 0;
    spi_nstate <= SPI_IDLE;
  end
  else begin

    spi_sck_old <= spi_sck_syn;
    spi_sck_re  <= ((spi_sck_old == 1'b0) && (spi_sck_syn == 1'b1));
    spi_sck_fe  <= ((spi_sck_old == 1'b1) && (spi_sck_syn == 1'b0));

    spi_ss_old <= spi_ss_syn;
    spi_ss_fe  <= ((spi_ss_old == 1'b1) && (spi_ss_syn == 1'b0));

    case (spi_cstate)
      SPI_IDLE : begin
        spi_cntr  <= 0;
        spi_cmd   <= 0;
        spi_addr  <= 0;
        spi_wdata <= 0;
        spi_dumm  <= 0;
        if (spi_ss_fe)
          spi_nstate <= SPI_CMD;
        else
          spi_nstate <= SPI_IDLE;
      end
      SPI_CMD : begin
        if (spi_cntr < 8) begin
          if (spi_sck_re) begin
            spi_cmd    <= {spi_cmd[6:0], spi_mosi};
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_CMD;
          end
        end
        else begin
          spi_cntr   <= 0;
          spi_nstate <= SPI_ADDR;
        end
      end
      SPI_ADDR : begin
        if (spi_cntr < 32) begin
          if (spi_sck_re) begin
            spi_addr   <= {spi_addr[30:0], spi_mosi};
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_ADDR;
          end
        end
        else begin
          spi_cntr   <= 0;
          if (spi_cmd == 1'b1)
            spi_nstate <= SPI_DUMM;
          else
            spi_nstate <= SPI_WDATA;
        end
      end
      SPI_WDATA : begin
        if (spi_cntr < 32) begin
          if (spi_sck_re) begin
            spi_wdata  <= {spi_wdata[30:0], spi_mosi};
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_WDATA;
          end
        end
        else begin
          spi_cntr   <= 0;
          spi_nstate <= SPI_DUMM;
        end
      end
      SPI_RDATA : begin
        if (spi_cntr < 32) begin
          if (spi_sck_fe) begin
            spi_miso   <= spi_rdata[31-spi_cntr];
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_RDATA;
          end
          else if (spi_sck_re) begin
            spi_miso   <= 0;
          end
        end
        else begin
          spi_cntr   <= 0;
          spi_nstate <= SPI_STAT;
        end
      end
      SPI_DUMM : begin
        if (spi_cntr < 8) begin
          if (spi_sck_re) begin
            spi_dumm   <= {spi_dumm[6:0], 1'b0};
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_DUMM;
          end
        end
        else begin
          spi_cntr   <= 0;
          if (spi_cmd == 1'b1)
            spi_nstate <= SPI_RDATA;
          else
            spi_nstate <= SPI_STAT;
        end
      end
      SPI_STAT : begin
        if (spi_cntr < 8) begin
          if (spi_sck_re) begin
            spi_miso   <= spi_stat[7-spi_cntr];
            spi_cntr   <= spi_cntr + 1;
            spi_nstate <= SPI_STAT;
          end
        end
        else begin
          spi_cntr   <= 0;
          spi_nstate <= SPI_IDLE;
        end
      end
      default: spi_nstate <= spi_cstate;
    endcase
  end
end



always_ff @(negedge axi_clk, negedge axi_rstn) begin : axi_current_state
  if (!axi_rstn) begin
    axi_cstate <= AXI_IDLE;
  end
  else begin
    axi_cstate <= axi_nstate;
  end
end

always_ff @(posedge axi_clk, negedge axi_rstn) begin : axi_next_state
  if (!axi_rstn) begin
    axi_awvalid <= 0;
    axi_awaddr  <= 0;
    axi_awprot  <= 0;
    axi_wvalid  <= 0;
    axi_wdata   <= 0;
    axi_wstrb   <= 0;
    axi_bready  <= 0;
    axi_araddr  <= 0;
    axi_arprot  <= 0;
    axi_arvalid <= 0;
    axi_rready  <= 0;
    spi_rdata   <= 0;
    spi_stat    <= 0;
    axi_nstate <= AXI_IDLE;
  end
  else begin
    case (axi_cstate)
      AXI_IDLE : begin
        axi_awvalid <= 0;
        axi_awaddr  <= 0;
        axi_awprot  <= 0;
        axi_wvalid  <= 0;
        axi_wdata   <= 0;
        axi_wstrb   <= 0;
        axi_bready  <= 0;
        axi_araddr  <= 0;
        axi_arprot  <= 0;
        axi_arvalid <= 0;
        axi_rready  <= 0;
        if (spi_cstate == SPI_IDLE)
          axi_nstate <= AXI_CMD;
        else
          axi_nstate <= AXI_IDLE;
      end
      AXI_CMD : begin
        spi_rdata <= 0;
        spi_stat  <= 0;
        if (spi_cstate > SPI_CMD) begin
          if (spi_cmd == 1)
            axi_nstate <= AXI_RADDR;
          else
            axi_nstate <= AXI_WADDR;
        end
      end
      AXI_RADDR : begin
        if (spi_cstate > SPI_ADDR) begin
          axi_araddr  <= spi_addr;
          axi_arvalid <= 1;
          if (axi_arready == 1)   
            axi_nstate <= AXI_RDATA;
          else
            axi_nstate <= AXI_RADDR;
        end
      end
      AXI_RDATA : begin
        if (axi_rvalid == 1) begin
          spi_rdata  <= axi_rdata;
          spi_stat   <= axi_rresp;
          axi_rready <= 1;
          axi_nstate <= AXI_IDLE;
        end
        else
          axi_nstate <= AXI_RDATA;
      end
      AXI_WADDR : begin
        if (spi_cstate > SPI_WDATA) begin
          axi_awaddr  <= spi_addr;
          axi_awvalid <= 1;
          if (axi_awready == 1)   
            axi_nstate <= AXI_WDATA;
          else
            axi_nstate <= AXI_WADDR;
        end
      end
      AXI_WDATA : begin
        if (spi_cstate > SPI_WDATA) begin
          axi_wdata  <= spi_wdata;
          axi_wvalid <= 1;
          if (axi_wready == 1)   
            axi_nstate <= AXI_WRESP;
          else
            axi_nstate <= AXI_WDATA;
        end
      end
      AXI_WRESP : begin
        if (axi_bvalid == 1) begin
          spi_stat   <= axi_bresp;
          axi_bready <= 1;
          axi_nstate <= AXI_IDLE;
        end
        else
          axi_nstate <= AXI_WRESP;
      end 
      default: axi_nstate <= axi_cstate;
    endcase
  end
end


endmodule