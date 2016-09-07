`ifndef _ONE_BIT_ADDER_V_
`define _ONE_BIT_ADDER_V_

module one_bit_adder
(
	input A,
	input B, 
	input Cin,
	output reg Sum,
	output reg Cout
);

always @ (*) begin
	Sum = (~A & ~B & Cin) | (~A & B & ~Cin) | (A & ~B & ~Cin) | (A & B & Cin);
	Cout = (B & Cin) | (A & Cin) | (A & B);
end

endmodule

`endif /* _ADDER_V_ */