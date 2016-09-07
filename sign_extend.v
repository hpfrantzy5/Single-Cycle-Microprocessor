`ifndef _SIGN_EXTEND_V_
`define _SIGN_EXTEND_V_

`include "constants.v"

module sign_extend (
	input EXT_SEL,
	input [5:0] IMM,
	output reg [7:0] IMM_new
);

always @ (*) begin
	if (EXT_SEL) begin 
		if (IMM[5]==`ONE) IMM_new = {`NEG_PADDING,IMM};
		else IMM_new = {`POS_PADDING,IMM};
	end 
	else IMM_new = {`POS_PADDING, IMM};
end

endmodule
`endif /* _SIGN_EXTEND_V_ */