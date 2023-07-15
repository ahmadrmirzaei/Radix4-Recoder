set workspace [pwd]
set root $workspace/../..

source $root/tcl/tools.tcl

vlib work

set args [lindex $argv 1]

set folders [lindex $args 2]
set type [lindex $args 3]

buildFolders $root $folders

vsim tb

set input_waves {}
set input_signals [list "/tb/x" "/tb/y"]
foreach signal $input_signals {
	lappend input_waves [dict create formatt "logic" radix "binary" signal $signal]
}

set output_waves {}
if {$type == "serial"} {
	lappend output_waves [dict create formatt "logic" radix "binary" signal "/tb/answering"]
}
lappend output_waves [dict create formatt "literal" radix "binary" signal "/tb/xy"]

if {$type == "serial"} {
	set instances [list "regX" "selector" "regXY" "shiftRegC" "recoder" "controller"]
}

if {$type == "parallel"} {
	set instances [list "multipleGenerator" "adder"]
}

makeWaveform "tb" $input_waves $output_waves $instances

run -all