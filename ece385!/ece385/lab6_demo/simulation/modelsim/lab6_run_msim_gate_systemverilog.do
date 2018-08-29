transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {lab6_7_1200mv_85c_slow.svo}

vlog -sv -work work +incdir+U:/ece385/lab6_demo {U:/ece385/lab6_demo/testbench.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
