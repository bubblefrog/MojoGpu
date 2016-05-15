`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:20 05/15/2016
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
	reg [15:0] addrR;
	reg clkaR;

	// Outputs
	wire [7:0] dataR;

	// Instantiate the Unit Under Test (UUT)
	MemoryController uut (
		.addrW(addrW), 
		.dataW(dataW), 
		.clkaW(clkaW), 
		.addrR(addrR), 
		.clkaR(clkaR), 
		.dataR(dataR)
	);

	initial begin
		// Initialize Inputs
		addrW = 0;
		dataW = 0;
		clkaW = 0;
		addrR = 16'b0010000000000000;
		clkaR = 0;

		// Wait 100 ns for global reset to finish
		#100;
        clkaR=1;
		  #10;
		  clkaR=0;
		// Add stimulus here

	end
      
endmodule

