`ifndef _HALT_V_
`define _HALT_V_

`include "constants.v"

module halt (
	input EN_L_prev,
	input EN_L,
	input HALT,
	output reg H
);

always @ (*) begin
	if (HALT) begin
		H = 1'b1;
		case(EN_L_prev)
			1'b1: begin 
				if (~EN_L) H = 1'b0;
				else H = 1'b1;
			end
			1'b0: H = 1'b1;
			default: H = 1'b1;
		endcase
	end
	else H = 1'b0;
end

//reg [1:0] Snext, Scurr;
//
//parameter [1:0] INIT = 2'b00,
//					 HALT_EN = 2'b01,
//					 HALT_EN_2 = 2'b10;
//
//initial begin
//	Scurr = INIT;
//end
//					 
//always @ (*) begin
//	case(Scurr)
//		INIT: begin
//			if (HALT && ~EN_L) Snext = HALT_EN; 
//			else if (HALT && EN_L) Snext = HALT_EN_2;
//			else Snext = INIT;
//		end
//		HALT_EN: begin
//			if (EN_L) Snext = HALT_EN_2;
//			else Snext = HALT_EN;
//		end
//		HALT_EN_2: begin
//			if (~EN_L) Snext = INIT;
//			else Snext = HALT_EN_2;
//		end
//	endcase
//end
//
//always @ (Scurr) begin
//	case(Scurr) 
//		INIT: H = 1'b0;
//		HALT_EN: H = 1'b1;
//		HALT_EN_2: H = 1'b1;
//	endcase
//end
//
//always @ (posedge CLK) begin
//	Scurr <= Snext;
//end

endmodule
`endif /* _HALT_V_ */