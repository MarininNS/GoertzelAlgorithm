import axi_pkg::*;

module HerzelRegs #(
  parameter NF = 11  ,
  parameter NS = 1000 
) (
  // CLK&RST
  input                               rstn          ,
  input                               clk           ,
  // REGS
  output logic         [NF-1:0][31:0] freq_arr_o    ,
  output logic                        en_cordic_o   ,
  input                               valid_angel_i ,
  input                               valid_cordic_i,
  input                [NF-1:0]       valid_herzel_i,
  input                [NF-1:0][31:0] data_arr_i    ,
  // AXI
  input  axi_lite_mosi                axio_i        ,
  output axi_lite_miso                axii_o         
);

// addres map of regs and default value
logic [31:0] version   = 32'h2904_2023; // RW 0x00
logic [31:0] debug     = 32'hF0F0_F0F0; // RW 0x04
logic [31:0] freq_1    = 32'h0000_0000; // RW 0x08
logic [31:0] freq_2    = 32'h0000_0000; // RW 0x0C
logic [31:0] freq_3    = 32'h0000_0000; // RW 0x10
logic [31:0] freq_4    = 32'h0000_0000; // RW 0x14
logic [31:0] freq_5    = 32'h0000_0000; // RW 0x18
logic [31:0] freq_6    = 32'h0000_0000; // RW 0x1C
logic [31:0] freq_7    = 32'h0000_0000; // RW 0x20
logic [31:0] freq_8    = 32'h0000_0000; // RW 0x24
logic [31:0] freq_9    = 32'h0000_0000; // RW 0x28
logic [31:0] freq_10   = 32'h0000_0000; // RW 0x2C
logic [31:0] freq_11   = 32'h0000_0000; // RW 0x30
logic [31:0] en_cordic = 32'h0000_0000; // RW 0x34
logic [31:0] status    = 32'h0000_0000; // R  0x38
logic [31:0] data_1    = 32'h0000_0000; // RW 0x3C
logic [31:0] data_2    = 32'h0000_0000; // RW 0x40
logic [31:0] data_3    = 32'h0000_0000; // RW 0x44
logic [31:0] data_4    = 32'h0000_0000; // RW 0x48
logic [31:0] data_5    = 32'h0000_0000; // RW 0x4C
logic [31:0] data_6    = 32'h0000_0000; // RW 0x50
logic [31:0] data_7    = 32'h0000_0000; // RW 0x54
logic [31:0] data_8    = 32'h0000_0000; // RW 0x58
logic [31:0] data_9    = 32'h0000_0000; // RW 0x5C
logic [31:0] data_10   = 32'h0000_0000; // RW 0x60
logic [31:0] data_11   = 32'h0000_0000; // RW 0x64

always_comb begin
  freq_arr_o[0 ] = freq_1            ;
  freq_arr_o[1 ] = freq_2            ;
  freq_arr_o[2 ] = freq_3            ;
  freq_arr_o[3 ] = freq_4            ;
  freq_arr_o[4 ] = freq_5            ;
  freq_arr_o[5 ] = freq_6            ;
  freq_arr_o[6 ] = freq_7            ;
  freq_arr_o[7 ] = freq_8            ;
  freq_arr_o[8 ] = freq_9            ;
  freq_arr_o[9 ] = freq_10           ;
  freq_arr_o[10] = freq_11           ;
  en_cordic_o    = en_cordic[0]      ;
  status[0]      = valid_angel_i     ;
  status[1]      = valid_cordic_i    ;
  status[8 ]     = valid_herzel_i[0 ];
  status[9 ]     = valid_herzel_i[1 ];
  status[10]     = valid_herzel_i[2 ];
  status[11]     = valid_herzel_i[3 ];
  status[12]     = valid_herzel_i[4 ];
  status[13]     = valid_herzel_i[5 ];
  status[14]     = valid_herzel_i[6 ];
  status[15]     = valid_herzel_i[7 ];
  status[16]     = valid_herzel_i[8 ];
  status[17]     = valid_herzel_i[9 ];
  status[18]     = valid_herzel_i[10];
  data_1         = data_arr_i[0 ]    ;
  data_2         = data_arr_i[1 ]    ;
  data_3         = data_arr_i[2 ]    ;
  data_4         = data_arr_i[3 ]    ;
  data_5         = data_arr_i[4 ]    ;
  data_6         = data_arr_i[5 ]    ;
  data_7         = data_arr_i[6 ]    ;
  data_8         = data_arr_i[7 ]    ;
  data_9         = data_arr_i[8 ]    ;
  data_10        = data_arr_i[9 ]    ;
  data_11        = data_arr_i[10]    ;
end

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
        32'h00: axii_o.rdata  = version  ;
        32'h04: axii_o.rdata  = debug    ;
        32'h08: axii_o.rdata  = freq_1   ;
        32'h0C: axii_o.rdata  = freq_2   ;
        32'h10: axii_o.rdata  = freq_3   ;
        32'h14: axii_o.rdata  = freq_4   ;
        32'h18: axii_o.rdata  = freq_5   ;
        32'h1C: axii_o.rdata  = freq_6   ;
        32'h20: axii_o.rdata  = freq_7   ;
        32'h24: axii_o.rdata  = freq_8   ;
        32'h28: axii_o.rdata  = freq_9   ;
        32'h2C: axii_o.rdata  = freq_10  ;
        32'h30: axii_o.rdata  = freq_11  ;
        32'h34: axii_o.rdata  = en_cordic;
        32'h38: axii_o.rdata  = status   ;
        32'h3C: axii_o.rdata  = data_1   ;
        32'h40: axii_o.rdata  = data_2   ;
        32'h44: axii_o.rdata  = data_3   ;
        32'h48: axii_o.rdata  = data_4   ;
        32'h4C: axii_o.rdata  = data_5   ;
        32'h50: axii_o.rdata  = data_6   ;
        32'h54: axii_o.rdata  = data_7   ;
        32'h58: axii_o.rdata  = data_8   ;
        32'h5C: axii_o.rdata  = data_9   ;
        32'h60: axii_o.rdata  = data_10  ;
        32'h64: axii_o.rdata  = data_11  ;
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
          32'h00: version   = axio_i.wdata;
          32'h04: debug     = axio_i.wdata;
          32'h08: freq_1    = axio_i.wdata;
          32'h0C: freq_2    = axio_i.wdata;
          32'h10: freq_3    = axio_i.wdata;
          32'h14: freq_4    = axio_i.wdata;
          32'h18: freq_5    = axio_i.wdata;
          32'h1C: freq_6    = axio_i.wdata;
          32'h20: freq_7    = axio_i.wdata;
          32'h24: freq_8    = axio_i.wdata;
          32'h28: freq_9    = axio_i.wdata;
          32'h2C: freq_10   = axio_i.wdata;
          32'h30: freq_11   = axio_i.wdata;
          32'h34: en_cordic = axio_i.wdata;
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