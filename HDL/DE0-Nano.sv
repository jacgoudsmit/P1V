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

`include "p1v.v"
`include "altera.v"

module              DE0Nano
(

input               CLOCK_50,
output        [7:0] LED,
input         [1:0] KEY,

                                        // NOTICE: GPIO headers are mounted ANTI parallel
inout        [33:0] GPIO0,              // Top header
inout        [33:0] GPIO1               // Bottom header

);


//
// Mapt the Propeller pins to match the picture in the documentation
//


wire                pin_resn;
wire         [31:0] pin_in;
wire         [31:0] pin_out;
wire         [31:0] pin_dir;

// I/O pins except 31 and 30
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
assign GPIO0[27] = pin_dir[31] ? pin_out[31] : 1'bZ;
assign GPIO0[29] = pin_dir[30] ? pin_out[30] : 1'bZ;


//
// Reset can come from Prop plug or tactile switch
//


wire resn;

assign resn = KEY[0] & pin_resn;


//
// Clock generator for Altera FPGA's
//


wire clock_160;

altera altera_(
    .clock_50 (CLOCK_50),
    .clock_160 (clock_160)
);


//
// Virtual Propeller
//


p1v p1v_(
    .clock_160      (clock_160),
    .inp_resn       (resn),
    .ledg           (LED),
    .pin_out        (pin_out),
    .pin_in         (pin_in),
    .pin_dir        (pin_dir)
);


endmodule