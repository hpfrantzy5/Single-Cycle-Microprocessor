`ifndef _ALU_V_
`define _ALU_V_

module alu
(
  input  [7:0] A,
  input  [7:0] B,
  input  [2:0] OP,
  output [7:0] Y,
  //output [6:0] Y1_SEGMENTS, //Seven segment display for upper 4 bits of Y
  //output [6:0] Y0_SEGMENTS, //Seven segment display for lower 4 bits of Y
  output reg ZRO,
  output reg NEG,
  output SO,
  output CO,
  output reg OVR
);

wire CISEL, LA, LR, LOP, Cin;
wire [1:0] BSEL, OSEL;
wire CO_shifter, CO_adder, OVR_adder, OVR_shifter;
wire [7:0] logical, shifter, adder, B_new;


//YOUR ALU CODE GOES BELOW HERE

control control0(
  .OP 	(OP),
  .CISEL	(CISEL),
  .BSEL	(BSEL),
  .LA		(LA),
  .LR		(LR),
  .LOP	(LOP),
  .OSEL  (OSEL)
);

muxBneg muxBneg0
(
	.B   (B),
	.BSEL (BSEL),
	.Out  (B_new)
);

muxCI muxCI0  
(
	.CISEL  (CISEL),
	.CIout  (Cin)
);

adder adder0
(
  .A		(A),
  .B		(B_new),
  .Cin	(Cin),
  .Sum	(adder),
  .Cout	(CO_adder),
  .Ovr	(OVR_adder)
);

shifter shifter0
(
  .A		(A),
  .LA		(LA),
  .LR		(LR),
  .Y		(shifter),
  .SO		(SO),
  .OVR	(OVR_shifter),
  .CO		(CO_shifter)
  
);

logical logical0
(
  .A	(A),
  .B	(B),
  .OP	(LOP),
  .Y	(logical)
);

muxCO muxCO0
(
	.OSEL  (OSEL),
	.CO_adder (CO_adder),
	.CO_shifter (CO_shifter),
	.CO (CO)
);

mux_out mux_out0 
(
	.adder (adder),
	.shifter (shifter),
	.logical (logical),
	.OSEL    (OSEL),
	.Y 		(Y)
);

always @ (*) begin
	if (OSEL == 2'b00) OVR = OVR_adder; else OVR = 1'b0;
	NEG = Y[7] ? 1'b1 : 1'b0;
	ZRO = (Y == 8'd0) ? 1'b1 : 1'b0;
end

//YOUR ALU CODE GOES ABOVE HERE
//USE THE SPACE BELOW FOR SEVEN SEGMENT DRIVERS FOR THE OUTPUTS

//// Output displays

//bcd_7seg Y4_0
//(
//  .DATA     (Y[3:0]),
//  .SEGMENTS (Y0_SEGMENTS)
//);
//
//bcd_7seg Y4_1
//(
//  .DATA     (Y[7:4]),
//  .SEGMENTS (Y1_SEGMENTS)
//);

endmodule

`endif /* _ALU_V_ */