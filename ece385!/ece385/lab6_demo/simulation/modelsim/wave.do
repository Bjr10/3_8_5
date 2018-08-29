onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/S
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Reset
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/ADDR
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/HEX4
add wave -noupdate /testbench/HEX5
add wave -noupdate /testbench/HEX6
add wave -noupdate /testbench/HEX7
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/CE
add wave -noupdate /testbench/UB
add wave -noupdate /testbench/LB
add wave -noupdate /testbench/OE
add wave -noupdate /testbench/WE
add wave -noupdate -radix hexadecimal /testbench/Data
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/set_cc/LD_CC
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/set_cc/bus
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/set_cc/IR
add wave -noupdate /testbench/my_slc/d0/set_cc/BEN
add wave -noupdate -label {ben in isdu} /testbench/my_slc/state_controller/BEN
add wave -noupdate -label {ben reg in} /testbench/my_slc/d0/BEN_REGISTER/input_val
add wave -noupdate -label benregout /testbench/my_slc/d0/BEN_REGISTER/output_val
add wave -noupdate -label {ben reg load} /testbench/my_slc/d0/BEN_REGISTER/Load
add wave -noupdate /testbench/my_slc/BEN
add wave -noupdate /testbench/my_slc/d0/BEN_O
add wave -noupdate /testbench/my_slc/d0/set_cc/N
add wave -noupdate /testbench/my_slc/d0/set_cc/Z
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/set_cc/P
add wave -noupdate -radix hexadecimal /testbench/my_slc/PC
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/PC_O
add wave -noupdate -radix hexadecimal /testbench/my_slc/state_controller/State
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R0
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R1
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R2
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R3
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R4
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R5
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R6
add wave -noupdate -radix hexadecimal /testbench/my_slc/d0/register_file/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {137134 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {99173 ps} {296049 ps}
