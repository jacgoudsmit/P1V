/*
-------------------------------------------------------------------------------
BeMicroCV-A9 Top-level module

This file is part of the hardware description for the Propeller 1 Design.

The Propeller 1 Design is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

The Propeller 1 Design is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along with
the Propeller 1 Design.  If not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------
*/


module              top
(

input               DDR3_CLK_50MHZ,     // 50MHz crystal oscillator
output        [8:1] USER_LED_N,         // LEDs, active low
input         [1:1] TACT_N,             // Tactile switch, active low

                    // J1
inout        [10:2] J1A,
inout       [18:13] J1B,
inout       [28:21] J1C,
inout       [40:31] J1D

);


//
// Map the Propeller pins to match the picture in the documentation
//


wire                pin_resn;           // Reset (active low) from Prop plug
wire         [31:0] pin_in;             // Input pins
wire         [31:0] pin_out;            // Output pins (from core)
wire         [31:0] pin_dir;            // Directions (from core)

// Map I/O pins
`define map(n, io) \
assign pin_in[n] = io; \
assign io = pin_dir[n] ? pin_out[n] : 1'bZ;

`map( 0, J1A[ 2])
`map( 1, J1A[ 3])
`map( 2, J1A[ 4])
`map( 3, J1A[ 5])
`map( 4, J1A[ 6])
`map( 5, J1A[ 7])
`map( 6, J1A[ 8])
`map( 7, J1A[ 9])
`map( 8, J1A[10])
`map( 9, J1B[13])
`map(10, J1B[14])
`map(11, J1B[15])
`map(12, J1B[16])
`map(13, J1B[17])
`map(14, J1B[18])
`map(15, J1C[21])
`map(16, J1C[22])
`map(17, J1C[23])
`map(18, J1C[24])
`map(19, J1C[25])
`map(20, J1C[26])
`map(21, J1C[27])
`map(22, J1C[28])
`map(23, J1D[31])
`map(24, J1D[33])
`map(25, J1D[35])
`map(26, J1D[37])
`map(27, J1D[39])
`map(28, J1D[40])
`map(29, J1D[38])
`map(30, J1D[36])
`map(31, J1D[34])

// reset-pin
assign pin_resn = J1D[32];
assign J1D[32] = 1'bZ;


//
// Clock generator for Altera FPGA's
//


wire                clock_160;          // 160MHz straight from PLL
wire          [7:0] cfg;                // Clock configuration from core
wire                clk_cog;            // Cog clock based on cfg, max 80MHz
wire                clk_pll;            // 2 x clk_cog based on cfg, max 160MHz
wire                res;                // Synchronous 50ms reset pulse

altera_clock #(
    .IN_PERIOD_PS   (20000),
    .PLL_MUL        (16),
    .PLL_DIV        (5)
)
altera_
(
    .clock          (DDR3_CLK_50MHZ),    // Crystal oscillator on the board
    .cfg            (cfg[6:0]),         // Clock config registers from core
    .res            (res),              // Synchronous 50ms reset pulse
    .clk_pll        (clk_pll),          // clock for cog PLL's
    .clk_cog        (clk_cog),          // clock for instruction execution
    .clock_160      (clock_160)         // Fixed frequency 160MHz clock
);


//
// Reset
//


wire                inp_res;

// generate a 50ms pulse from the button. The output is synchronized with the clock.
reset reset_ (
    .clock          (clock_160),
    .async_res      (~TACT_N[1] | ~pin_resn),
    .res            (res)
);

// Mix the reset input pin with the synchronized reset from the reset module.
assign inp_res = res;// | ~pin_resn;


//
// The LEDs are on when set to 0, so we reverse the cog led outputs here
//


wire[8:1] cog_led;

assign USER_LED_N = ~cog_led;


//
// Virtual Propeller
//


dig core (
    .inp_res        (inp_res),
    .cfg            (cfg),
    .clk_cog        (clk_cog),
    .clk_pll        (clk_pll),
    .pin_in         (pin_in),
    .pin_out        (pin_out),
    .pin_dir        (pin_dir),
    .cog_led        (cog_led)
);


endmodule