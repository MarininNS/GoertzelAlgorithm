// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Thu May  4 22:42:55 2023
// Host        : DESKTOP-E11LGM6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Desktop/Study_now/SRW/GoertzelAlgorithm/vivado/project/SRW.srcs/sources_1/ip/gtwizard_ultrascale/gtwizard_ultrascale_stub.v
// Design      : gtwizard_ultrascale
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu9p-flga2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "gtwizard_ultrascale_gtwizard_top,Vivado 2020.1" *)
module gtwizard_ultrascale(gtwiz_userclk_tx_reset_in, 
  gtwiz_userclk_tx_active_in, gtwiz_userclk_rx_active_in, gtwiz_reset_clk_freerun_in, 
  gtwiz_reset_all_in, gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, drpclk_in, gtrefclk0_in, gtyrxn_in, gtyrxp_in, 
  rxusrclk_in, rxusrclk2_in, txusrclk_in, txusrclk2_in, gtpowergood_out, gtytxn_out, 
  gtytxp_out, rxoutclk_out, rxpmaresetdone_out, rxprgdivresetdone_out, txoutclk_out, 
  txpmaresetdone_out, txprgdivresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_reset_in[0:0],gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[15:0],gtwiz_userdata_rx_out[15:0],drpclk_in[0:0],gtrefclk0_in[0:0],gtyrxn_in[0:0],gtyrxp_in[0:0],rxusrclk_in[0:0],rxusrclk2_in[0:0],txusrclk_in[0:0],txusrclk2_in[0:0],gtpowergood_out[0:0],gtytxn_out[0:0],gtytxp_out[0:0],rxoutclk_out[0:0],rxpmaresetdone_out[0:0],rxprgdivresetdone_out[0:0],txoutclk_out[0:0],txpmaresetdone_out[0:0],txprgdivresetdone_out[0:0]" */;
  input [0:0]gtwiz_userclk_tx_reset_in;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [15:0]gtwiz_userdata_tx_in;
  output [15:0]gtwiz_userdata_rx_out;
  input [0:0]drpclk_in;
  input [0:0]gtrefclk0_in;
  input [0:0]gtyrxn_in;
  input [0:0]gtyrxp_in;
  input [0:0]rxusrclk_in;
  input [0:0]rxusrclk2_in;
  input [0:0]txusrclk_in;
  input [0:0]txusrclk2_in;
  output [0:0]gtpowergood_out;
  output [0:0]gtytxn_out;
  output [0:0]gtytxp_out;
  output [0:0]rxoutclk_out;
  output [0:0]rxpmaresetdone_out;
  output [0:0]rxprgdivresetdone_out;
  output [0:0]txoutclk_out;
  output [0:0]txpmaresetdone_out;
  output [0:0]txprgdivresetdone_out;
endmodule
