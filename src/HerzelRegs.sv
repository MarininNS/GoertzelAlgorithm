import axi_pkg::*;

module HerzelRegs (
  // CLK&RST
  input                rstn  ,
  input                clk   ,
  // AXI
  input  axi_lite_mosi axio_i,
  output axi_lite_miso axii_o 
);
    
logic [31:0] version  = 32'h2904_2023;
logic [31:0] test_reg = 32'hF0F0_F0F0;

typedef enum {  
  IDLE ,
  RADDR,
  RDATA,
  WADDR,
  WDATA,
  WRESP 
} state;

state curr_state;
state next_state;

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
    curr_state <= IDLE;
  end
  else begin
    curr_state <= next_state; 
  end
end

always_comb begin
  axii_o.awready = 0;
  axii_o.wready  = 0;
  axii_o.bvalid  = 0;
  axii_o.arready = 0;
  axii_o.rdata   = 0;
  axii_o.rresp   = 0;
  axii_o.rvalid  = 0;

  case (curr_state)
    IDLE : begin
      axii_o.bresp   = 0;
      if (axio_i.arvalid) 
        next_state = RADDR;
      else if (axio_i.awvalid)
        next_state = WADDR;
      else
        next_state = IDLE ;
    end
    RADDR: begin
      axii_o.arready = 1;
      next_state = RDATA;
    end
    RDATA: begin
      axii_o.rvalid = 1;
      case (axio_i.araddr)
        32'h04: axii_o.rdata  = version ;
        32'h08: axii_o.rdata  = test_reg;
        default: axii_o.rresp = 2'h3;
      endcase
      if (axio_i.rready) 
        next_state = IDLE;
      else
        next_state = RDATA;
    end
    WADDR: begin
      axii_o.awready = 1;
      next_state = WDATA;
    end
    WDATA: begin
      if (axio_i.wvalid) begin
        axii_o.wready = 1;
        case (axio_i.awaddr)
          32'h04: version  = axio_i.wdata;
          32'h08: test_reg = axio_i.wdata;
          default: axii_o.bresp = 2'h3;
        endcase
      end
      if (axio_i.wvalid) 
        next_state = WRESP;
      else
        next_state = WDATA;
    end
    WRESP: begin
      axii_o.bvalid = 1;
      if (axio_i.bready)
        next_state = IDLE;
      else
        next_state = WRESP;
    end
    default: next_state = curr_state;
  endcase
end

endmodule