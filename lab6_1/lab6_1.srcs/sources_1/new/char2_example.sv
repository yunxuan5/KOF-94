module char2_example (
	input logic vga_clk,
	input logic blank,
	input logic [17:0] rom_address,
	output logic [3:0] red, green, blue
);

//logic [14:0] rom_address;
logic [7:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

assign palette_red = rom_q[7:5];
assign palette_green = rom_q[4:2];
assign palette_blue = rom_q[1:0];

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
//assign rom_address = ((DrawX * 165) / 640) + (((DrawY * 192) / 480) * 165);

always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if (blank) begin
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
	end
end

char2_rom char2_rom (
	.clka   (negedge_vga_clk),
	.addra (rom_address),
	.douta       (rom_q)
);

//char1_palette char1_palette (
//	.index (rom_q),
//	.red   (palette_red),
//	.green (palette_green),
//	.blue  (palette_blue)
//);

endmodule
