`ifndef _ADDER_TEST_V_
`define _ADDER_TEST_V_

module adder_test;

reg [7:0] A, B;
reg Cin;

wire [7:0] Sum, a, b;
wire Cout, Ovr;

adder UUT(
	.A		(A),
	.B		(B),
	.a    (a),
	.b    (b),
	.Cin  (Cin),
	.Sum	(Sum),
	.Cout (Cout),
	.Ovr	(Ovr)
);

initial begin
	A = 8'd234;
	B = 8'd117;
	Cin = 0;
	#500
	$stop;
end

endmodule

`endif /* _ALU_TEST_V_ */