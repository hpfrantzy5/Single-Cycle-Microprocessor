`ifndef _CPU_V_
`define _CPU_V_

`include "constants.v"

module cpu
(
  input              CLK,
  input              RESET,
  input       [15:0] Iin,
  input       [ 7:0] Din,
  input 					EN_L,
  output reg  [ 7:0] PC,
  output reg  [ 7:0] NextPC,
  output  reg [ 7:0] DataA,
  output  reg [ 7:0] DataB,
  output  reg [ 7:0] DataC,
  output  reg [ 7:0] DataD,
  output         MW
);

wire [2:0] DR, FS, BS, SA, SB;
wire [5:0] IMM, OFF;
wire MB, MD, LD, SO, Z, N, C, V, H, MP, HALT, EXT_SEL, EN_L_prev;
wire [7:0] IMM_extended, new_Data_B;
wire [7:0] PC_INCR, PC_wire, NextPC_wire, Data_A_inter, Data_B_new, Data_C_inter, Data_D_inter, Data_B_inter;
wire [7:0] plus_2, branch_ins, OFF_extended;

halt halt0 (
	.EN_L_prev (EN_L_prev),
	.EN_L (EN_L),
	.HALT (HALT),
	.H  (H)
);

pc pc0 (
	.CLK (CLK),
	.RESET (RESET),
	.EN_L  (EN_L),
	.NextPC (NextPC_wire),
	.PC (PC_wire),
	.EN_L_curr (EN_L_prev)
);

adder adder_plus2 (
	.A (PC_wire),
	.B (8'b00000010),
	.Cin (`ZERO),
	.Sum (plus_2)
);

sign_extend sext_offset (
	.EXT_SEL (1'b1),
	.IMM (OFF),
	.IMM_new (OFF_extended)
);

adder adder_branch (
	.A (plus_2),
	.B (OFF_extended),
	.Cin (`ZERO),
	.Sum (branch_ins)
);

pc_mux pc_mux0 (
	.H (H),
	.MP (MP),
	.plus_2 (plus_2),
	.branch_ins (branch_ins),
	.curr_pc (PC_wire),
	.NextPC (NextPC_wire)
);


decoder decoder0 (
	.Iin (Iin),
	.DR (DR),
	.SA (SA),
	.SB (SB),
	.FS (FS),
	.IMM (IMM),
	.MB (MB),
	.MD (MD),
	.LD (LD),
	.MW (MW),
	.BS (BS),
	.OFF (OFF),
	.HALT (HALT),
	.EXT_SEL (EXT_SEL)
);

register_file rf0 (
	.CLK (CLK),
	.RESET (RESET),
	.SA (SA),
	.SB (SB),
	.LD (LD),
	.DR (DR),
	.Din (Data_C_inter),
	.Data_A (Data_A_inter),
	.Data_B (Data_B_inter)
);

sign_extend sign_ext0 (
	.EXT_SEL (EXT_SEL),
	.IMM (IMM),
	.IMM_new (IMM_extended)
);

imm_mux imm_mux0 (
	.Data_B (Data_B_inter),
	.IMM_extended (IMM_extended),
	.MB (MB),
	.new_Data_B (Data_B_new)
);

alu alu0 (
  .A (Data_A_inter),
  .B (Data_B_new),
  .OP (FS),
  .Y  (Data_D_inter),
  .ZRO (Z),
  .NEG (N),
  .SO  (SO),
  .CO  (C),
  .OVR (V)
);

branch_mux branch_mux0 (
	.Z (Z),
	.N (N),
	.BS (BS),
	.MP (MP)
);

mem_mux mem_mux0(
	.dram_output (Din),
	.Data_D (Data_D_inter),
	.MD (MD),
	.Data_C (Data_C_inter)
);

always @ (*) begin
	PC = PC_wire;
	NextPC = NextPC_wire;
	DataA = Data_A_inter;
	DataC = Data_C_inter;
	DataD = Data_D_inter;
	DataB = Data_B_inter;
end

endmodule

`endif /* _CPU_V_ */