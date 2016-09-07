`ifndef _LAB_5_CLK_V_
`define _LAB_5_CLK_V_

module lab5_clk
(
  input      CLK_50, 
  input      CLK_SEL, 
  output reg VAR_CLK
);

  /* Variable speed clock for Processor Lab.  By Douglas Long 11/09/07
   * 
   * CLK_50 -- 50MHz input clock
   * VAR_CLK   -- Variable output clock (50MHz or 1Hz)
   * CLK_SEL   -- output clock selection (HIGH for 50MHz, LOW for 1Hz)
   */

  wire rco_10MHz, rco_1MHz, rco_100kHz, rco_10kHz, rco_1kHz, rco_100Hz, rco_10Hz, rco_1Hz;
  wire clock_10MHz, clock_1MHz, clock_100kHz, clock_10kHz, clock_1kHz, clock_100Hz, clock_10Hz, clock_1Hz;

  pclock #(5) counter_10MHz(CLK_50,1'b1,clock_10MHz,rco_10MHz);   // 50MHz to 10MHz
  pclock counter_1MHz(CLK_50,rco_10MHz,clock_1MHz,rco_1MHz);      // 10MHz to 1MHz
  pclock counter_100kHz(CLK_50,rco_1MHz,clock_100kHz,rco_100kHz); // 1MHz to 100kHz
  pclock counter_10kHz(CLK_50,rco_100kHz,clock_10kHz,rco_10kHz);  // 100kHz to 10kHz
  pclock counter_1kHz(CLK_50,rco_10kHz,clock_1kHz,rco_1kHz);      // 10kHz to 1kHz
  pclock counter_100Hz(CLK_50,rco_1kHz,clock_100Hz,rco_100Hz);    // 1kHz to 100Hz
  pclock counter_10Hz(CLK_50,rco_100Hz,clock_10Hz,rco_10Hz);      // 100Hz to 10Hz
  pclock counter_1Hz(CLK_50,rco_10Hz,clock_1Hz,rco_1Hz);          // 10Hz to 1Hz
  
  always @ (posedge CLK_50) begin
    case(CLK_SEL)
       1'b0 : VAR_CLK   <= clock_1Hz;
       1'b1 : VAR_CLK   <= clock_10MHz;
       default: VAR_CLK <= clock_10MHz;
    endcase
  end
  
endmodule

module pclock
#(
  parameter NCYCLES=10
)(
  input  CLK,
  input  EN,
  output reg CLK_OUT,
  output reg RCO_OUT
);

  /* Parameterized clock divider module.  By Douglas Long 11/11/07
   *
   *   CLK -- input clock
   *   EN  -- clock Enable (active HIGH)
   *   CLK_OUT -- output clock (divided by NCYCLES)
   *   RCO_OUT -- ripple carry output (enable higer order clock)
   */

  reg [3:0] count;
  
  always @ ( posedge CLK ) begin
  if( EN )
     if( count < NCYCLES - 1 )
       count = count + 4'b0001;
     else
       count = 0;
  end
  
  always @ (count,EN) begin
    if ( count <= ( NCYCLES - 1 ) / 2 )
       CLK_OUT = 0;
    else
       CLK_OUT = 1;
    if ( ( count == NCYCLES - 1 ) & EN )
       RCO_OUT = 1;
    else
       RCO_OUT = 0;
  end
  
endmodule

`endif /* _LAB_5_CLK_V_ */
