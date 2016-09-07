`ifndef _LOGICAL_V_
`define _LOGICAL_V_

module logical
(
	input [7:0] A,
	input [7:0] B, 
	input OP,
	output reg [7:0] Y
);
reg [7:0] y;

always @ (*) begin
	if (OP) begin 
		y[0] = A[0] & B[0];
		y[1] = A[1] & B[1];
		y[2] = A[2] & B[2];
		y[3] = A[3] & B[3];
		y[4] = A[4] & B[4];
		y[5] = A[5] & B[5];
		y[6] = A[6] & B[6];
		y[7] = A[7] & B[7];
	end 
	else begin
		y[0] = A[0] | B[0];
		y[1] = A[1] | B[1];
		y[2] = A[2] | B[2];
		y[3] = A[3] | B[3];
		y[4] = A[4] | B[4];
		y[5] = A[5] | B[5];
		y[6] = A[6] | B[6];
		y[7] = A[7] | B[7];
	end 
	Y = y;	
end


endmodule

`endif /* _LOGICAL_V_ */