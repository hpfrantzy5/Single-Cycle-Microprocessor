`ifndef _CONTROL_V_
`define _CONTROL_V_

/**
	LA   : logical shift(0) or arithmetic shift(1)
	LR   : direction of shift (0 = left)
	LOP  : operation is AND(1) or OR(0)
	BSEL : whether to negate B or not
	CISEL: whether to pass 1 to the adder or not
	**/
module control(
  input  [2:0] OP,
  output       CISEL,
  output reg [1:0] BSEL, OSEL,
  output reg	LA, LR, LOP
);
// You will need to add other inputs and outputs to the control unit.

assign CISEL = ( OP == 3'b001 ) ? 1'b1 : 1'b0; 

always @( * ) begin
	case (OP)
		3'b000: begin //ADD
			BSEL = 2'b00;
			OSEL = 2'b00;
			LA = 1'b0;
			LR = 1'b0;
			LOP = 1'b0;
		end
		3'b001: begin //SUB
			BSEL = 2'b01;
			OSEL = 2'b00;
			LA = 1'b0;
			LR = 1'b0;
			LOP = 1'b0;
		end
		3'b010: begin //SRA
			LA = 1'b1;
			OSEL = 2'b01;
			BSEL = 2'b00; LR = 1'b0; LOP = 1'b0;
		end
		3'b011: begin //SRL
			LA = 1'b0;
			LR = 1'b1;
			OSEL = 2'b01;
			BSEL = 2'b00; LOP = 1'b0;
		end
		3'b100: begin //SLL
			LA = 1'b0;
			LR = 1'b0;
			OSEL = 2'b01;
			BSEL = 2'b00; LOP = 1'b0;
		end
		3'b101: begin //AND
			LOP = 1'b1;
			OSEL = 2'b10;
			LA = 1'b0; LR = 1'b0; BSEL = 2'b00;
		end
		3'b110: begin //OR
			LOP = 1'b0;
			OSEL = 2'b10;
			LA = 1'b0; LR = 1'b0; BSEL = 2'b00;
		end
		default: begin
			BSEL = 2'b00;
			OSEL = 2'b00;
			LA = 1'b0;
			LR = 1'b0;
			LOP = 1'b0;
		end
	endcase
end
			
			

endmodule

`endif /* _CONTROL_V_ */