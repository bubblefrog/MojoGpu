`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:28:57 05/15/2016
// Design Name:   MemoryController
// Module Name:   C:/MojoGpu/MemTest.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemTest;

	// Inputs
	reg [15:0] addrW;
	reg [7:0] dataW;
	reg clkaW;
	reg [12:0] addrRChar;
	reg [11:0] addrRFont;
	reg clkaR;

	// Outputs
	wire [7:0] dataChar;
	wire [7:0] dataFont;

	// Instantiate the Unit Under Test (UUT)
	MemoryController uut (
		.addrW(addrW), 
		.dataW(dataW), 
		.clkaW(clkaW), 
		.addrRChar(addrRChar), 
		.addrRFont(addrRFont), 
		.clkaR(clkaR), 
		.dataChar(dataChar), 
		.dataFont(dataFont)
	);

	initial begin
		// Initialize Inputs
		addrW = 0;
		dataW = 0;
		clkaW = 0;
		addrRChar = 0;
		addrRFont = 0;
		clkaR = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clkaR=1;
		#10
		clkaR=0;
        
		// Add stimulus here

	end
      
endmodule

