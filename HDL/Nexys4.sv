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
input  wire         reset
);

parameter           NUMCOGS = 8;
parameter           INVERT_COG_LEDS = 0;


//
// Clock generator
//


wire                inp_res;
wire [7:0]          cfg;
wire                clock_160;
wire                clk_cog;
wire                clk_pll;

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


reg                 nres;

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
//wire[31:0] sync_out;

assign pin_in[31:0] = pin[31:0];

//// Asynchronous Input Synchronization - Adapted from Xilinx language template
//// Since all 32 bits of pin_in are asynchronous to any internal clocking source
//// in the Artix, in order to reduce the risk of metastability we run all input
//// pin paths through a synchronizer to bring everything into the pllX16 domain safely.

//inp_synchronizer #(
//    .SYNC_STAGES     (2),
//    .PIPELINE_STAGES (2),
//    .INIT            (32'b0)
//) in_sync_ (
//    .pllX16       (pllX16),
//    .pin_in         (pin_in),
//    .sync_out       (sync_out)
//);


//
// Outputs
//


wire[31:0] pin_out;
wire[31:0] pin_dir;
//wire[31:0] prop_input_bus;

// Based on direction register bits, send Prop outputs to output pins, or Hi-Z when direction is input.
// When direction is output, the input bus should immediately mirror the data being output 
// without passing through the synchronizers. Otherwise, use the result of the async input synchronizers.

genvar i;
generate
    for (i = 0; i < 32; i++)
    begin
        assign pin[i] = pin_dir[i] ? pin_out[i] : 1'bz;
//        assign prop_input_bus[i] = pin_dir[i] ? pin_out[i] : sync_out[i];
    end
endgenerate


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

endmodule