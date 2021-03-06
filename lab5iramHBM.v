`ifndef _LAB_5_IRAM_HBM_V_
`define _LAB_5_IRAM_HBM_V_

module lab5iramHBM
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
         mem[0]  <= 16'b1111000000000001; //SUB  R0, R0,    R0
         mem[1]  <= 16'b1111010010010001; //SUB  R2, R2,    R2
         mem[2]  <= 16'b1111111111111001; //SUB  R7, R7,    R7
         mem[3]  <= 16'b1111110110110001; //SUB  R6, R6,    R6
         mem[4]  <= 16'b0101000101111111; //ADDI R5, R0,    -1
         mem[5]  <= 16'b1111101000101011; //SRL  R5, R5
         mem[6]  <= 16'b0010000011111001; //LB   R3, -7(R0)
         mem[7]  <= 16'b0110011011000001; //ANDI R3, R3,     1
			
         mem[8]  <= 16'b0010000100111001; //LB   R4, -7(R0)
         mem[9]  <= 16'b0110100100000001; //ANDI R4, R4,     1
         mem[10] <= 16'b1111100011011000; //ADD  R3, R4,    R3
         mem[11] <= 16'b0110011011000001; //ANDI R3, R3,     1
         mem[12] <= 16'b1111010011010000; //ADD  R2, R2,    R3
         mem[13] <= 16'b1111100000011000; //ADD  R3, R4,    R0
         mem[14] <= 16'b0101111111111111; //ADDI R7, R7,    -1
         mem[15] <= 16'b1001000111110000; //BNE  R7, R0,   -16 
         mem[16] <= 16'b0101110110111111; //ADDI R6, R6,    -1
         mem[17] <= 16'b1001000110101100; //BNE  R6, R0,   -20 
         mem[18] <= 16'b0101101101111111; //ADDI R5, R5,    -1
         mem[19] <= 16'b1001000101101000; //BNE  R5, R0,   -24 
         mem[20] <= 16'b0101010100100010; //ADDI R4, R2,   -30
         mem[21] <= 16'b1011100000000010; //BLTZ R4, 2 
         mem[22] <= 16'b0101000010011101; //ADDI R2, R0,    29
	      mem[23] <= 16'b0100000010111101; //SB 	 R2, -3(R0)
         mem[24] <= 16'b1111010000010100; //SLL  R2, R2
			
			//mem[24] <= 16'b0101010010000010; // ADDI R2, R2, 2
         mem[25] <= 16'b0010010011000000; // LB   R3, 0(R2)
         mem[26] <= 16'b0100000011111110; // SB   R3, -2(R0)
         mem[27] <= 16'b0010010100000001; // LB   R4, 1(R2)
         mem[28] <= 16'b0100000100111111; // SB   R4, -1(R0)

         mem[29] <= 16'b1111011000011011; // SRL R3, R3
         mem[30] <= 16'b1111011000011011; // SRL R3, R3
         mem[31] <= 16'b1111011000011011; // SRL R3, R3
         mem[32] <= 16'b1111011000011011; // SRL R3, R3

         mem[33] <= 16'b0101000101100000; // ADDI R5, R0, -32
         mem[34] <= 16'b1111101000101100; // SLL R5, R5
         mem[35] <= 16'b1111101000101100; // SLL R5, R5
         mem[36] <= 16'b1111000101110000; // ADD R6, R0, R5
         mem[37] <= 16'b0101000111111111; // ADDI R7, R0, -1
			
         mem[38] <= 16'b0101011011111011; // ADDI R3, R3, -5
         mem[39] <= 16'b0100000101111010; // SB R5, -6(R0)
			mem[40] <= 16'b0100000000111011; // SB R0, -5(R0)

        mem[41] <= 16'b1000000100000010; // BEQ R4, R0, 2
        mem[42] <= 16'b1001000100000110; // BNE R4, R0, 6

        //CHECK0
        mem[43] <= 16'b1000000011011100; // BEQ R3, R0, 28
        mem[44] <= 16'b1010011000001100; // BGEZ R3, 12
        mem[45] <= 16'b1011011000011000; // BLTZ R3, 24

        //NOT_ZERO
        mem[46] <= 16'b1000000011000100; // BEQ R3, R0, 4
        mem[47] <= 16'b1011011000000010; // BLTZ R3, 2
        mem[48] <= 16'b1010011000000100; // BGEZ R3, 4
		  
        //DECR
        mem[49] <= 16'b0101011011001010; // ADDI R3, R3, 10
        mem[50] <= 16'b0101100100111111; // ADDI R4, R4, -1

        //START_TENS
        mem[51] <= 16'b0101011011111111; // ADDI R3, R3, -1
        mem[52] <= 16'b1000111101000110; // BEQ R5, R7, 6
        mem[53] <= 16'b1111101000101010; // SRA R5, R5
        mem[54] <= 16'b0100000101111010; // SB R5, -6(R0)
        mem[55] <= 16'b1000000000000100; // BEQ R0, R0, 4

        //IOD_TENS
        mem[56] <= 16'b0100000110111011; // SB R6, -5(R0)
        mem[57] <= 16'b1111110000110010; // SRA R6, R6

        //CHECK_TENS
        mem[58] <= 16'b0101011001111111; // ADDI R1, R3, -1
        mem[59] <= 16'b1010001000101110; // BGEZ R1, -18

        //END_CHECK
        mem[60] <= 16'b0101100100111111; // ADDI R4, R4, -1
        mem[61] <= 16'b1011100000010100; // BLTZ R4, 20
        mem[62] <= 16'b0101000011001010; // ADDI R3, R0, 10

        //START_HUND
        mem[63] <= 16'b0101011011111111; // ADDI R3, R3, -1
        mem[64] <= 16'b1000111101000110; // BEQ R5, R7, 6
        mem[65] <= 16'b1111101000101010; // SRA R5, R5
        mem[66] <= 16'b0100000101111010; // SB R5, -6(R0)
        mem[67] <= 16'b1000000000000100; // BEQ R0, R0, 4

        //IOD_HUND
        mem[68] <= 16'b0100000110111011; // SB R6, -5(R0)
        mem[69] <= 16'b1111110000110010; // SRA R6, R6

        //CHECK_HUND
        mem[70] <= 16'b0101011001111111; // ADDI R1, R3, -1
        mem[71] <= 16'b1010001000101110; // BGEZ R1, -18

        //END
        mem[72] <= 16'b1111000000000000; // ADD R0, R0, R0

         for(i = 73; i < 128; i = i + 1)
            mem[i] <= 16'b0000000000000000;
      end
  end

endmodule

`endif /* _LAB_5_IRAM_HBM_V_ */