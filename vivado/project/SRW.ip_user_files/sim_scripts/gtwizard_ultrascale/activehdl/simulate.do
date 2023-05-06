onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+gtwizard_ultrascale -L gtwizard_ultrascale_v1_7_8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.gtwizard_ultrascale xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {gtwizard_ultrascale.udo}

run -all

endsim

quit -force
