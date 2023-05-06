vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../../gtwizard_ultrascale_ex.srcs/sources_1/ip/gtwizard_ultrascale_vio_0/hdl/verilog" "+incdir+../../../../gtwizard_ultrascale_ex.srcs/sources_1/ip/gtwizard_ultrascale_vio_0/hdl" \
"../../../../gtwizard_ultrascale_ex.srcs/sources_1/ip/gtwizard_ultrascale_vio_0/sim/gtwizard_ultrascale_vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

