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

xilinx_clock #(
    .IN_PERIOD_NS   (10.0),
    .CLK_MULTIPLY   (8),
    .CLK_DIVIDE     (5)
) xilinx_clock_ (
    .clk_in         (CLK100MHZ),
    .clock_160      (clock_160)
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
assign pin_in[31:0] = pin[31:0];


//
// Outputs
//


wire[31:0] pin_out;
wire[31:0] pin_dir;

`define DIROUT(x) (pin_dir[x] ? pin_out[x] : 1'bZ)

genvar i;
generate
    for (i = 0; i < 32; i++)
    begin
        assign pin[i] = pin_dir[i] ? pin_out[i] : 1'bz;
    end
endgenerate

//
// Virtual Propeller
//


p1v #(
    .NUMCOGS        (8)
) p1v_ (
    .clock_160      (clock_160),
    .inp_resn       (~inp_res),
    .ledg           (cogled),
    .pin_out        (pin_out),
    .pin_in         (pin_in),
    .pin_dir        (pin_dir)
);


endmodule