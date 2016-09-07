`ifndef _MUX_B_NEG_V_
`define _MUX_B_NEG_V_

module muxBneg(
  input [7:0] B,
  input [1:0] BSEL,
  output [7:0] Out
);
wire [7:0] B_neg;

assign B_neg = ~B;

// MUX LOGIC:
//   if   BSEL == 0 => Out = B;
//   else            => Out = B_neg;
assign Out = ( BSEL == 2'b00 ) ? B : B_neg;

endmodule

`endif /* _MUX_B_NEG_V_ */