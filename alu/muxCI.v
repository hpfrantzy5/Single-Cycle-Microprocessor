`ifndef _MUX_CI_V_
`define _MUX_CI_V_

module muxCI(
  input  CISEL,
  output CIout
);

// MUX LOGIC:
//   if   CISEL == 0 => CIout = 0
//   else            => CIout = 1
assign CIout = ( CISEL == 1'b0 ) ? 1'b0 : 1'b1;

endmodule

`endif /* _MUX_CI_V_ */