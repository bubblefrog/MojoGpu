module mojo_top(
    // 50MHz clock input
    input clk,
	 input SPICLOCK,
	 input DATALINE,
	 input SS,

	 
	 input [15:0]addrW,
	 input [7:0]dataW,
	 input clkW,
	 
	 output hSync,
	 output vSync,
	 
	 output r,
	 output g,
	 output b,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy // AVR Rx buffer full
    );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;
wire[9:0]x;
wire[9:0]y;

wire [7:0]data;
wire [15:0] addr;
wire [8:0] pd;
assign r = pd[0] & onScreen;
assign g = pd[3] & onScreen;
assign b = pd[6] & onScreen;

wire rClock;

wire cdClock;

wire onScreen;

wire vgClock;



wire [11:0] fontAddr;
wire [12:0] charAddr;
wire [7:0] fontData;
wire [7:0] charData;
vgaSync vga (
    .clk(clk), 
    .row(y), 
    .column(x), 
    .hSync(hSync), 
    .vSync(vSync), 
    .onScreen(onScreen),
	 .vgClock(vgClock)
    );



ConsoleDriver cd (
    .x(x), 
    .y(y), 
    .vgaClock(vgClock), 
    .readClock(rClock), 
    .pixelData(pd), 
    .addrRChar(charAddr), 
    .addrRFont(fontAddr), 
    .dataChar(charData), 
    .dataFont(fontData)
    );

MemoryController mem (
.DATALINE(DATALINE), 
    .CLOCK(SPICLOCK), 
    .SS(SS),  
    .addrRChar(charAddr), 
    .addrRFont(fontAddr), 
    .clkaR(rClock), 
    .dataChar(charData), 
    .dataFont(fontData),
	 .led(led)
    );





endmodule