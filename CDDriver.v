`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:43 05/15/2016
// Design Name:   ConsoleDriver
// Module Name:   C:/MojoGpu/CDDriver.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConsoleDriver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CDDriver;

	// Inputs
	reg [9:0] x;
	reg [9:0] y;
	reg vgaClock;
	reg [7:0] dataChar;
	reg [7:0] dataFont;

	// Outputs
	wire readClock;
	wire [8:0] pixelData;
	wire [12:0] addrRChar;
	wire [11:0] addrRFont;

	// Instantiate the Unit Under Test (UUT)
	ConsoleDriver uut (
		.x(x), 
		.y(y), 
		.vgaClock(vgaClock), 
		.readClock(readClock), 
		.pixelData(pixelData), 
		.addrRChar(addrRChar), 
		.addrRFont(addrRFont), 
		.dataChar(dataChar), 
		.dataFont(dataFont)
	);

	initial begin
		// Initialize Inputs
		x = 1;
		y = 0;
		vgaClock = 0;
		dataChar = 0;
		dataFont = 0;

		// Wait 100 ns for global reset to finish
		#100;
      vgaClock = 1;
		dataChar = 2;
		#10;
		vgaClock = 0;
		#10;
		vgaClock = 1;
		dataChar = 3;
		dataFont = 255;
		#10;
		vgaClock = 0;
		#10;
		vgaClock = 1;
		dataChar = 3;
		dataFont = 255;
		#10;
		// Add stimulus here

	end
      
endmodule

