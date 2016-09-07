`ifndef _LAB_5_DRAM_V_
`define _LAB_5_DRAM_V_

module lab5dram
(
  input            CLK,
  input      [7:0] ADDR,  // 8-bit addresses
  input      [7:0] DATA,  // 8-bit data words
  input            MW,
  input      [7:0] IOA,
  input      [7:0] IOB,
  output     [7:0] IOC,
  output     [7:0] IOD,
  output     [7:0] IOE,
  output     [7:0] IOF,
  output     [7:0] IOG,
  output     [7:0] IOH,
  output reg [7:0] Q
);

// ENGRD 230 Lab 7 RAM file for program iromsimple.  Fall 2007 

  reg [7:0] IOreg   [2:7]; 
  reg [7:0] mem     [0:247];
  reg [7:0] Q_IO;
  reg [7:0] Q_mem;
  reg [7:0] ADDR_IO;
  reg       MW_IO;
  reg       MW_mem;
  
  always @ (*) begin
    Q_mem <= mem[ADDR];
  end

  always @( posedge CLK ) begin
    if( MW_IO == 1'b1 )  IOreg[ADDR_IO] <= DATA;
    if( MW_mem == 1'b1 ) mem[ADDR]      <= DATA;
  end

  assign IOC = IOreg[2];
  assign IOD = IOreg[3];
  assign IOE = IOreg[4];
  assign IOF = IOreg[5];
  assign IOG = IOreg[6];
  assign IOH = IOreg[7];
  
  always @ (*) begin
    
    MW_mem  = 0;
    MW_IO   = 0;
    ADDR_IO = 0;
    Q       = 8'd0;

    case( ADDR )
      8'd248 : begin ADDR_IO = 0; Q = IOA; end
      8'd249 : begin ADDR_IO = 1; Q = IOB; end
      8'd250 : begin ADDR_IO = 2; MW_IO = MW; end
      8'd251 : begin ADDR_IO = 3; MW_IO = MW; end
      8'd252 : begin ADDR_IO = 4; MW_IO = MW; end
      8'd253 : begin ADDR_IO = 5; MW_IO = MW; end
      8'd254 : begin ADDR_IO = 6; MW_IO = MW; end
      8'd255 : begin ADDR_IO = 7; MW_IO = MW; end
      default : begin // regular memory
                  if( MW ) MW_mem = 1;
                  else Q = Q_mem;
                end
    endcase
  end

endmodule

`endif /* _LAB_5_DRAM_V_ */