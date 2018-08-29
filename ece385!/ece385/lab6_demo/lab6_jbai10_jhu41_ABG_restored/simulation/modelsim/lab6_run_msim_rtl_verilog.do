transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/tristate.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/Mem2IO.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/ISDU.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/datapath.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/regis_file.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/bus.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/mux_module.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/mux_4.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/mux_3.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/hexdriver.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/Real_reg_file.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/SEXT_6.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/SEXT_9.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/SEXT.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/SEXT_5.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/CC.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/ALU_LOGIC.sv}
vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/slc3.sv}

vlog -sv -work work +incdir+U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored {U:/ece385/lab6_demo/lab6_jbai10_jhu41_ABG_restored/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
