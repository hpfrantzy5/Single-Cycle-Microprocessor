`ifndef _CONSTANTS_V_
`define _CONSTANTS_V_

`define REG0 3'b000
`define REG1 3'b001
`define REG2 3'b010
`define REG3 3'b011
`define REG4 3'b100
`define REG5 3'b101
`define REG6 3'b110
`define REG7 3'b111

`define ONE 1'b1
`define ZERO 1'b0
`define EIGHT_BIT_ZERO 8'b0
`define THREE_BIT_DC 3'b111
`define SIX_BIT_DC 6'b101011
`define EIGHT_BIT_DC 8'b00000000
`define DC 1'b0
`define NEG_PADDING 2'b11
`define POS_PADDING 2'b00

`define PC_INCR 8'b00000010

`define NOP 4'b0000
`define LB 4'b0010
`define SB 4'b0100
`define ADDI 4'b0101
`define ANDI 4'b0110
`define ORI 4'b0111
`define RTYPE 4'b1111
`define BEQ 4'b1000
`define BNE 4'b1001
`define BGEZ 4'b1010
`define BLTZ 4'b1011

`define F_LB 3'b000
`define F_SB 3'b000
`define F_ADDI 3'b000
`define F_ANDI 3'b101
`define F_ORI  3'b110
`define HALT 3'b001

`define F_ADD 3'b000
`define F_SUB 3'b001
`define F_SRA 3'b010
`define F_SRL 3'b011 
`define F_SLL 3'b100
`define F_AND 3'b101
`define F_OR 3'b110

`define BS_ZERO 3'b000
`define BS_NOT_ZERO 3'b001
`define BS_NOT_NEG 3'b010
`define BS_NEG 3'b011



`endif /* _CONSTANTS_V_ */