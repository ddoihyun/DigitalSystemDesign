vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -sv "+incdir+../../../../DSD_FinalProject_Temp_Camera_revised.gen/sources_1/ip/clk_wiz_1" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../DSD_FinalProject_Temp_Camera_revised.gen/sources_1/ip/clk_wiz_1" \
"../../../../DSD_FinalProject_Temp_Camera_revised.gen/sources_1/ip/clk_wiz_1/clk_wiz_1_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

