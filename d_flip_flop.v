`ifndef _D_FLIP_FLOP_V_
`define _D_FLIP_FLOP_V_

module d_flip_flop (
	input CLK,
	input RESET,
	input D,
	input LD,
	output reg Q
);

always @ (posedge CLK) begin
	if (RESET) Q <= 0;
	else if (LD) Q <= D;
	else Q <= Q;
end
endmodule

`endif /* _D_FLIP_FLOP_V_ */