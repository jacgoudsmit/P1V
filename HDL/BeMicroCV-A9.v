// Top-level module for BeMicroCV-A9

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


module              bemicrocva9
(

input               DDR3_CLK_50MHZ,
input               CLK_24MHZ,
output wire   [8:1] USER_LED,
input         [4:1] DIP_SW,
input         [2:1] TACT,

inout wire   [40:1] J1
//inout wire   [40:1] J2,
//inout wire   [80:1] J4

);

//
// Reset can come from Prop plug or tactile switch
//

wire resn;

assign resn = TACT[1] & J1[32];

//
// The LEDs are on when set to 0, so we reverse the cog led outputs here
//

wire[8:1] cogled;
assign USER_LED = ~cogled;

//
// Inputs
//

wire[31:0] pin_in = 
{
    J1[34],
    J1[36],
    J1[38],
    J1[40],
    J1[39],
    J1[37],
    J1[35],
    J1[33],
    
    J1[31],
    J1[28],
    J1[27],
    J1[26],
    J1[25],
    J1[24],
    J1[23],
    J1[22],
    
    J1[21],
    J1[18],
    J1[17],
    J1[16],
    J1[15],
    J1[14],
    J1[13],
    J1[10],
    
    J1[9],
    J1[8],
    J1[7],
    J1[6],
    J1[5],
    J1[4],
    J1[3],
    J1[2]
};

wire[31:0] pin_out;
wire[31:0] pin_dir;

//
// Outputs
//

`define DIROUT(x) (pin_dir[x] ? pin_out[x] : 1'bZ)
assign J1[34] = `DIROUT(31);
assign J1[36] = `DIROUT(30);
assign J1[38] = `DIROUT(29);
assign J1[40] = `DIROUT(28);
assign J1[39] = `DIROUT(27);
assign J1[37] = `DIROUT(26);
assign J1[35] = `DIROUT(25);
assign J1[33] = `DIROUT(24);
    
assign J1[31] = `DIROUT(23);
assign J1[28] = `DIROUT(22);
assign J1[27] = `DIROUT(21);
assign J1[26] = `DIROUT(20);
assign J1[25] = `DIROUT(19);
assign J1[24] = `DIROUT(18);
assign J1[23] = `DIROUT(17);
assign J1[22] = `DIROUT(16);
    
assign J1[21] = `DIROUT(15);
assign J1[18] = `DIROUT(14);
assign J1[17] = `DIROUT(13);
assign J1[16] = `DIROUT(12);
assign J1[15] = `DIROUT(11);
assign J1[14] = `DIROUT(10);
assign J1[13] = `DIROUT(9);
assign J1[10] = `DIROUT(8);

assign J1[9] = `DIROUT(7);
assign J1[8] = `DIROUT(6);
assign J1[7] = `DIROUT(5);
assign J1[6] = `DIROUT(4);
assign J1[5] = `DIROUT(3);
assign J1[4] = `DIROUT(2);
assign J1[3] = `DIROUT(1);
assign J1[2] = `DIROUT(0);

//
// Clock generator for Altera FPGA's
//

wire clock_160;

altera altera_(
    .clock_50 (DDR3_CLK_50MHZ),
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