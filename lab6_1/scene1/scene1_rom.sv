module scene1_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:83199] /* synthesis ram_init_file = "./scene1/scene1.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
