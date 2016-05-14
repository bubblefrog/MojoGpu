`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:50:45 05/14/2016
// Design Name:   ConsoleDriver
// Module Name:   C:/MojoGpu/Test.v
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

module Test;

	// Inputs
	reg [7:0] data;
	reg [10:0] x;
	reg [10:0] y;
	reg vgaClock;

	// Outputs
	wire [15:0] memAddr;
	wire readClock;
	wire [8:0] pixelData;
	wire [3:0] sate;

	// Instantiate the Unit Under Test (UUT)
	ConsoleDriver uut (
		.data(data), 
		.x(x), 
		.y(y), 
		.vgaClock(vgaClock), 
		.memAddr(memAddr), 
		.readClock(readClock), 
		.pixelData(pixelData),
		.sate(sate)
	);

	initial begin
		// Initialize Inputs
		data = 2;
		x = 9;
		y = 13;
		vgaClock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
				#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
		#10;
		vgaClock=1;
		#10;
		vgaClock=0;
		
		

	end
      
endmodule

