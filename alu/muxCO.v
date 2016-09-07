`ifndef _MUX_CO_V_
`define _MUX_CO_V_

module muxCO(
  input [1:0] OSEL,
  input CO_adder,
  input CO_shifter,
  output reg CO
);

// MUX LOGIC:
//   if   CISEL == 0 => CIout = 0
//   else            => CIout = 1
always @ (*) begin
	if (OSEL == 2'b00) CO = CO_adder;
	else if (OSEL == 2'b01) CO = CO_shifter;
	else CO = 0;
end

endmodule

`endif /* _MUX_CO_V_ */