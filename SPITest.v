`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:44 05/16/2016 
// Design Name: 
// Module Name:    SPITest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SPITest(
    input DATALINE,
    input CLOCK,
    input SS,
    output [7:0] DATA
    );
	 
	 reg [7:0]out=0;
	 reg [7:0] data=0;
	 
	 assign DATA=out;
	 
	 always@ (posedge CLOCK)begin
		data <= data << 1;
		data[0]<=DATALINE;
		out <= data;
	 end
	 
	/* always@ (posedge SS)begin
		out <= data;
		
	 end
*/

endmodule
