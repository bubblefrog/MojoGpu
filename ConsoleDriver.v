`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:10 05/14/2016 
// Design Name: 
// Module Name:    ConsoleDriver 
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
module ConsoleDriver(
    input [7:0] data,
    input [10:0] x,
    input [10:0] y,
    input vgaClock,
    output [15:0] memAddr,
    output readClock,
	 output [8:0] pixelData
    );
	 
	 reg [7:0]mem=0;
	 reg [3:0] state=2;	 
	 reg [8:0]_pixelData=0;
	 
	 assign memAddr[13] = (state == 1);
	 assign memAddr[12:0] = state == 0 ? x/8 + 80*(y/10): data + y - (y/10)*10   ;
	 //assign memAddr[10:0] =  x/8 + 80*(y/10);
	 assign readClock = (state == 0 || state == 1) && vgaClock;
	 
	 assign pixelData = _pixelData;
	 
	 always@(posedge vgaClock) begin
	 		if (state == 2) begin
			if (data[x/8]) begin
				_pixelData <= 9'b1;
			end
			else begin
				_pixelData <= 9'b0;
			end
		end
	 end
	 
	 always@ (negedge vgaClock)begin
	 if (state == 2) begin
			state <= 0;
		end
		else begin
		state <= state +1;
		end
	 end
	 
	 
	 
	 


endmodule
