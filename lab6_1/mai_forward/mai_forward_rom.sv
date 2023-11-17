module mai_forward_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:43007] /* synthesis ram_init_file = "./mai_forward/mai_forward.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
