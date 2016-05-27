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
    input [9:0] x,
    input [9:0] y,
    input vgaClock,
    output readClock,
	 output [8:0] pixelData,
	 
	 
	 output [12:0] addrRChar,
	 output [11:0] addrRFont,
	 
	 input [7:0] dataChar,
	 input [7:0] dataFont
	 
    );
	 
	 reg [11:0] fontAddr=0;//S1
	  
	 reg [8:0]_pixelData=0;
	 
	 assign addrRChar = x/8 + 100*(y/10);
	 assign addrRFont = fontAddr;
	 //assign memAddr[13] = (state == 1);
	 //assign memAddr[12:0] = state == 0 ? x/8 + 80*(y/10): data + y - (y/10)*10   ;
	 //assign memAddr[10:0] =  x/8 + 80*(y/10);
	 assign readClock = vgaClock;
	 
	 assign pixelData = _pixelData;
	 
	 always@(posedge vgaClock) begin
	 
	 fontAddr <=  dataChar*10 + y - (y/10)*10;
	 
	 		if (dataFont[((x-3)/8)*8 - (x-3)]) begin
				_pixelData <= 9'b111111111;
			end
			else begin
				_pixelData <= 9'b000000000;
			end
	 
	 
	end

endmodule
