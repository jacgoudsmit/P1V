/*
-------------------------------------------------------------------------------
DE0-Nano Top Level File

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

input               CLOCK_50,
output        [7:0] LED,
input         [0:0] KEY,

                                        // NOTICE: GPIO headers are mounted ANTI parallel
inout        [33:0] GPIO0,              // Top header
inout        [33:0] GPIO1               // Bottom header

);


//
// Map the Propeller pins to match the picture in the documentation
//


wire                pin_resn;           // Reset (active low) from Prop plug
wire         [31:0] pin_in;             // Input pins (to core)
wire         [31:0] pin_out;            // Output pins (from core)
wire         [31:0] pin_dir;            // Directions (from core)

// Map I/O pins except 31 and 30
genvar i;
generate
    for (i = 0; i < 30; i++)
    begin : map_pin
        assign pin_in[i] = GPIO1[33 - i];
        assign GPIO1[33 - i] = pin_dir[i] ? pin_out[i] : 1'bz;
    end
endgenerate

// Prop plug attaches here
assign pin_resn     = GPIO0[25];
assign pin_in[31]   = GPIO0[27];
assign pin_in[30]   = GPIO0[29];
assign GPIO0[27]    = pin_dir[31] ? pin_out[31] : 1'bZ;
assign GPIO0[29]    = pin_dir[30] ? pin_out[30] : 1'bZ;


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
    .clock          (CLOCK_50),         // Crystal oscillator on the board
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
    .async_res      (~KEY[0]),
    .res            (res)
);

// The reset that comes from the reset pin doesn't have to be
// extended or debounced; the Prop Plug takes care of that.
// Mix the reset input pin with the synchronized reset from the reset module.
assign inp_res = res | ~pin_resn;


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
    .cog_led        (LED)
);


endmodule