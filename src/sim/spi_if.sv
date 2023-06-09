`timescale 1ns/1ps

// !!! CPOL and CPHA - 0 and 0 ONLY !!!

interface spi_if #(SPI_CLK_PER, DISPLAY = 0) ();

logic [31:0] write_instr = 32'h0000_0000;
logic [31:0] read_instr  = 32'h0000_0001;
logic [31:0] dummy_word  = 32'h0000_0000;

logic sck ;
logic ss_n;
logic mosi;
logic miso;

modport mst (
  output sck ,
  output ss_n,
  output mosi,
  input  miso 
);

modport slv (
  input  sck ,
  input  ss_n,
  input  mosi,
  output miso 
);

task init();
  mst.sck  = 0;
  mst.ss_n = 1;
  mst.mosi = 0;
endtask

task clk_en(input en);
  if (en) begin
    forever #(SPI_CLK_PER/2) sck = !sck;
  end
  else begin
    forever #(SPI_CLK_PER/2) sck = 0;
  end 
endtask

task write(input int num_bit, input [31:0] data);
  for (int i=num_bit-1; i>=0; i=i-1) begin
    mst.mosi = data[i];
    @(negedge sck);
  end
  mst.mosi = 0;
endtask

task read(input int num_bit, output [31:0] data);
  data = 0;
  for (int i=num_bit-1; i>=0; i=i-1) begin
    @(posedge sck);
    data[i] = mst.miso;
  end
endtask

task read_data(input [31:0] addr, output [31:0] data, output [31:0] status);
  fork
    begin
      clk_en(1);
    end
    begin
      // slave select
      mst.ss_n = 0;
      // instruction byte
      write(8, read_instr);
      // 4 address bytes
      write(32, addr);
      // dummy byte
      write(8, dummy_word);
      // 4 data bytes
      read(32, data);
      // status byte
      read(8, status);
      #(SPI_CLK_PER/2);
    end
  join_any
  disable fork;
  #(SPI_CLK_PER/2);
  // slave select
  mst.ss_n = 1;
  #(SPI_CLK_PER);
  if (DISPLAY) $display("[%010t] spi read : addr = 0x%08h, data = 0x%08h, status = 0x%02h", $time, addr, data, status);
endtask 

task write_data(input [31:0] addr, input [31:0] data, output [31:0] status);
  fork
    begin
      clk_en(1);
    end
    begin
      // slave select
      mst.ss_n = 0;
      // instruction byte
      write(8, write_instr);
      // 4 address bytes
      write(32, addr);
      // 4 data bytes
      write(32, data);
      // dummy byte
      write(8, dummy_word);
      // status byte
      read(8, status);
      #(SPI_CLK_PER/2);
    end
  join_any
  disable fork;
  #(SPI_CLK_PER/2);
  // slave select
  mst.ss_n = 1;
  #(SPI_CLK_PER);
  if (DISPLAY) $display("[%010t] spi write: addr = 0x%08h, data = 0x%08h, status = 0x%02h", $time, addr, data, status);
endtask 

endinterface
