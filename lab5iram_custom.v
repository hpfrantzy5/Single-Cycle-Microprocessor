`ifndef _LAB_5_IRAM_CUSTOM_V_
`define _LAB_5_IRAM_CUSTOM_V_

`include "constants.v"

module lab5iram_custom
(
  input         CLK,
  input         RESET,
  input  [ 7:0] ADDR,
  output [15:0] Q
);

  reg  [15:0] mem [0:127]; // Instruction memory with 16 bit entries.
  wire [ 6:0] SADDR;
  integer     i;

  assign SADDR = ADDR[7:1];
  assign Q     = mem[SADDR];

  always @ ( posedge CLK )
  begin
if ( RESET ) begin
		mem[0] <= {`RTYPE, `REG0, `REG0, `REG0, `F_SUB};	// R0 <= R0 - R0
		mem[1] <= {`RTYPE, `REG1, `REG1, `REG1, `F_SUB};	// R1 <= R1 - R1 
		mem[2] <= {`RTYPE, `REG2, `REG2, `REG2, `F_SUB};	// R2 <= R2 - R2
		mem[3] <= {`RTYPE, `REG3, `REG3, `REG3, `F_SUB};	// R3 <= R3 - R3
		mem[4] <= {`LB, `REG0, `REG1, 6'b111001}; 			// R1 <= MEM[R0-7]
		mem[5] <= {`ANDI, `REG1, `REG2, 6'b000001}; 			// R2 <= R1 & 1
		mem[6] <= {`ANDI, `REG1, `REG3, 6'b000010}; 			// R3 <= R1 & 2
		mem[7] <= {`BEQ, `REG2, `REG3, 6'b000010}; 			//	BEQ R3, R2, 2 
		mem[8] <= {`BNE, `REG2, `REG3, 6'b000010}; 			// BNE R3, R2, 2
		mem[9] <= {`SB, `REG0, `REG2, 6'b111010}; 			// MEM[R0-6] <= R2
		mem[10] <= {`SB, `REG0, `REG2, 6'b111011}; 			// MEM[R0-5] <= R2
		mem[11] <= {`NOP, `REG0, `REG0, `REG0, `HALT}; 		// HALT
		mem[12] <= {`LB, `REG0, `REG2, 6'b111000}; 			// R2 <= MEM[R0-8]
		mem[13] <= {`ADDI, `REG2, `REG2, 6'b110110};			// R2 <= R2 - 10
		mem[14] <= {`BGEZ, `REG2, `REG2, 6'b000010};			// BGEZ R2, 2
		mem[15] <= {`BLTZ, `REG2, `REG2, 6'b000010};			// BLTZ R2, 2
		mem[16] <= {`SB, `REG0, `REG2, 6'b111100};			// MEM[R0-4] <= R2
		mem[17] <= {`SB, `REG0, `REG2, 6'b111101};			// MEM[R0-3] <= R2
      
		for(i = 18; i < 128; i = i + 1)
      	mem[i] <= 16'b0000000000000000;
     end
  end

endmodule

`endif /* _LAB_5_IRAM_CUSTOM_V_ */

