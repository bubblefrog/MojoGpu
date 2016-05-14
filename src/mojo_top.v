module mojo_top(
    // 50MHz clock input
    input clk,
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

assign led = clk;

wire [7:0]data;
wire [15:0] addr;
wire rClock;
wire [8:0]pixelData;

// Instantiate the module
MemoryController mem (
    .addrW(0), 
    .dataW(0), 
    .clkaW(0), 
    .addrR(addr), 
    .clkaR(rClock), 
    .dataR(data)
    );
// Instantiate the module
ConsoleDriver cd (
    .data(data), 
    .x(2), 
    .y(2), 
    .vgaClock(clk), 
    .memAddr(addr), 
    .readClock(rClock), 
    .pixelData(pixelData)
    );





endmodule