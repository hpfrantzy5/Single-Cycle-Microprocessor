module shifter_test;
	
	reg [7:0] A;
	reg LA, LR;
	
	wire [7:0] Y;
	wire SO, OVR, CO;
	
	shifter UUT(
		.A		(A),
		.LA	(LA),
		.LR	(LR),
		.Y		(Y),
		.SO	(SO),
		.OVR	(OVR),
		.CO	(CO)
	);
	
	initial begin
		A = 8'b11101010;
		LA = 1'b0;
		LR = 1'b0;
	end

	endmodule