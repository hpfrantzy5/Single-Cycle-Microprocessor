`ifndef _ADDER_V_
`define _ADDER_V_

module adder
(
	input [7:0] A,
	input [7:0] B,
	input Cin,
	output wire [7:0] Sum,
	output wire Cout,
	output reg Ovr
);

wire sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6, sum_7; 
wire cout_0, cout_1, cout_2, cout_3, cout_4, cout_5, cout_6, cout_7;
wire cin, cin_1, cin_2, cin_3, cin_4, cin_5, cin_6, cin_7;
wire [7:0] a, b;

assign a = A;
assign b = B;
assign cin = Cin;

one_bit_adder inst0 (
	.A    (a[0]),
	.B    (b[0]),
	.Cin  (cin),
	.Sum  (sum_0),
	.Cout (cout_0)
);

assign cin_1 = cout_0;

one_bit_adder inst1 
(
	.A    (a[1]),
	.B    (b[1]),
	.Cin  (cin_1),
	.Sum  (sum_1),
	.Cout (cout_1)
);

assign cin_2 = cout_1;

one_bit_adder inst2 
(
	.A    (a[2]),
	.B    (b[2]),
	.Cin  (cin_2),
	.Sum  (sum_2),
	.Cout (cout_2)
);

assign cin_3 = cout_2;

one_bit_adder inst3 
(
	.A    (a[3]),
	.B    (b[3]),
	.Cin  (cin_3),
	.Sum  (sum_3),
	.Cout (cout_3)
);

assign cin_4 = cout_3;

one_bit_adder inst4 
(
	.A    (a[4]),
	.B    (b[4]),
	.Cin  (cin_4),
	.Sum  (sum_4),
	.Cout (cout_4)
);

assign cin_5 = cout_4;

one_bit_adder inst5 
(
	.A    (a[5]),
	.B    (b[5]),
	.Cin  (cin_5),
	.Sum  (sum_5),
	.Cout (cout_5)
);

assign cin_6 = cout_5;

one_bit_adder inst6 
(
	.A    (a[6]),
	.B    (b[6]),
	.Cin  (cin_6),
	.Sum  (sum_6),
	.Cout (cout_6)
);

assign cin_7 = cout_6;

one_bit_adder inst7 
(
	.A    (a[7]),
	.B    (b[7]),
	.Cin  (cin_7),
	.Sum  (sum_7),
	.Cout (cout_7)
);

assign Sum = {sum_7,sum_6,sum_5,sum_4,sum_3,sum_2,sum_1,sum_0};
assign Cout = cout_7;

always @ (*) begin
	if (a[7] == b[7] && (Sum[7] !== a[7] && Sum[7] !== b[7])) begin
		Ovr = 1'b1;
	end
	else Ovr = 1'b0;
end

endmodule

`endif /* _ADDER_V_ */
