`ifndef _BRANCH_MUX_V
`define _BRANCH_MUX_V

`include "constants.v"

module branch_mux (

	input Z, N,
	input [2:0] BS,
	output reg MP
);

always @ (*) begin
	case (BS)
		`BS_ZERO: MP = Z;
		`BS_NOT_ZERO: MP = ~Z;
		`BS_NOT_NEG: MP = ~N;
		`BS_NEG: MP = N;
		default: MP = `ZERO;
	endcase
end

endmodule

`endif /* _BRANCH_MUX_V_ */