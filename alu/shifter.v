`ifndef _SHIFTER_V_
`define _SHIFTER_V_

module shifter
(
	input [7:0] A,
	input LA, LR,
	output reg [7:0] Y,
	output reg SO, OVR, CO
);

reg [7:0] RES;

initial begin 
	SO = 0;
end

always @( * ) begin
	case (LA)
		1'b1: begin //Arithmetic Shift Right
			SO = A[0];
			CO = A[0];
			OVR = 1'b0;
			RES = A >>> 1;
			RES[7] = A[7];
			Y = RES;
		end
		1'b0: begin //Logical Shift
			Y = LR ? (A >> 1) : (A << 1);
			SO = LR ? A[0] : A[7];
			CO = LR ? A[0] : A[7];
			OVR = 1'b0; 
			RES = 8'b0;
		end
	endcase
end
	
				

endmodule

`endif /* _SHIFTER_V_ */