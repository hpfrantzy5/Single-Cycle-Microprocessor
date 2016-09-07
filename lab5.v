`ifndef _LAB_5_V_
`define _LAB_5_V_

module lab5
(
  input          CLK_50,
  input          CLK_SEL,
  input          RESET,
  input   [ 7:0] IOA,
  input   [ 7:0] IOB,
  input          EN_L,
  output         VAR_CLK,
  output  [ 7:0] DataA,
  output  [ 7:0] DataB,
  output  [ 7:0] DataC,
  output  [ 7:0] DataD,
  output  [ 7:0] Din,
  output  [6:0] HEX0,
  output  [6:0] HEX1,
  output  [6:0] HEX2,
  output  [6:0] HEX3,
  output  [6:0] HEX4,
  output  [6:0] HEX5,
  output  [6:0] HEX6,
  output  [6:0] HEX7,
  output  [15:0] Iin,
  output  [ 7:0] IOE,
  output  [ 7:0] IOF,
  output  [ 7:0] IOG,
  output  [ 7:0] IOH,
  output  [ 7:0] LEDG,
  output  [ 7:0] LEDR,
  output  [ 7:0] NextPC,
  output  [ 7:0] PC
);

//YOUR CODE GOES BELOW HERE

wire writeEnable;

lab5_clk b2v_inst
(
  .CLK_50  ( CLK_50 ),
  .CLK_SEL ( CLK_SEL ),
  .VAR_CLK ( VAR_CLK )
);

cpu cpu0
(
  .CLK    ( VAR_CLK ),
  .RESET  ( RESET ),
  .Iin    ( Iin ),
  .Din    ( Din ),
  .PC     ( PC ),
  .NextPC ( NextPC ),
  .EN_L   (EN_L),
  .DataA  ( DataA ),
  .DataB  ( DataB ),
  .DataC  ( DataC ),
  .DataD  ( DataD ),
  .MW     ( writeEnable )
);
  
lab5iramHBM IRAM
(
  .CLK   ( VAR_CLK ),
  .RESET ( RESET ),
  .ADDR  ( PC ),
  .Q     ( Iin )
);

lab5dramHBM DRAM
(
  .CLK   ( VAR_CLK ),
  .ADDR  ( DataD ),
  .DATA  ( DataB ),
  .MW    ( writeEnable ),
  .IOA   ( IOA ),
  .IOB   ( IOB ),
  .IOC   ( LEDR ),
  .IOD   ( LEDG ),
  .IOE   ( IOE ),
  .IOF   ( IOF ),
  .IOG   ( IOG ),
  .IOH   ( IOH ),
  .RESET (RESET),
  .Q     ( Din )
);

//YOUR CODE GOES ABOVE HERE
//USE THE SPACE BELOW FOR SEVEN SEGMENT DRIVERS FOR THE OUTPUTS

hex_7seg lowerIOH
(
  .DATA     ( IOH[3:0] ),
  .SEGMENTS ( HEX6 )
);


hex_7seg upperIOH
(
  .DATA     ( IOH[7:4] ),
  .SEGMENTS ( HEX7 )
);


hex_7seg lowerIOG
(
  .DATA     ( IOG[3:0] ),
  .SEGMENTS ( HEX4 )
);

hex_7seg upperIOG
(
  .DATA     ( IOG[7:4] ),
  .SEGMENTS ( HEX5 )
);

hex_7seg lowerIOF
(
  .DATA     ( IOF[3:0] ),
  .SEGMENTS ( HEX2 )
);

hex_7seg upperIOF
(
  .DATA     ( IOF[7:4] ),
  .SEGMENTS ( HEX3 )
);

hex_7seg lowerIOE
(
  .DATA     ( IOE[3:0] ),
  .SEGMENTS ( HEX0 )
);

hex_7seg upperIOE
(
  .DATA     ( IOE[7:4] ),
  .SEGMENTS ( HEX1 )
);

endmodule

`endif /* _LAB_5_V_ */