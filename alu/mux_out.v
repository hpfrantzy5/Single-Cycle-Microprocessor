`ifndef _MUX_OUT_V_
`define _MUX_OUT_V_

module mux_out(
  input [7:0] adder,
  input [7:0] shifter,
  input [7:0] logical,
  input  [1:0] OSEL,
  output reg [7:0] Y
);


// MUX LOGIC:
//   if       OSEL == 00 => Y = adder;
//   else if  OSEL == 01 => Y = shifter;
//   else            => Y = logical;

always @ (*) begin 
	if (OSEL == 2'b00) Y = adder;
	else if (OSEL == 2'b01) Y = shifter;
	else Y = logical;
end

endmodule

`endif /* _MUX_CI_V_ */