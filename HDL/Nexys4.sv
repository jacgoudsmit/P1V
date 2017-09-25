/*
-------------------------------------------------------------------------------
Top-level module for Digilent Nexys4 (Xilinx Artix-7 FPGA)

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


module              Nexys4
(
input  wire         CLK100MHZ,
output wire   [7:0] ledg,
inout  wire  [31:0] pin,
input  wire         rts,
input  wire         reset,
output wire         ampSD
);

parameter           NUMCOGS = 8;
parameter           INVERT_COG_LEDS = 0;


//
// Clock generator
//


wire                clock_160;
wire                clk_cog;
wire                clk_pll;
wire [7:0]          cfg;
wire                inp_res;

xilinx_clock #(
    .IN_PERIOD_NS   (10.0),
    .CLK_MULTIPLY   (64),
    .CLK_DIVIDE     (4)
) xilinx_clock_ (
    .clk_in         (CLK100MHZ),
    .cfg            (cfg[6:0]),
    .res            (inp_res),
    .clock_160      (clock_160),
    .clk_cog        (clk_cog),
    .clk_pll        (clk_pll)   
);


//
// Reset
//


reset reset_ (
    .clock_160      (clock_160),
    .async_res      (~rts | ~reset),
    .res            (inp_res)
);

always @(posedge clk_cog)
    nres <= ~inp_res & !cfg[7];


//
// Inputs
//


wire[31:0] pin_in;

assign pin_in[31:0] = pin[31:0];


//
// Outputs
//


wire[31:0] pin_out;
wire[31:0] pin_dir;

genvar i;
generate
    for (i = 0; i < 32; i++)
    begin
        assign pin[i] = pin_dir[i] ? pin_out[i] : 1'bz;
//        assign prop_input_bus[i] = pin_dir[i] ? pin_out[i] : sync_out[i];
    end
endgenerate

//Turn on audio amplifier power when PWM output on Pin 10 is set to output direction
assign              ampSD = pin_dir[10];


//
// Propeller 1 core module
//

dig #(
    .INVERT_COG_LEDS (INVERT_COG_LEDS),
    .NUMCOGS        (NUMCOGS)
) core (
    .nres           (nres),
    .cfg            (cfg),
    .clk_cog        (clk_cog),
    .clk_pll        (clk_pll),
    .pin_in         (pin_in),
    .pin_out        (pin_out),
    .pin_dir        (pin_dir),
    .cog_led        (ledg)
);


endmodule