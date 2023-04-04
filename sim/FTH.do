onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DUT /tb_FourierTransform/SIM_TIM
add wave -noupdate -expand -group DUT /tb_FourierTransform/CLK_PERIOD
add wave -noupdate -expand -group DUT /tb_FourierTransform/NF
add wave -noupdate -expand -group DUT /tb_FourierTransform/NS
add wave -noupdate -expand -group DUT /tb_FourierTransform/rstn
add wave -noupdate -expand -group DUT /tb_FourierTransform/clk
add wave -noupdate -expand -group DUT /tb_FourierTransform/ready
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_FourierTransform/sample
add wave -noupdate -expand -group DUT -radix hexadecimal /tb_FourierTransform/data_o
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
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/ready
add wave -noupdate -group Angel -radix hexadecimal /tb_FourierTransform/DUT/u_Angel/freq_i
add wave -noupdate -group Angel -radix hexadecimal /tb_FourierTransform/DUT/u_Angel/angel_o
add wave -noupdate -group Angel /tb_FourierTransform/DUT/u_Angel/indx
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/NF
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/COEF_DEF
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/rstn
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/clk
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/en
add wave -noupdate -group Cordic /tb_FourierTransform/DUT/u_Cordic/ready
add wave -noupdate -group Cordic -radix hexadecimal /tb_FourierTransform/DUT/u_Cordic/ang_i
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
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/ready
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/sample
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/data_o
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/freq_arr
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/angel_arr
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/coefW_re
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/coefW_im
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/alpha
add wave -noupdate -group TOP -radix hexadecimal /tb_FourierTransform/DUT/data
add wave -noupdate -group TOP /tb_FourierTransform/DUT/ready0
add wave -noupdate -group TOP /tb_FourierTransform/DUT/ready1
add wave -noupdate -group TOP /tb_FourierTransform/DUT/herzelEn
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/NF}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/NS}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/rstn}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/clk}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/en}
add wave -noupdate -group H10 {/tb_FourierTransform/DUT/herzel[10]/u_Herzel/ready}
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
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/NF}
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/NS}
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/rstn}
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/clk}
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/en}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/ready}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/alpha_i}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/cW_re_i}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/cW_im_i}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_i}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_o}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/alpha}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/coefW_re}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/coefW_im}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm2}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_alpha}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_alpha_32}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re_32}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_re_m2}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_im}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vm1_cW_im_32}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_re}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_re_32}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_im}
add wave -noupdate -expand -group H9 -radix hexadecimal {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/data_im_32}
add wave -noupdate -expand -group H9 -radix unsigned {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/indx1}
add wave -noupdate -expand -group H9 {/tb_FourierTransform/DUT/herzel[9]/u_Herzel/vmcw}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/NF}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/NS}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/rstn}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/clk}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/en}
add wave -noupdate -group H7 {/tb_FourierTransform/DUT/herzel[7]/u_Herzel/ready}
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
add wave -noupdate -group H6 {/tb_FourierTransform/DUT/herzel[6]/u_Herzel/ready}
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
add wave -noupdate -group H5 {/tb_FourierTransform/DUT/herzel[5]/u_Herzel/ready}
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
add wave -noupdate -group H2 {/tb_FourierTransform/DUT/herzel[2]/u_Herzel/ready}
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
add wave -noupdate -group H0 {/tb_FourierTransform/DUT/herzel[0]/u_Herzel/ready}
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3432 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 126
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
WaveRestoreZoom {1550 ps} {18819 ps}
