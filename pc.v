`ifndef _PC_V_
`define _PC_V_

module pc (
	input CLK,
	input RESET,
	input EN_L,
	input [7:0] NextPC,
	output reg [7:0] PC,
	output reg EN_L_curr
);
	
always @ (posedge CLK) begin
	EN_L_curr <= EN_L;
	if (RESET) PC <= 8'b00000000;
	else PC <= NextPC;
end 

endmodule
`endif /* _PC_V_ */