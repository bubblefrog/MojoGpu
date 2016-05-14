`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:21 05/14/2016 
// Design Name: 
// Module Name:    MemoryController 
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
module MemoryController(
    input [15:0] addrW,
    input [7:0] dataW,
    input clkaW,
	 
	 input [15:0] addrR,
	 input clkaR,
	 output [7:0] dataR
	 
    );
	 
	 
	 
	 wire[2:0] cmdW;
	 assign cmdW = addrW[15:13];
	 
	 wire[2:0] cmdR;
	 assign cmdR = addrR[15:13];
	 
	 wire weaChar;
	 wire weaFont;
	 
	 assign weaChar = ~cmdW[0];
	 assign weaFont = cmdW[0];
	 
	 wire charClock;
	 wire fontClock;
	 assign charClock = ~cmdR[0] & clkaR;
	 assign fontClock = cmdR[0] & clkaR;
	 
	 wire [7:0]dataChar;
	 wire [7:0]dataFont;
	 
	 assign dataR = cmdW[0] ? dataFont : dataChar;


CharBuffer char (
  .clka(clkaW), // input clka
  .wea(weaChar), // input [0 : 0] wea
  .addra(addrW[12:0]), // input [12 : 0] addra
  .dina(dataW), // input [7 : 0] dina
  .clkb(charClock), // input clkb
  .addrb(addrR[12 : 0]), // input [12 : 0] addrb
  .doutb(dataChar) // output [7 : 0] doutb
);

FontMemory font (
  .clka(clkaW), // input clka
  .wea(weaFont), // input [0 : 0] wea
  .addra(addrW[11:0]), // input [11 : 0] addra
  .dina(dataW), // input [7 : 0] dina
  .clkb(fontClock), // input clkb
  .addrb(addrR[11 : 0]), // input [11 : 0] addrb
  .doutb(dataFont) // output [7 : 0] doutb
);

endmodule