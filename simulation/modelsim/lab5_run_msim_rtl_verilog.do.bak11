transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5iramHBM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5dramHBM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/one_bit_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/muxCO.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/muxCI.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/muxBneg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/mux_out.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/logical.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5/alu {C:/Users/Lab User/Downloads/Lab 5/Lab 5/alu/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/mem_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5_clk.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/imm_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/hex_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/constants.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/pc_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/branch_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/register_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/halt.v}

vlog -vlog01compat -work work +incdir+C:/Users/Lab\ User/Downloads/Lab\ 5/Lab\ 5 {C:/Users/Lab User/Downloads/Lab 5/Lab 5/lab5_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" lab5_test

add wave *
view structure
view signals
run -all
