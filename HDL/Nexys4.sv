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


//
// Clock generator
//


wire                clock_160;
wire                clock_80;
wire                pllX8;
wire                pllX4;
wire                pllX2;
wire                pllX1;

xilinx_clock #(
    .IN_PERIOD_NS   (10.0),
    .CLK_MULTIPLY   (64),
    .CLK_DIVIDE     (4)
) xilinx_clock_ (
    .clk_in         (CLK100MHZ),
    .clock_160      (clock_160),
    .clock_80       (clock_80),
    .pllX8          (pllX8),
    .pllX4          (pllX4),
    .pllX2          (pllX2),
    .pllX1          (pllX1)    
);


//
// LEDs
//

wire[7:0] cogled;

genvar l;
generate
    for (l = 0; l < 8; l++)
    begin
        assign ledg[l] = cogled[l];
    end
endgenerate
    

//
// Reset
//


wire                inp_res;

reset reset_ (
    .clock_160      (clock_160),
    .async_res      (~rts | ~reset),
    .res            (inp_res)
);
          

//
// Inputs
//


wire[31:0] pin_in;
//wire[31:0] sync_out;

assign pin_in[31:0] = pin[31:0];

//// Asynchronous Input Synchronization - Adapted from Xilinx language template
//// Since all 32 bits of pin_in are asynchronous to any internal clocking source
//// in the Artix, in order to reduce the risk of metastability we run all input
//// pin paths through a synchronizer to bring everything into the clock_80 domain safely.

//inp_synchronizer #(
//    .SYNC_STAGES     (2),
//    .PIPELINE_STAGES (2),
//    .INIT            (32'b0)
//) in_sync_ (
//    .clock_80       (clock_80),
//    .pin_in         (pin_in),
//    .sync_out       (sync_out)
//);

//
// Outputs
//


//(* KEEP="true" *)
wire[31:0] pin_out;
//(* KEEP="true" *)
wire[31:0] pin_dir;
//(* KEEP="true" *)
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
// Virtual Propeller
//


p1v #(
    .NUMCOGS        (8)
) p1v_ (
    .clock_160      (clock_160),
    .clock_80       (clock_80),
    .pllX8          (pllX8),
    .pllX4          (pllX4),
    .pllX2          (pllX2),
    .pllX1          (pllX1),
    .inp_resn       (~inp_res),
    .ledg           (cogled),
    .pin_out        (pin_out),
    .pin_in         (pin_in),
    .pin_dir        (pin_dir)
);


endmodule