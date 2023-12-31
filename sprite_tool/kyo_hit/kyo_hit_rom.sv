module kyo_hit_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:10239] /* synthesis ram_init_file = "./kyo_hit/kyo_hit.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
