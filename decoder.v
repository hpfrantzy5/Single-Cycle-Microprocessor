`ifndef _DECODER_V_
`define _DECODER_V_

`include "constants.v"

module decoder (
	input [15:0] Iin,
	output reg [2:0] DR, SA, SB, FS, BS,
	output reg [5:0] IMM, OFF,
	output reg MB, MD, LD, MW, EXT_SEL, HALT
);

reg [3:0] OP;
reg [2:0] RS, RT, RD, FUNCT;

always @ (*) begin
	OP = Iin[15:12];
	RS = Iin[11:9];
	RT = Iin[8:6];
	RD = Iin[5:3]; 
	FUNCT = Iin[2:0];
	//list of outputs: DR, SA, SB, FS, IMM, 
	//MB, MD, LD, MW
	case(OP)
		`NOP: begin //NOP
			case (FUNCT)
				`HALT: begin
					HALT = `ONE; BS = `THREE_BIT_DC;
					LD = `ZERO; MW = `ZERO; OFF = `SIX_BIT_DC;
					DR = `THREE_BIT_DC; SA =RS; 
					SB=RT; FS=`F_ADD; 
					IMM =`SIX_BIT_DC;
					MB=0; MD=0; EXT_SEL = 1;
				end
				default: begin
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ZERO; MW = `ZERO; OFF = `SIX_BIT_DC;
					DR = `THREE_BIT_DC; SA =RS; 
					SB=RT; FS=`F_ADD; 
					IMM =`SIX_BIT_DC;
					MB=0; MD=0; EXT_SEL = 1;
				end
			endcase					
		end
		`LB: begin //load operation
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `ONE; MW = `ZERO; OFF = `SIX_BIT_DC;
			DR = RT; SA =RS; 
			SB=RT; FS=`F_LB; 
			IMM = {RD, FUNCT};
			MB=`ONE; MD=`ONE; EXT_SEL = 1;
		end
		`SB: begin //store into memory operation
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `ZERO; MW = `ONE; OFF = `SIX_BIT_DC;
			DR = `THREE_BIT_DC; SA= RS; 
			SB= RT; FS=`F_SB; 
			IMM = {RD, FUNCT};
			MB=`ONE; MD=`ZERO; EXT_SEL = 1;
		end
		`ADDI: begin //add immediate
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `ONE; MW = `ZERO; OFF = `SIX_BIT_DC;
			DR = RT; SA= RS; 
			SB= RT; FS=`F_ADDI; 
			IMM = {RD, FUNCT};
			MB=`ONE; MD=`ZERO; EXT_SEL = 1;
		end
		`ANDI: begin //and immediate
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `ONE; MW = `ZERO; OFF = `SIX_BIT_DC;
			DR = RT; SA= RS; 
			SB= RT; FS=`F_ANDI; 
			IMM = {RD, FUNCT};
			MB=`ONE; MD=`ZERO; EXT_SEL = 0;
		end
		`ORI: begin //or immediate
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `ONE; MW = `ZERO; OFF = `SIX_BIT_DC;
			DR = RT; SA= RS; 
			SB= RT; FS=`F_ORI; 
			IMM = {RD, FUNCT};
			MB=`ONE; MD=`ZERO; EXT_SEL = 0;
		end
		`RTYPE:
			case(FUNCT)
				`F_ADD: begin //r-type add
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`ZERO; MD=`ZERO; EXT_SEL = 1;
				end
				`F_SUB: begin //r-type subtraction
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`ZERO; MD=`ZERO; EXT_SEL = 1;
				end
				`F_SRA: begin //r-type ari shift
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO; OFF = `SIX_BIT_DC;
					DR = RD; SA= RS; 
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`DC; MD=`ZERO; EXT_SEL = 1;
				end
				`F_SRL: begin //r-type left shift
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`DC; MD=`ZERO; EXT_SEL = 1;
				end
				`F_SLL: begin //r-type left shift
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`DC; MD=`ZERO; EXT_SEL = 1;
				end
				`F_AND: begin //r-type AND
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`ZERO; MD=`ZERO; EXT_SEL = 1;
				end
				`F_OR: begin //r-type OR
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `ONE; MW = `ZERO;
					DR = RD; SA= RS; OFF = `SIX_BIT_DC;
					SB= RT; FS=FUNCT; 
					IMM = `SIX_BIT_DC;
					MB=`ZERO; MD=`ZERO; EXT_SEL = 1;
				end
				default: begin //DEFAULT
					HALT = `ZERO; BS = `THREE_BIT_DC;
					LD = `DC; MW = `DC; OFF = `SIX_BIT_DC;
					DR = `THREE_BIT_DC; SA= RS; 
					SB= RT; FS=`THREE_BIT_DC; 
					IMM = `SIX_BIT_DC;
					MB=`DC; MD=`ZERO; EXT_SEL = 1;
				end
			endcase
		`BEQ: begin
			HALT = `ZERO;
			IMM = `SIX_BIT_DC; DR = `THREE_BIT_DC;
			SA = RS; SB = RT; MB = `ZERO; OFF = {RD, FUNCT};
			FS = `F_SUB; MD = `DC; LD = `ZERO;
			MW = `ZERO; BS = `BS_ZERO; EXT_SEL = `ZERO;
		end
		`BNE: begin
			HALT = `ZERO;
			IMM = `SIX_BIT_DC; DR = `THREE_BIT_DC;
			SA = RS; SB = RT; MB = `ZERO; OFF = {RD, FUNCT};
			FS = `F_SUB; MD = `DC; LD = `ZERO;
			MW = `ZERO; BS = `BS_NOT_ZERO; EXT_SEL = `ZERO;
		end
		`BGEZ: begin
			HALT = `ZERO;
			IMM = `ZERO; DR = `THREE_BIT_DC;
			SA = RS; SB = `THREE_BIT_DC; MB = `ONE;
			FS = `F_SUB; MD = `DC; LD = `ZERO; OFF = {RD, FUNCT};
			MW = `ZERO; BS = `BS_NOT_NEG; EXT_SEL = `ONE;
		end
		`BLTZ: begin
			HALT = `ZERO;
			IMM = `ZERO; DR = `THREE_BIT_DC;
			SA = RS; SB = `THREE_BIT_DC; MB = `ONE;
			FS = `F_SUB; MD = `DC; LD = `ZERO; OFF = {RD, FUNCT};
			MW = `ZERO; BS = `BS_NEG; EXT_SEL = `ONE;
		end
		default: begin //DEFAULT
			HALT = `ZERO; BS = `THREE_BIT_DC;
			LD = `DC; MW = `DC; OFF = `SIX_BIT_DC;
			DR = `THREE_BIT_DC; SA= RS; 
			SB= RT; FS=`THREE_BIT_DC; 
			IMM = `SIX_BIT_DC;
			MB=`DC; MD=`DC; EXT_SEL = 1;
		end
	endcase
end

endmodule
		

`endif /* _DECODER_V_ */