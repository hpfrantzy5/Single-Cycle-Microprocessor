module control_test;
	
	reg [2:0] OP;
	
	wire [1:0] BSEL, OSEL;
	wire LA, LR, LOP, CISEL;
	
	control UUT(
		.OP		(OP),
		.BSEL		(BSEL),
		.OSEL		(OSEL),
		.LA		(LA),
		.LR		(LR),
		.LOP		(LOP),
		.CISEL	(CISEL)
	);
	
	initial begin
		OP = 000;
		#50
		OP = 001;
		#50
		OP = 010;
		#50
		OP = 011;
		#50
		OP = 100;
		#50
		OP = 101;
		#50
		OP = 110;
		#50;
	end

	endmodule