`ifndef _MEM_MUX_V_
`define _MEM_MUX_V_

module mem_mux (
	input [7:0] dram_output,
	input [7:0] Data_D,
	input MD,
	output reg [7:0] Data_C
);

always @ (*) begin
	if (~MD) Data_C = Data_D;
	else Data_C = dram_output;
end

endmodule
`endif /* _MEM_MUX_V_ */