module scene_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:122879] /* synthesis ram_init_file = "./scene/scene.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
