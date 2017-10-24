/*
-------------------------------------------------------------------------------
DE2-115 Top Level File

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
output        [7:0] LEDG,
input         [0:0] KEY,

inout        [35:0] GPIO

);


//
// Map the Propeller pins to match the picture in the documentation
//


wire                pin_resn;           // Reset (active low) from Prop plug
wire         [31:0] pin_in;             // Input pins (to core)
wire         [31:0] pin_out;            // Output pins (from core)
wire         [31:0] pin_dir;            // Directions (from core)

// Map I/O pins 0..26
genvar i;
generate
    for (i = 0; i < 27; i++)
    begin : map_pin
        assign pin_in[i] = GPIO[i];
        assign GPIO[i] = pin_dir[i] ? pin_out[i] : 1'bz;
    end
endgenerate

// Map I/O pins 27..29
assign pin_in[27] = GPIO[28];
assign pin_in[28] = GPIO[30];
assign pin_in[29] = GPIO[32];
assign GPIO[28]   = pin_dir[27] ? pin_out[27] : 1'bZ;
assign GPIO[30]   = pin_dir[28] ? pin_out[28] : 1'bZ;
assign GPIO[32]   = pin_dir[29] ? pin_out[29] : 1'bZ;

// Prop plug attaches here
assign pin_resn   = GPIO[27];
assign pin_in[31] = GPIO[29];
assign pin_in[30] = GPIO[31];
assign GPIO[29]   = pin_dir[31] ? pin_out[31] : 1'bZ;
assign GPIO[31]   = pin_dir[30] ? pin_out[30] : 1'bZ;


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
    .cog_led        (LEDG)
);


endmodule
