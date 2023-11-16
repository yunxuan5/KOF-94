module bg2_rom (
	input logic clock,
	input logic [18:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:341279] /* synthesis ram_init_file = "./bg2/bg2.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
