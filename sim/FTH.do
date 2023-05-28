onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/rstn
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/clk
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/spi_sck
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/spi_ss_n
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/spi_mosi
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/spi_miso
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/enable_p
add wave -noupdate -group DUT -radix hexadecimal /FourierTransform_tb/DUT/sample_p
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/SCALE_COEF
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/rstn
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/clk
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/enable
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/valid
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_i
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_o
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_m
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/enable_syn
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/enable_old
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/enable_re
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/en
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/valid
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/ang_i
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/cos_o
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/sin_o
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/alpha
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/curr_state
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/next_state
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/ang
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/cos
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/sin
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/indx0
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/indx1
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/atan
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/quad
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/mul_a
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/mul_b
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/mul_c
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/NF
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/rstn
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/clk
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/en
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/valid
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/k_arr_i
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/ang_coef_i
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/angel_o
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/indx
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/mul_a
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/mul_b
add wave -noupdate -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/mul_c
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/NF}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/rstn}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/clk}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/en}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/valid}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/alpha_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/cW_re_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/cW_im_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_o}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm2}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_re}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_im}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/indx}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/rstn}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/clk}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/en}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/valid}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/alpha_i}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/cW_re_i}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/cW_im_i}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/data_i}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/data_o}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/curr_state}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/next_state}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/alpha}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/cW_re}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/cW_im}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/data}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/vm1}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/vm2}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/tmp}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/data_re}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/data_im}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/indx}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/mul_a}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/mul_b}
add wave -noupdate -group H3 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[3]/u_Herzel/mul_c}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/NF}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/rstn}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/clk}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/en}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/valid}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/alpha_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/cW_re_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/cW_im_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_o}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/curr_state}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/next_state}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm2}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/tmp}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_re}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_im}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/indx}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/mul_a}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/mul_b}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/mul_c}
add wave -noupdate -group TOP /FourierTransform_tb/DUT/NF
add wave -noupdate -group TOP /FourierTransform_tb/DUT/rstn
add wave -noupdate -group TOP /FourierTransform_tb/DUT/clk
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/sample
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/freq_arr
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/angel_arr
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/coefW_re
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/coefW_im
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/alpha
add wave -noupdate -radix hexadecimal -childformat {{/FourierTransform_tb/DUT/axio.awaddr -radix hexadecimal} {/FourierTransform_tb/DUT/axio.awprot -radix hexadecimal} {/FourierTransform_tb/DUT/axio.awvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wdata -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wstrb -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.bready -radix hexadecimal} {/FourierTransform_tb/DUT/axio.araddr -radix hexadecimal} {/FourierTransform_tb/DUT/axio.arprot -radix hexadecimal} {/FourierTransform_tb/DUT/axio.arvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.rready -radix hexadecimal}} -subitemconfig {/FourierTransform_tb/DUT/axio.awaddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.awprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.awvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wdata {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wstrb {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.bready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.araddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.arprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.arvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.rready {-height 15 -radix hexadecimal}} /FourierTransform_tb/DUT/axio
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/axii
add wave -noupdate -radix hexadecimal /FourierTransform_tb/spi_data
add wave -noupdate -radix hexadecimal /FourierTransform_tb/spi_stat
add wave -noupdate /FourierTransform_tb/DUT/u_HerzelRegs/status
add wave -noupdate -radix hexadecimal /FourierTransform_tb/mcad_freq
add wave -noupdate -radix hexadecimal /FourierTransform_tb/mcad_data
add wave -noupdate -radix hexadecimal /FourierTransform_tb/mcad_flog
add wave -noupdate -radix hexadecimal /FourierTransform_tb/vlog_data
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/NF}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/rstn}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/clk}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/en}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/valid}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/alpha_i}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/cW_re_i}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/cW_im_i}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/data_i}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/data_o}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/curr_state}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/next_state}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/alpha}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/cW_re}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/cW_im}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/data}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/vm1}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/vm2}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/tmp}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/data_re}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/data_im}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/indx}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/mul_a}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/mul_b}
add wave -noupdate -group H8 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[8]/u_Herzel/mul_c}
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_mosi
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_miso
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_clk
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_rstn
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_awvalid
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_awaddr
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_awprot
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_awready
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_wvalid
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_wdata
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_wstrb
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_wready
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_bvalid
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_bresp
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_bready
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_arvalid
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_araddr
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_arprot
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_arready
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_rvalid
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_rdata
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_rresp
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_rready
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_cstate
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_nstate
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_cstate
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/axi_nstate
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck_syn
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck_old
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck_re
add wave -noupdate -expand -group spi2axi -radix unsigned /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_cntr
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_cmd
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_addr
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_wdata
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_rdata
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_dumm
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_stat
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss_syn
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss_old
add wave -noupdate -expand -group spi2axi -radix hexadecimal /FourierTransform_tb/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss_fe
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/NF
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/rstn
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/clk
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/en
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/valid
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/num_samp_i
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/samp_freq_i
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/freq_i
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/k_arr_o
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/ns_coef_o
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/curr_state
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/next_state
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/hcoef
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/df
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/rst
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/srst
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/indx
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/start
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/done
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/a
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/b
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/val
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/num_samp
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/samp_freq
add wave -noupdate -group div -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/freq
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/WIDTH
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/FBITS
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/FBITSW
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/ITER
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/clk
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/rst
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/start
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/busy
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/done
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/valid
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/dbz
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/ovf
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/a
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/b
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/val
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/b1
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/quo
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/quo_next
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/acc
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/acc_next
add wave -noupdate -group div_in -radix hexadecimal /FourierTransform_tb/DUT/u_div_all/u_divu/i
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/NF
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/FREQ_BA
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/DATA_BA
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/rstn
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/clk
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/freq_arr_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/en_cordic_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/valid_angel_i
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/valid_cordic_i
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/valid_herzel_i
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_arr_i
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/num_samp_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/samp_freq_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/mode_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/reset_all_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/reset_h_o
add wave -noupdate -group HREGS -radix hexadecimal -childformat {{/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awaddr -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awprot -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awvalid -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wdata -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wstrb -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wvalid -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.bready -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.araddr -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.arprot -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.arvalid -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.rready -radix hexadecimal}} -expand -subitemconfig {/FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awaddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.awvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wdata {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wstrb {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.wvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.bready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.araddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.arprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.arvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i.rready {-height 15 -radix hexadecimal}} /FourierTransform_tb/DUT/u_HerzelRegs/axio_i
add wave -noupdate -group HREGS -radix hexadecimal -childformat {{/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.awready -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.wready -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.bresp -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.bvalid -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.arready -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rdata -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rresp -radix hexadecimal} {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rvalid -radix hexadecimal}} -expand -subitemconfig {/FourierTransform_tb/DUT/u_HerzelRegs/axii_o.awready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.wready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.bresp {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.bvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.arready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rdata {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rresp {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o.rvalid {-height 15 -radix hexadecimal}} /FourierTransform_tb/DUT/u_HerzelRegs/axii_o
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/version
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/debug
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/mode
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/num_samp
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/samp_freq
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/en_cordic
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/status
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/reset_all
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/reset_h
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/freq
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/curr_state
add wave -noupdate -group HREGS -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {338841237 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 122
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3188120250 ps}
