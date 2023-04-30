onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/rstn
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/clk
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/spi_sck
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/spi_ss_n
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/spi_mosi
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/spi_miso
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/cEn
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/hEn
add wave -noupdate -expand -group DUT /tb_FourierTransform/DUT/valid
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_FourierTransform/DUT/sample
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_FourierTransform/DUT/data_o
add wave -noupdate -group DataScale /tb_FourierTransform/DUT/u_DataScale/SCALE_COEF
add wave -noupdate -group DataScale /tb_FourierTransform/DUT/u_DataScale/rstn
add wave -noupdate -group DataScale /tb_FourierTransform/DUT/u_DataScale/clk
add wave -noupdate -group DataScale -radix hexadecimal /tb_FourierTransform/DUT/u_DataScale/data_i
add wave -noupdate -group DataScale -radix hexadecimal /tb_FourierTransform/DUT/u_DataScale/data_o
add wave -noupdate -group DataScale -radix hexadecimal /tb_FourierTransform/DUT/u_DataScale/data_m
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/NF
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/ANGEL_COEF
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/rstn
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/clk
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/en
add wave -noupdate -group Angel -radix hexadecimal /tb_FourierTransform/DUT/u_Angel/freq_i
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/valid
add wave -noupdate -group Angel -radix hexadecimal /tb_FourierTransform/DUT/u_Angel/angel_o
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/indx
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/NF
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/COEF_DEF
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/rstn
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/clk
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/en
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/ang_i
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/valid
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/cos_o
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/sin_o
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/alpha
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/ang
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/cos
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/sin
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/cos_m
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/sin_m
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/indx0
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/indx1
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/atan
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/init
add wave -noupdate -group TOP /tb_FourierTransform/DUT/NF
add wave -noupdate -group TOP /tb_FourierTransform/DUT/NS
add wave -noupdate -group TOP /tb_FourierTransform/DUT/rstn
add wave -noupdate -group TOP /tb_FourierTransform/DUT/clk
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/sample
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/data_o
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/freq_arr
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/angel_arr
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/coefW_re
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/coefW_im
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/alpha
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/data
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/NF}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/NS}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/rstn}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/clk}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/en}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/alpha_i}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/cW_re_i}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/cW_im_i}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_i}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_o}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/alpha}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/coefW_re}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/coefW_im}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm2}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_alpha}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_re}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_re_32}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_im}
add wave -noupdate -group H10 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/data_im_32}
add wave -noupdate -group H10 -radix unsigned {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/indx1}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/vmcw}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/NF}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/NS}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/rstn}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/clk}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/en}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/alpha_i}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/cW_re_i}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/cW_im_i}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_i}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_o}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/alpha}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/coefW_re}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/coefW_im}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm2}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_alpha}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_re}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_re_32}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_im}
add wave -noupdate -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_im_32}
add wave -noupdate -group H9 -radix unsigned {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/indx1}
add wave -noupdate -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vmcw}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/NF}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/NS}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/rstn}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/clk}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/en}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/alpha_i}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/coefW_re}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/coefW_im}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_i}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_o}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/alpha}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm2}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_alpha}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_re}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_re_32}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_im}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/data_im_32}
add wave -noupdate -group H7 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/indx1}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/vmcw}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/NF}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/NS}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/rstn}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/clk}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/en}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/alpha_i}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/coefW_re}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/coefW_im}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_i}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_o}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/alpha}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm2}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_alpha}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_re}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_re_32}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_im}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/data_im_32}
add wave -noupdate -group H6 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/indx1}
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/vmcw}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/NF}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/NS}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/rstn}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/clk}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/en}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/alpha_i}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/coefW_re}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/coefW_im}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_i}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_o}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/alpha}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm2}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_alpha}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_re}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_re_32}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_im}
add wave -noupdate -group H5 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/data_im_32}
add wave -noupdate -group H5 -radix unsigned {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/indx1}
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/vmcw}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/NF}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/NS}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/rstn}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/clk}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/en}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/alpha_i}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/coefW_re}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/coefW_im}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_i}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_o}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/alpha}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm2}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_alpha}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_re}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_re_32}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_im}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/data_im_32}
add wave -noupdate -group H2 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/indx1}
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/vmcw}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/NF}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/NS}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/rstn}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/clk}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/en}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/alpha_i}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/coefW_re}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/coefW_im}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_i}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_o}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/alpha}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm2}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_alpha}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_alpha_32}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_cW_re}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_cW_im}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_re}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_re_32}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_im}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/data_im_32}
add wave -noupdate -group H0 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/indx1}
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/vmcw}
add wave -noupdate -radix hexadecimal -childformat {{/tb_FourierTransform/DUT/axio.awaddr -radix hexadecimal} {/tb_FourierTransform/DUT/axio.awprot -radix hexadecimal} {/tb_FourierTransform/DUT/axio.awvalid -radix hexadecimal} {/tb_FourierTransform/DUT/axio.wdata -radix hexadecimal} {/tb_FourierTransform/DUT/axio.wstrb -radix hexadecimal} {/tb_FourierTransform/DUT/axio.wvalid -radix hexadecimal} {/tb_FourierTransform/DUT/axio.bready -radix hexadecimal} {/tb_FourierTransform/DUT/axio.araddr -radix hexadecimal} {/tb_FourierTransform/DUT/axio.arprot -radix hexadecimal} {/tb_FourierTransform/DUT/axio.arvalid -radix hexadecimal} {/tb_FourierTransform/DUT/axio.rready -radix hexadecimal}} -expand -subitemconfig {/tb_FourierTransform/DUT/axio.awaddr {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.awprot {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.awvalid {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.wdata {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.wstrb {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.wvalid {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.bready {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.araddr {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.arprot {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.arvalid {-height 15 -radix hexadecimal} /tb_FourierTransform/DUT/axio.rready {-height 15 -radix hexadecimal}} /tb_FourierTransform/DUT/axio
add wave -noupdate -radix hexadecimal /tb_FourierTransform/DUT/axii
add wave -noupdate -radix hexadecimal /tb_FourierTransform/spi_data
add wave -noupdate -radix hexadecimal /tb_FourierTransform/spi_stat
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/SPI_CPOL
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/SPI_CPHA
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/AXI_ADDR_WIDTH
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/CMD_WRITE
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/SPI_FRAME_LENGTH_BYTES
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss_n
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_mosi
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_miso
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_aclk
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_aresetn
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awaddr
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awprot
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awvalid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awready
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wdata
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wstrb
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wvalid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wready
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_araddr
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_arprot
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_arvalid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_arready
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_rdata
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_rresp
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_rvalid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_rready
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_bresp
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_bvalid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_bready
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_state
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_state
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck_sync_old
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_rx_shreg
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_tx_shreg
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/CMD_READ
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_bresp_valid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_bresp
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_rresp
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_rdata_valid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_rdata
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_rx_cmd
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_rx_addr
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_rx_wdata
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_rx_valid
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awvalid_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wvalid_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_fsm_reset
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awaddr_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_awprot_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wdata_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_wstrb_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_araddr_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_arprot_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_arvalid_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_rready_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/s_axi_bready_int
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_sck_sync
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/spi_ss_n_sync
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/u_spi2axi_wrap/u_spi2axi/axi_areset
add wave -noupdate -group SPI2AXIL -radix hexadecimal /tb_FourierTransform/DUT/axio
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {106762093 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 100
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
WaveRestoreZoom {114276 ns} {639276 ns}
