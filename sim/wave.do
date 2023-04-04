onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Cordic_tb/CLK_PER
add wave -noupdate /Cordic_tb/SIM_TIM
add wave -noupdate /Cordic_tb/rstn
add wave -noupdate /Cordic_tb/clk
add wave -noupdate /Cordic_tb/en
add wave -noupdate /Cordic_tb/ready
add wave -noupdate -radix hexadecimal /Cordic_tb/ang_i
add wave -noupdate -radix hexadecimal /Cordic_tb/cos_o
add wave -noupdate -radix hexadecimal /Cordic_tb/sin_o
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/FLOAT_SIZE
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/INT_SIZE
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/COEF_DEF
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/rstn
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/clk
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/en
add wave -noupdate -expand -group DUT /Cordic_tb/DUT/ready
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/ang_i
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/cos_o
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/sin_o
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/ang
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/cos
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/sin
add wave -noupdate -expand -group DUT -radix unsigned /Cordic_tb/DUT/indx
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/atan
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/cos_m
add wave -noupdate -expand -group DUT -radix hexadecimal /Cordic_tb/DUT/sin_m
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {233 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {461 ps} {510 ps}
