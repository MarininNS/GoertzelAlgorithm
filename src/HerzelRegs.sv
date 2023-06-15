import axi_pkg::*;

module HerzelRegs #(
  parameter NF = 11 
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
  output logic                 [31:0] num_samp_o    ,
  output logic                 [31:0] samp_freq_o   ,
  output logic                        reset_all_o   ,
  output logic                        reset_h_o     ,
  // AXI
  input  axi_lite_mosi                axio_i        ,
  output axi_lite_miso                axii_o         
);

localparam FREQ_BA = 32'h1000_0000;
localparam DATA_BA = 32'h2000_0000;

// addres map of regs and default value
logic [31:0] version   ; // RW 0x0000_0000
logic [31:0] debug     ; // RW 0x0000_0004
logic [31:0] num_samp  ; // RW 0x0000_000C
logic [31:0] samp_freq ; // RW 0x0000_0010
logic [31:0] en_cordic ; // RW 0x0000_0014
logic [31:0] status    ; // R  0x0000_0018
logic [31:0] reset_all ; // RW 0x0000_001C
logic [31:0] reset_h   ; // RW 0x0000_0020

logic [NF-1:0][31:0] freq ; // RW 0x1000_0000
logic [NF-1:0][31:0] data ; // R  0x2000_0000

always_comb begin
  num_samp_o     = num_samp          ;
  samp_freq_o    = samp_freq         ;
  en_cordic_o    = en_cordic[0]      ;
  status         = 0                 ;
  status[0]      = valid_angel_i     ;
  status[1]      = valid_cordic_i    ;
  status[2]      = &valid_herzel_i   ;
  reset_all_o    = reset_all[0]      ;
  reset_h_o      = reset_h[0]        ;

  for (int i=0; i<NF; i=i+1) begin
    freq_arr_o[i] = freq[i];
  end
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

always_ff @(negedge clk, negedge rstn) begin
  if (!rstn) begin
    curr_state <= IDLE;
  end
  else begin
    curr_state <= next_state; 
  end
end

always_ff @(posedge clk, negedge rstn) begin
  if (!rstn) begin
  version    <= 32'h2904_2023;
  debug      <= 32'hF0F0_F0F0;
  num_samp   <= 32'h0001_86A0;
  samp_freq  <= 32'h0003_0D40;
  en_cordic  <= 32'h0000_0000;
  reset_all  <= 32'h0000_0000;
  reset_h    <= 32'h0000_0000;
  freq       <= 32'h0000_0000;
  data       <= 32'h0000_0000;
  next_state <= IDLE;
  end else begin
    case (curr_state)
      IDLE : begin
        if (status[2]) begin
          for (int i=0; i<NF; i=i+1) begin
            data[i] = data_arr_i[i];
          end
        end
        axii_o.awready <= 0;
        axii_o.wready  <= 0;
        axii_o.bvalid  <= 0;
        axii_o.arready <= 0;
        axii_o.rdata   <= 0;
        axii_o.rresp   <= 0;
        axii_o.rvalid  <= 0;
        axii_o.bresp   <= 0;
        if (axio_i.arvalid) 
          next_state <= RADDR;
        else if (axio_i.awvalid)
          next_state <= WADDR;
        else
          next_state <= IDLE ;
      end
      RADDR: begin
        axii_o.arready <= 1;
        next_state <= RDATA;
      end
      RDATA: begin
        axii_o.rvalid <= 1;
        if (axio_i.araddr[31:28] == 0) begin
          case (axio_i.araddr)
            32'h0000_0000: axii_o.rdata  <= version  ;
            32'h0000_0004: axii_o.rdata  <= debug    ;
            32'h0000_000C: axii_o.rdata  <= num_samp ;
            32'h0000_0010: axii_o.rdata  <= samp_freq;
            32'h0000_0014: axii_o.rdata  <= en_cordic;
            32'h0000_0018: axii_o.rdata  <= status   ;
            32'h0000_001C: axii_o.rdata  <= reset_all;
            32'h0000_0020: axii_o.rdata  <= reset_h  ;
            default: axii_o.rresp <= 2'h3;
          endcase
        end else if (axio_i.araddr[31:28] == 1) begin
          for (int i=0; i<NF; i=i+1) begin
            if (axio_i.araddr == (FREQ_BA + 4*i)) begin
              axii_o.rdata <= freq[i];
            end
          end
        end else if (axio_i.araddr[31:28] == 2) begin
          for (int i=0; i<NF; i=i+1) begin
            if (axio_i.araddr == (DATA_BA + 4*i)) begin
              axii_o.rdata <= data[i];
            end
          end
        end else begin
          axii_o.rresp <= 2'h3;
        end
        if (axio_i.rready) 
          next_state <= IDLE;
        else
          next_state <= RDATA;
      end
      WADDR: begin
        axii_o.awready <= 1;
        next_state <= WDATA;
      end
      WDATA: begin
        if (axio_i.wvalid) begin
          axii_o.wready <= 1;
          if (axio_i.awaddr[31:28] == 0) begin
            case (axio_i.awaddr)
              32'h0000_0000: version   <= axio_i.wdata;
              32'h0000_0004: debug     <= axio_i.wdata;
              32'h0000_000C: num_samp  <= axio_i.wdata;
              32'h0000_0010: samp_freq <= axio_i.wdata;
              32'h0000_0014: en_cordic <= axio_i.wdata;
              32'h0000_001C: reset_all <= axio_i.wdata;
              32'h0000_0020: reset_h   <= axio_i.wdata;
              default: axii_o.bresp <= 2'h3;
            endcase
          end else if (axio_i.awaddr[31:28] == 1) begin
            for (int i=0; i<NF; i=i+1) begin
              if (axio_i.awaddr == (FREQ_BA + 4*i)) begin
                freq[i] <= axio_i.wdata;
              end
            end
          end else begin
            axii_o.bresp <= 2'h3;
          end
        end
        if (axio_i.wvalid) 
          next_state <= WRESP;
        else
          next_state <= WDATA;
      end
      WRESP: begin
        axii_o.bvalid <= 1;
        if (axio_i.bready)
          next_state <= IDLE;
        else
          next_state <= WRESP;
      end
      default: next_state <= curr_state;
    endcase
  end
end

endmodule