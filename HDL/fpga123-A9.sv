/*
-------------------------------------------------------------------------------
Parallax 1-2-3 FPGA A9 Top level module

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

input               clock_50,           // 50MHz Crystal Oscillator
output       [15:0] led,                // LEDs, active low   
inout        [29:0] io,                 // I/O pins (except p[31] and p[30] for Prop Plug)

                    // Use the 1-2-3-FPGA USB serial I/O instead of a Prop plug
                    // Note: Board must be in "Run" mode for this to be active.
input               fpga_rx,
output              fpga_tx,
input               fpga_resn

);


//
// Map the Propeller pins
//


wire                pin_resn;           // Reset (active low) from Prop plug
wire         [31:0] pin_in;             // Input pins
wire         [31:0] pin_out;            // Output pins (from core)
wire         [31:0] pin_dir;            // Directions (from core)

// Map I/O pins
`define map(n, io) \
assign pin_in[n] = io; \
assign io = pin_dir[n] ? pin_out[n] : 1'bZ;

genvar i;
generate
    for (i = 0; i < 30; i++) // Don't map p30 and p31
    begin : map_pin
        `map(i, io[i])
    end
endgenerate

// Use on-board FTDI as Prop plug
assign pin_resn = fpga_resn;
assign pin_in[31] = fpga_rx;
assign fpga_tx = pin_dir[30] ? pin_out[30] : 1'b1;


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
    .clock          (clock_50),         // Crystal oscillator on the board
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

// generate a 50ms pulse. The output is synchronized with the clock.
reset reset_ (
    .clock          (clock_160),
    .async_res      (~pin_resn),
    .res            (res)
);

assign inp_res = res;


//
// LEDs
//


wire          [7:0] cog_led;

// LEDs are active low, so invert them
assign led[7:0] = ~cog_led;

// For now, let the upper LEDs show the reverse of the lower ones
assign led[15:8] = cog_led;


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
