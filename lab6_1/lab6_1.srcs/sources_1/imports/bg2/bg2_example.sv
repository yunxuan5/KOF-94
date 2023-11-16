module bg2_example (
	input logic vga_clk,
//	input logic [9:0] DrawX, DrawY,
	input logic blank,
	input logic [18:0] rom_address,
	output logic [3:0] red, green, blue
);

//logic [18:0] rom_address;
logic [3:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
//assign rom_address = ((DrawX * 711) / 640) + (((DrawY * 480) / 480) * 711);

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

bg2 bg2_rom (
	.clka   (negedge_vga_clk),
	.addra (rom_address),
	.douta       (rom_q)
);

bg2_palette bg2_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
);

endmodule
