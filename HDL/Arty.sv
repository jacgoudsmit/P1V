// Top-level module for Digilent Arty (Xilinx Artix-7 FPGA)

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


module              arty
(

input  wire         CLK100MHZ,
output wire   [3:0] led,
output wire         led0_g,
output wire         led1_g,
output wire         led2_g,
output wire         led3_g,
output wire         led2_r,
output wire         led3_r,
input  wire   [0:0] sw,

inout  wire   [7:0] ja,
inout  wire   [7:0] jb,
inout  wire   [7:0] jc,
inout  wire   [7:0] jd,

// FTDI chip is connected to these and emulates the Prop Plug
// IMPORTANT: Jumper JP2 must be bridged if you use this feature
input  wire         uart_txd_in,
output wire         uart_rxd_out,
input  wire         ck_rst

);

parameter           NUMCOGS = 8;

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
// LEDs
//


reg[2:0] ledpwm;
always @(posedge clock_160)
begin
  ledpwm = ledpwm + 1;
end

wire dim;
assign dim = &{ledpwm};

wire[8:1] cogled;
assign led0_g = cogled[1] & dim;
assign led1_g = cogled[2] & dim;
assign led2_g = cogled[3] & dim;
assign led3_g = cogled[4] & dim;
assign led[0] = cogled[5];
assign led[1] = cogled[6];
assign led[2] = cogled[7];
assign led[3] = cogled[8];


//
// Reset
//


reg nres;

reset reset_ (
    .clock_160      (clock_160),
    .async_res      (~ck_rst),
    .res            (inp_res)
);

always @(posedge clk_cog)
    nres <= ~inp_res & !cfg[7];

assign led3_r = !nres & dim;


//
// Inputs
//


wire[31:0] pin = 
{
    jd, jc, jb, ja
};


//
// Outputs
//


wire[31:0] pin_out;
wire[31:0] pin_dir;


genvar i;
generate
    for (i = 0; i < 32; i++)
    begin
        assign pin[i] = pin_dir[i] ? pin_out[i] : 1'bZ;
    end
endgenerate


//
// Use the on-board FTDI chip as Prop plug, unless switch SW0 is on.
// NOTE: JP2 must be bridged to allow resetting via DTR of the FTDI chip.
//


wire ftdi_propplug;

assign ftdi_propplug = ~sw[0];

assign led2_r = ftdi_propplug & dim;

assign uart_rxd_out = ftdi_propplug ? jd[6] : 1'bZ;
assign jd[7] = ftdi_propplug ? uart_txd_in : 1'bZ;    


//
// Virtual Propeller
//


dig #(
    .NUMCOGS        (NUMCOGS)
) core (
    .nres           (nres),
    .cfg            (cfg),
    .clk_cog        (clk_cog),
    .clk_pll        (clk_pll),
    .pin_in         (pin),
    .pin_out        (pin_out),
    .pin_dir        (pin_dir),
    .cog_led        (cogled)
);


endmodule