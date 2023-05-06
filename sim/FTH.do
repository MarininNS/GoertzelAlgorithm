onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/rstn
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/clk
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/spi_sck
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/spi_ss_n
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/spi_mosi
add wave -noupdate -expand -group DUT /FourierTransform_tb/DUT/spi_miso
add wave -noupdate -expand -group DUT -radix hexadecimal /FourierTransform_tb/DUT/sample
add wave -noupdate -group DataScale /FourierTransform_tb/DUT/u_DataScale/SCALE_COEF
add wave -noupdate -group DataScale /FourierTransform_tb/DUT/u_DataScale/rstn
add wave -noupdate -group DataScale /FourierTransform_tb/DUT/u_DataScale/clk
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_i
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_o
add wave -noupdate -group DataScale -radix hexadecimal /FourierTransform_tb/DUT/u_DataScale/data_m
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/NF
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/ANGEL_COEF
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/rstn
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/clk
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/en
add wave -noupdate -expand -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/freq_i
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/valid
add wave -noupdate -expand -group Angel -radix hexadecimal /FourierTransform_tb/DUT/u_Angel/angel_o
add wave -noupdate -expand -group Angel /FourierTransform_tb/DUT/u_Angel/indx
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/NF
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/COEF_DEF
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/rstn
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/clk
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/en
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/ang_i
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/valid
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/cos_o
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/sin_o
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/alpha
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/ang
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/cos
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/sin
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/cos_m
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/sin_m
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/indx0
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/indx1
add wave -noupdate -group Cordic -radix hexadecimal /FourierTransform_tb/DUT/u_Cordic/atan
add wave -noupdate -group Cordic /FourierTransform_tb/DUT/u_Cordic/init
add wave -noupdate -group TOP /FourierTransform_tb/DUT/NF
add wave -noupdate -group TOP /FourierTransform_tb/DUT/NS
add wave -noupdate -group TOP /FourierTransform_tb/DUT/rstn
add wave -noupdate -group TOP /FourierTransform_tb/DUT/clk
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/sample
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/freq_arr
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/angel_arr
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/coefW_re
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/coefW_im
add wave -noupdate -group TOP -radix hexadecimal /FourierTransform_tb/DUT/alpha
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/NF}
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/NS}
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/rstn}
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/clk}
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/en}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/alpha_i}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/cW_re_i}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/cW_im_i}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_i}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_o}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/alpha}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/coefW_re}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/coefW_im}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm2}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_alpha}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_re}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_re_32}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_im}
add wave -noupdate -group H10 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/data_im_32}
add wave -noupdate -group H10 -radix unsigned {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/indx1}
add wave -noupdate -group H10 {/FourierTransform_tb/DUT/herzel[10]/u_Herzel/vmcw}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/NF}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/NS}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/rstn}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/clk}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/en}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/alpha_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/cW_re_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/cW_im_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_i}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_o}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/alpha}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/coefW_re}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/coefW_im}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm2}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_alpha}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_re}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_re_32}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_im}
add wave -noupdate -group H9 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/data_im_32}
add wave -noupdate -group H9 -radix unsigned {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/indx1}
add wave -noupdate -group H9 {/FourierTransform_tb/DUT/herzel[9]/u_Herzel/vmcw}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/NF}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/NS}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/rstn}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/clk}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/en}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/alpha_i}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/coefW_re}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/coefW_im}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_i}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_o}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/alpha}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm2}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_alpha}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_re}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_re_32}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_im}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/data_im_32}
add wave -noupdate -group H7 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/indx1}
add wave -noupdate -group H7 {/FourierTransform_tb/DUT/herzel[7]/u_Herzel/vmcw}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/NF}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/NS}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/rstn}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/clk}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/en}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/alpha_i}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/coefW_re}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/coefW_im}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_i}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_o}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/alpha}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm2}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_alpha}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_re}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_re_32}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_im}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/data_im_32}
add wave -noupdate -group H6 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/indx1}
add wave -noupdate -group H6 {/FourierTransform_tb/DUT/herzel[6]/u_Herzel/vmcw}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/NF}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/NS}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/rstn}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/clk}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/en}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/alpha_i}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/coefW_re}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/coefW_im}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_i}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_o}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/alpha}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm2}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_alpha}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_re}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_re_32}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_im}
add wave -noupdate -group H5 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/data_im_32}
add wave -noupdate -group H5 -radix unsigned {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/indx1}
add wave -noupdate -group H5 {/FourierTransform_tb/DUT/herzel[5]/u_Herzel/vmcw}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/NF}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/NS}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/rstn}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/clk}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/en}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/alpha_i}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/coefW_re}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/coefW_im}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_i}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_o}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/alpha}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm2}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_alpha}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_re}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_re_32}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_im}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/data_im_32}
add wave -noupdate -group H2 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/indx1}
add wave -noupdate -group H2 {/FourierTransform_tb/DUT/herzel[2]/u_Herzel/vmcw}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/NF}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/NS}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/rstn}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/clk}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/en}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/alpha_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/coefW_re}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/coefW_im}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_i}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_o}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/alpha}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm2}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_alpha}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_re}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_re_32}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_im}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/data_im_32}
add wave -noupdate -group H0 -radix hexadecimal {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/indx1}
add wave -noupdate -group H0 {/FourierTransform_tb/DUT/herzel[0]/u_Herzel/vmcw}
add wave -noupdate -radix hexadecimal -childformat {{/FourierTransform_tb/DUT/axio.awaddr -radix hexadecimal} {/FourierTransform_tb/DUT/axio.awprot -radix hexadecimal} {/FourierTransform_tb/DUT/axio.awvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wdata -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wstrb -radix hexadecimal} {/FourierTransform_tb/DUT/axio.wvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.bready -radix hexadecimal} {/FourierTransform_tb/DUT/axio.araddr -radix hexadecimal} {/FourierTransform_tb/DUT/axio.arprot -radix hexadecimal} {/FourierTransform_tb/DUT/axio.arvalid -radix hexadecimal} {/FourierTransform_tb/DUT/axio.rready -radix hexadecimal}} -subitemconfig {/FourierTransform_tb/DUT/axio.awaddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.awprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.awvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wdata {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wstrb {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.wvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.bready {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.araddr {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.arprot {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.arvalid {-height 15 -radix hexadecimal} /FourierTransform_tb/DUT/axio.rready {-height 15 -radix hexadecimal}} /FourierTransform_tb/DUT/axio
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/axii
add wave -noupdate -radix hexadecimal /FourierTransform_tb/spi_data
add wave -noupdate -radix hexadecimal /FourierTransform_tb/spi_stat
add wave -noupdate /FourierTransform_tb/DUT/u_HerzelRegs/status
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_1
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_2
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_3
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_4
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_5
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_6
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_7
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_8
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_9
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_10
add wave -noupdate -radix hexadecimal /FourierTransform_tb/DUT/u_HerzelRegs/data_11
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1310702721 ps} 0}
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
WaveRestoreZoom {0 ps} {2761523100 ps}
