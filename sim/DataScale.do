onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /DataScale_tb/DUT/SCALE_COEF
add wave -noupdate /DataScale_tb/DUT/rstn
add wave -noupdate /DataScale_tb/DUT/clk
add wave -noupdate /DataScale_tb/DUT/en
add wave -noupdate -radix hexadecimal /DataScale_tb/DUT/data_i
add wave -noupdate -radix hexadecimal /DataScale_tb/DUT/data_o
add wave -noupdate -radix hexadecimal /DataScale_tb/DUT/data_m
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {219 ps} 0}
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
WaveRestoreZoom {62 ps} {180 ps}
