transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {lab5.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5_test.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc" lab5_test

add wave *
view structure
view signals
run -all
