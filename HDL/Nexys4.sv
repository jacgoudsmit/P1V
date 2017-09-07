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


wire[8:1] cogled;
assign ledg[0] = cogled[1];
assign ledg[1] = cogled[2];
assign ledg[2] = cogled[3];
assign ledg[3] = cogled[4];
assign ledg[4] = cogled[5];
assign ledg[5] = cogled[6];
assign ledg[6] = cogled[7];
assign ledg[7] = cogled[8];


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

assign pin[31] = `DIROUT(31);
assign pin[30] = `DIROUT(30);
assign pin[29] = `DIROUT(29);
assign pin[28] = `DIROUT(28);
assign pin[27] = `DIROUT(27);
assign pin[26] = `DIROUT(26);
assign pin[25] = `DIROUT(25);
assign pin[24] = `DIROUT(24);

assign pin[23] = `DIROUT(23);
assign pin[22] = `DIROUT(22);
assign pin[21] = `DIROUT(21);
assign pin[20] = `DIROUT(20);
assign pin[19] = `DIROUT(19);
assign pin[18] = `DIROUT(18);
assign pin[17] = `DIROUT(17);
assign pin[16] = `DIROUT(16);

assign pin[15] = `DIROUT(15);
assign pin[14] = `DIROUT(14);
assign pin[13] = `DIROUT(13);
assign pin[12] = `DIROUT(12);
assign pin[11] = `DIROUT(11);
assign pin[10] = `DIROUT(10);
assign pin[9]  = `DIROUT(9);
assign pin[8]  = `DIROUT(8);

assign pin[7]  = `DIROUT(7);
assign pin[6]  = `DIROUT(6);
assign pin[5]  = `DIROUT(5);
assign pin[4]  = `DIROUT(4);
assign pin[3]  = `DIROUT(3);
assign pin[2]  = `DIROUT(2);
assign pin[1]  = `DIROUT(1);
assign pin[0]  = `DIROUT(0);


//
// Virtual Propeller
//


p1v #(
    .NUMCOGS        (8)
) p1v_ (
    .clock_160      (clock_160),
    .inp_resn       (~inp_res),
    .ledg           (cogled[8:1]),
    .pin_out        (pin_out),
    .pin_in         (pin_in),
    .pin_dir        (pin_dir)
);


endmodule