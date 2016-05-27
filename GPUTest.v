`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:58:45 05/15/2016
// Design Name:   mojo_top
// Module Name:   C:/MojoGpu/GPUTest.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mojo_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GPUTest;

	// Inputs
	reg clk;
	reg [15:0] addrW;
	reg [7:0] dataW;
	reg clkW;
	reg vgClock;
	reg rst_n;
	reg cclk;
	reg spi_ss;
	reg spi_mosi;
	reg spi_sck;
	reg avr_tx;
	reg avr_rx_busy;

	// Outputs
	wire hSync;
	wire vSync;
	wire r;
	wire g;
	wire b;
	wire [8:0] pd;
	wire [7:0] led;
	wire spi_miso;
	wire [3:0] spi_channel;
	wire avr_rx;

	// Instantiate the Unit Under Test (UUT)
	mojo_top uut (
		.clk(clk), 
		.addrW(addrW), 
		.dataW(dataW), 
		.clkW(clkW), 
		.hSync(hSync), 
		.vSync(vSync), 
		.r(r), 
		.g(g), 
		.b(b), 
		.vgClock(vgClock), 
		.pd(pd), 
		.rst_n(rst_n), 
		.cclk(cclk), 
		.led(led), 
		.spi_miso(spi_miso), 
		.spi_ss(spi_ss), 
		.spi_mosi(spi_mosi), 
		.spi_sck(spi_sck), 
		.spi_channel(spi_channel), 
		.avr_tx(avr_tx), 
		.avr_rx(avr_rx), 
		.avr_rx_busy(avr_rx_busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addrW = 0;
		dataW = 0;
		clkW = 0;
		vgClock = 0;
		rst_n = 0;
		cclk = 0;
		spi_ss = 0;
		spi_mosi = 0;
		spi_sck = 0;
		avr_tx = 0;
		avr_rx_busy = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
		
				clk=1;
		#10;
		clk=0;
		#10;
		
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
		
				clk=1;
		#10;
		clk=0;
		#10;
        
		// Add stimulus here

	end
      
endmodule

