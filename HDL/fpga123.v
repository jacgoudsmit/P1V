// Top-level module for Parallax 1-2-3 FPGA A7 Version (#60054)
//
// Created from BeMicroCV-A9.v by Rick Post (aka Mindrobots) 7-31-15

/*
-------------------------------------------------------------------------------

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


module              fpga123
(

// pull pin assignments from .qsf file definitions

input               clock_50,
output wire  [15:0] led,                // use all the user LEDS for COG indicators   
inout wire   [31:0] p,
inout wire          fpga_rx,            // use the 1-2-3-FPGA USB serial I/O   
inout wire          fpga_tx,            // instead of a prop plug - board must 
inout wire          fpga_resn           // be in "Run" mode for this to be active


);

//
// Reset comes from USB port serial connection
//

wire resn;

assign resn = fpga_resn;

//
// The LEDs are on when set to 0, so we reverse the cog led outputs here
// 1-2-3-FPGA has 16 user LEDs - default is to use 0-7 to indicate active
// and 8-15 to indicate inactive COG
//

wire[8:1] cogled;
assign led[7:0] = ~cogled[8:1]; // lit when COG is active
assign led[15:8] = cogled[8:1]; // lit when COG is inactive

//
// Inputs
//

wire[31:0] pin_in = 
{
    fpga_rx,
    fpga_tx,
    p[29],
    p[28],
    p[27],
    p[26],
    p[25],
    p[24],
    p[23],
    p[22],
    p[21],
    p[20],
    p[19],
    p[18],
    p[17],
    p[16],
    p[15],
    p[14],
    p[13],
    p[12],
    p[11],
    p[10],
    p[9],
    p[8],
    p[7],
    p[6],
    p[5],
    p[4],
    p[3],
    p[2],
    p[1],
    p[0]
};

wire[31:0] pin_out;
wire[31:0] pin_dir;



//
// Outputs
//

`define DIROUT(x) (pin_dir[x] ? pin_out[x] : 1'bZ)
assign fpga_rx = `DIROUT(31);
assign fpga_tx = `DIROUT(30);
assign p[29] = `DIROUT(29);
assign p[28] = `DIROUT(28);
assign p[27] = `DIROUT(27);
assign p[26] = `DIROUT(26);
assign p[25] = `DIROUT(25);
assign p[24] = `DIROUT(24);
    
assign p[23] = `DIROUT(23);
assign p[22] = `DIROUT(22);
assign p[21] = `DIROUT(21);
assign p[20] = `DIROUT(20);
assign p[19] = `DIROUT(19);
assign p[18] = `DIROUT(18);
assign p[17] = `DIROUT(17);
assign p[16] = `DIROUT(16);
    
assign p[15] = `DIROUT(15);
assign p[14] = `DIROUT(14);
assign p[13] = `DIROUT(13);
assign p[12] = `DIROUT(12);
assign p[11] = `DIROUT(11);
assign p[10] = `DIROUT(10);
assign p[9] = `DIROUT(9);
assign p[8] = `DIROUT(8);

assign p[7] = `DIROUT(7);
assign p[6] = `DIROUT(6);
assign p[5] = `DIROUT(5);
assign p[4] = `DIROUT(4);
assign p[3] = `DIROUT(3);
assign p[2] = `DIROUT(2);
assign p[1] = `DIROUT(1);
assign p[0] = `DIROUT(0);

//
// Clock generator for Altera FPGA's
//

wire clock_160;

altera altera_(
    .clock_50 (clock_50),
    .clock_160 (clock_160)
);

//
// Virtual Propeller
//

p1v p1v_(
    .clock_160 (clock_160),
    .inp_resn (resn),
    .ledg (cogled[8:1]),
    .pin_out (pin_out),
    .pin_in (pin_in),
    .pin_dir (pin_dir)
);

endmodule
