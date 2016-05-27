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

	 input DATALINE,
    input CLOCK,
    input SS,
	
	 input clk,
	 
	 input [12:0] addrRChar,
	 input [11:0] addrRFont,
	 input clkaR,
	 
	 output [7:0] dataChar,
	 output [7:0] dataFont,
	 output [7:0] led
	 
    );
	 
	 
	 reg [31:0] dataIn=0;
	 wire [15:0] addrW;
	 assign addrW = dataIn [15:0];
	 wire [7:0] dataW;
	 assign dataW = dataIn [24:16];
	 
	 always@(posedge CLOCK) begin
		//if (~SS) begin //SCK is rising and SS is low
			dataIn <= {dataIn [30:0], DATALINE}; // Shift in  data
		//end
	 end
	
	 assign led = dataW;
	 
	 wire weaChar;
	 wire weaFont;
	 
	 assign weaChar = ~addrW[13];
	 assign weaFont = addrW[13];
	 

CharBuffer char (
  .clka(SS), // input clka
  .wea(weaChar), // input [0 : 0] wea
  .addra(addrW[12:0]), // input [12 : 0] addra
  .dina(dataW), // input [7 : 0] dina
  .clkb(clkaR), // input clkb
  .addrb(addrRChar), // input [12 : 0] addrb
  .doutb(dataChar) // output [7 : 0] doutb
);

FontMemory font (
  .clka(SS), // input clka
  .wea(weaFont), // input [0 : 0] wea
  .addra(addrW[11:0]), // input [11 : 0] addra
  .dina(dataW), // input [7 : 0] dina
  .clkb(clkaR), // input clkb
  .addrb(addrRFont), // input [11 : 0] addrb
  .doutb(dataFont) // output [7 : 0] doutb
);

endmodule
