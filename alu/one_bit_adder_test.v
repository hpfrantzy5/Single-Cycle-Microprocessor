`ifndef _ONE_BIT_ADDER_TEST_V_
`define _ONE_BIT_ADDER_TEST_V_

module one_bit_adder_test;

reg a, b, Cin;

wire Sum;
wire Cout;

one_bit_adder UUT
(
	.A		(a),
	.B		(b),
	.Cin  (Cin),
	.Sum	(Sum),
	.Cout (Cout)
);

initial begin
	a = 1'b0;
	b = 1'b1;
	Cin = 1'b0;
	#1000
	
	$stop;
end

endmodule

`endif /* _ONE_BIT_ADDER_TEST_V_ */