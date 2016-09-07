`ifndef _PC_MUX_V_
`define _PC_MUX_V_

module pc_mux (
	input H,
	input MP,
	input [7:0] plus_2,
	input [7:0] branch_ins,
	input [7:0] curr_pc,
	output reg [7:0] NextPC
);

always @ (*) begin
	if (H) NextPC = curr_pc;
	else begin
		if (~MP) NextPC = plus_2;
		else NextPC = branch_ins;
	end
end

endmodule
`endif /* _PC_MUX_V_ */