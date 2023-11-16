module char1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'h0, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hC, 4'h7},
	{4'hE, 4'h9, 4'h4},
	{4'h9, 4'h0, 4'h0},
	{4'hA, 4'h4, 4'h1},
	{4'h6, 4'h0, 4'h0},
	{4'h6, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'h4, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hA},
	{4'hC, 4'h1, 4'h0},
	{4'hE, 4'hD, 4'hC},
	{4'hA, 4'hB, 4'h8},
	{4'hF, 4'h4, 4'h0},
	{4'hD, 4'h0, 4'h0}
};

assign {red, green, blue} = palette[index];

endmodule
