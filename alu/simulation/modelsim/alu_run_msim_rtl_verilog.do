transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/muxCI.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/logical.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/bcd_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/one_bit_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/muxBneg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/mux_out.v}
vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/muxCO.v}

vlog -vlog01compat -work work +incdir+C:/Users/Vasudharini/Downloads/alu\ (1)/alu {C:/Users/Vasudharini/Downloads/alu (1)/alu/alu_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" alu_test

add wave *
view structure
view signals
run -all
