`ifndef _REGISTER_FILE_V_
`define _REGISTER_FILE_V_

`include "constants.v"

module register_file (
	input CLK,
	input RESET,
	input [2:0] SA,
	input [2:0] SB,
	input LD,
	input [2:0] DR,
	input [7:0] Din,
	output reg [7:0] Data_A,
	output reg [7:0] Data_B
);

wire [7:0] register_0; wire [7:0] register_1; wire [7:0] register_2; wire [7:0] register_3; 
wire [7:0] register_4; wire [7:0] register_5; wire [7:0] register_6; wire [7:0] register_7; 
reg [7:0] LOAD;

wire [7:0] register_array [7:0];

//Decoder: Decides which load to use
always @ (*) begin
	LOAD = `EIGHT_BIT_ZERO;
	case (DR)
		`REG0: LOAD[0] = LD;
		`REG1: LOAD[1] = LD;
		`REG2: LOAD[2] = LD;
		`REG3: LOAD[3] = LD;
		`REG4: LOAD[4] = LD;
		`REG5: LOAD[5] = LD;
		`REG6: LOAD[6] = LD;
		`REG7: LOAD[7] = LD;
		default: LOAD = `EIGHT_BIT_ZERO;
	endcase
end

//instantiating registers
register reg_0 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[0]),
	.Q		 (register_0)
);

register reg_1 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[1]),
	.Q		 (register_1)
);

register reg_2 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[2]),
	.Q		 (register_2)
);

register reg_3 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[3]),
	.Q		 (register_3)
);

register reg_4 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[4]),
	.Q		 (register_4)
);

register reg_5 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[5]),
	.Q		 (register_5)
);

register reg_6 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[6]),
	.Q		 (register_6)
);

register reg_7 (
	.CLK   (CLK),
	.RESET (RESET),
	.D		 (Din),
	.LD	 (LOAD[7]),
	.Q		 (register_7)
);


always @ (*) begin
	case(SA)
		`REG0: Data_A = register_0;
		`REG1: Data_A = register_1;
		`REG2: Data_A = register_2;
		`REG3: Data_A = register_3;
		`REG4: Data_A = register_4;
		`REG5: Data_A = register_5;
		`REG6: Data_A = register_6;
		`REG7: Data_A = register_7;
		default: Data_A = `EIGHT_BIT_ZERO;
	endcase
	case(SB)
		`REG0: Data_B = register_0;
		`REG1: Data_B = register_1;
		`REG2: Data_B = register_2;
		`REG3: Data_B = register_3;
		`REG4: Data_B = register_4;
		`REG5: Data_B = register_5;
		`REG6: Data_B = register_6;
		`REG7: Data_B = register_7;
		default: Data_B = `EIGHT_BIT_ZERO;
	endcase
end

endmodule
`endif /* _REGISTER_FILE_V_ */