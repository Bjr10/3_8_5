transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/tristate.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/Mem2IO.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/ISDU.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/datapath.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/regis_file.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/bus.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/mux_module.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/mux_4.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/mux_3.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/hexdriver.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/Real_reg_file.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/SEXT_6.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/SEXT_9.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/SEXT.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/SEXT_5.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/CC.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/ALU_LOGIC.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/slc3.sv}

vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
