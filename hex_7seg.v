`ifndef _HEX_7SEG_V_
`define _HEX_7SEG_V_

module hex_7seg
(
  input      [3:0] DATA,
  output reg [6:0] SEGMENTS
);

// SEGMENTS format { SEGG, SEGF, SEGE, SEGD, SEGC, SEGB, SEGA }

always @( * ) begin
  case ( DATA )
    4'h0:    SEGMENTS = 7'b1000000;
    4'h1:    SEGMENTS = 7'b1111001;
    4'h2:    SEGMENTS = 7'b0100100;
    4'h3:    SEGMENTS = 7'b0110000;
    4'h4:    SEGMENTS = 7'b0011001;
    4'h5:    SEGMENTS = 7'b0010010;
    4'h6:    SEGMENTS = 7'b0000010;
    4'h7:    SEGMENTS = 7'b1111000;
    4'h8:    SEGMENTS = 7'b0000000;
    4'h9:    SEGMENTS = 7'b0011000;
    4'ha:    SEGMENTS = 7'b0001000;
    4'hb:    SEGMENTS = 7'b0000011;
    4'hc:    SEGMENTS = 7'b1000110;
    4'hd:    SEGMENTS = 7'b0100001;
    4'he:    SEGMENTS = 7'b0000110;
    4'hf:    SEGMENTS = 7'b0001110;
    default: SEGMENTS = 7'b1111111;
  endcase
end

endmodule

`endif /* _HEX_7SEG_V_ */















