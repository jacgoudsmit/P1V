/*
-------------------------------------------------------------------------------
p1v

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


module              p1v
(
input               clock_160,          // clock input
input               pllX16,             // 1/2 clock for Cogs
input               pllX8,              // ..etc..
input               pllX4,
input               pllX2,
input               pllX1,
input               inp_resn,           // reset input (active low)

input       [31:0]  pin_in,
output      [31:0]  pin_out,
output      [31:0]  pin_dir,

output       [7:0]  ledg                // "cog active" leds
);

parameter           INVERT_COG_LEDS = 0;
parameter           NUMCOGS = 8;


//
// reg and wire declarations
//
reg                 nres;
wire         [7:0]  cfg;
wire                clkfb, clk;
reg         [23:0]  reset_cnt;
reg                 reset_to;
wire                clk_pll;
wire                clk_cog;

//    
// Clock control
//

tim clkgen( .clock_160  (clock_160),
            .pllX16     (pllX16),
            .pllX8      (pllX8),
            .pllX4      (pllX4),
            .pllX2      (pllX2),
            .pllX1      (pllX1),
            .res        (~inp_resn),
            .cfg        (cfg[6:0]),
            .clk_pll    (clk_pll),
            .clk_cog    (clk_cog)
          );

//
// Propeller 1 core module
//

dig #(
            .INVERT_COG_LEDS (INVERT_COG_LEDS),
            .NUMCOGS    (NUMCOGS)
) core (
            .nres       (nres),
            .cfg        (cfg),
            .clk_cog    (clk_cog),
            .clk_pll    (clk_pll),
            .pin_in     (pin_in),
            .pin_out    (pin_out),
            .pin_dir    (pin_dir),
            .cog_led    (ledg)
        );

always @ (posedge clk_cog)
    nres <= inp_resn & !cfg[7];

endmodule
