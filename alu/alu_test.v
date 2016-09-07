`ifndef _ALU_TEST_V_
`define _ALU_TEST_V_

module alu_test;

reg [7:0] A, B;
reg [2:0] OP;

wire [7:0] Y;
wire ZRO, NEG, SO, CO, OVR;
wire [6:0] Y1_SEGMENTS, Y0_SEGMENTS;

alu UUT(
	.A		(A),
	.B		(B),
	.OP	(OP),
	.Y		(Y),
	.ZRO	(ZRO),
	.NEG	(NEG),
	.SO	(SO),
	.CO	(CO),
	.OVR	(OVR),
	.Y1_SEGMENTS (Y1_SEGMENTS),
	.Y0_SEGMENTS (Y0_SEGMENTS)
);

initial begin
	A = 8'b11010000;
	B = 8'b01110101;
	OP = 3'b000;
	#50
	OP = 3'b001;
	#50;
	OP = 3'b010;
	#50
	OP = 3'b011;
	#50
	OP = 3'b100;
	#50
	OP = 3'b101;
	#50
	OP = 3'b110;
	#50;
	#100
	A = 8'b00101001;
	B = 8'b01010101;
	OP = 3'b000;
	#50
	OP = 3'b001;
	#150
	A = 8'b11110101;
	B = 8'b10101011;
	OP = 3'b000;
	#50 
	OP = 3'b001;
	#200
	
	$stop;
end

endmodule

`endif /* _ALU_TEST_V_ */