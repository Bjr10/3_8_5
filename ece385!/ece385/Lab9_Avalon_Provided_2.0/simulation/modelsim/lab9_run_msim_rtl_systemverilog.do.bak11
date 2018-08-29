transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib embedded_system
vmap embedded_system embedded_system
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/embedded_system.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_timer_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_sysid_qsys_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_onchip_memory2_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_jtag_uart_0.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_SDRAM_PLL.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_SDRAM.v}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/avalon_aes_interface.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/SubBytes.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/lab9_top.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/InvShiftRows.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/InvMixColumns.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/hexdriver.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/AES.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/invaddroundkey.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/state.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/mux4.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_irq_mapper.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -vlog01compat -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_rsp_demux_002.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_router_004.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_router_002.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_router_001.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/embedded_system_mm_interconnect_0_router.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work embedded_system +incdir+U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules {U:/ece385/Lab9_Avalon_Provided_2.0/embedded_system/synthesis/submodules/avalon_aes_interface.sv}
vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/KeyExpansion.sv}

vlog -sv -work work +incdir+U:/ece385/Lab9_Avalon_Provided_2.0 {U:/ece385/Lab9_Avalon_Provided_2.0/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L embedded_system -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 6000 ns
