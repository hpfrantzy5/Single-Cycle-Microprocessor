`ifndef _REGISTER_V_
`define _REGISTER_V_

`include "constants.v"

module register (
	input CLK,
	input RESET,
	input [7:0] D,
	input LD,
	output reg [7:0] Q
);

always @ (posedge CLK) begin
	if (RESET) Q <= `EIGHT_BIT_ZERO;
	else if (LD) Q <= D;
end

endmodule


`endif /* _REGISTER_V_ */