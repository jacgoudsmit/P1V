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
input  wire   [0:0] btn,
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


//
// LEDs
//


wire clock_160;
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


wire resn;

assign resn = ck_rst;

assign led3_r = resn & dim;


//
// Inputs
//


wire[31:0] pin_in = 
{
    jd[7],
    jd[6],
    jd[5],
    jd[4],
    jd[3],
    jd[2],
    jd[1],
    jd[0],

    jc[7],
    jc[6],
    jc[5],
    jc[4],
    jc[3],
    jc[2],
    jc[1],
    jc[0],

    jb[7],
    jb[6],
    jb[5],
    jb[4],
    jb[3],
    jb[2],
    jb[1],
    jb[0],

    ja[7],
    ja[6],
    ja[5],
    ja[4],
    ja[3],
    ja[2],
    ja[1],
    ja[0]
};


//
// Outputs
//


wire[31:0] pin_out;
wire[31:0] pin_dir;


`define DIROUT(x) (pin_dir[x] ? pin_out[x] : 1'bZ)
assign jd[7] = `DIROUT(31);
assign jd[6] = `DIROUT(30);
assign jd[5] = `DIROUT(29);
assign jd[4] = `DIROUT(28);
assign jd[3] = `DIROUT(27);
assign jd[2] = `DIROUT(26);
assign jd[1] = `DIROUT(25);
assign jd[0] = `DIROUT(24);
    
assign jc[7] = `DIROUT(23);
assign jc[6] = `DIROUT(22);
assign jc[5] = `DIROUT(21);
assign jc[4] = `DIROUT(20);
assign jc[3] = `DIROUT(19);
assign jc[2] = `DIROUT(18);
assign jc[1] = `DIROUT(17);
assign jc[0] = `DIROUT(16);
    
assign jb[7] = `DIROUT(15);
assign jb[6] = `DIROUT(14);
assign jb[5] = `DIROUT(13);
assign jb[4] = `DIROUT(12);
assign jb[3] = `DIROUT(11);
assign jb[2] = `DIROUT(10);
assign jb[1] = `DIROUT(9);
assign jb[0] = `DIROUT(8);

assign ja[7] = `DIROUT(7);
assign ja[6] = `DIROUT(6);
assign ja[5] = `DIROUT(5);
assign ja[4] = `DIROUT(4);
assign ja[3] = `DIROUT(3);
assign ja[2] = `DIROUT(2);
assign ja[1] = `DIROUT(1);
assign ja[0] = `DIROUT(0);


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
// Clock generator
// This section is based on https://github.com/ZipCPU/openarty/blob/master/rtl/toplevel.v
//


wire clock_160;

wire    s_clk, sys_clk, mem_clk_nobuf, mem_clk_200mhz,
    clk1_unused, clk2_unused, enet_clk, clk4_unnused,
    clk5_unused, clk_feedback, clk_locked, mem_clk_200mhz_nobuf;
PLLE2_BASE  #(
    .BANDWIDTH("OPTIMIZED"),    // OPTIMIZED, HIGH, LOW
    .CLKFBOUT_PHASE(0.0),   // Phase offset in degrees of CLKFB, (-360-360)
    .CLKIN1_PERIOD(10.0),   // Input clock period in ns resolution
    // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: divide amount for each CLKOUT(1-128)
    .CLKFBOUT_MULT(8),  // Multiply value for all CLKOUT (2-64)
    .CLKOUT0_DIVIDE(8), // 100 MHz  (Clock for MIG)
    .CLKOUT1_DIVIDE(4), // 200 MHz  (MIG Reference clock)
    .CLKOUT3_DIVIDE(32),    //  25 MHz  (Ethernet reference clk)
    .CLKOUT4_DIVIDE(5),     //  160 MHz (Cog clock)
    .CLKOUT5_DIVIDE(24),    //  66 MHz
    // CLKOUT0_DUTY_CYCLE -- Duty cycle for each CLKOUT
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT3_DUTY_CYCLE(0.5),
    .CLKOUT4_DUTY_CYCLE(0.5),
    .CLKOUT5_DUTY_CYCLE(0.5),
    // CLKOUT0_PHASE -- phase offset for each CLKOUT
    .CLKOUT0_PHASE(0.0),
    .CLKOUT1_PHASE(0.0),
    .CLKOUT2_PHASE(0.0),
    .CLKOUT3_PHASE(0.0),
    .CLKOUT4_PHASE(0.0),
    .CLKOUT5_PHASE(0.0),
    .DIVCLK_DIVIDE(1),  // Master division value , (1-56)
    .REF_JITTER1(0.0),  // Ref. input jitter in UI (0.000-0.999)
    .STARTUP_WAIT("TRUE")   // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
) genclock(
    // Clock outputs: 1-bit (each) output
    .CLKOUT0(mem_clk_nobuf),
    .CLKOUT1(mem_clk_200mhz_nobuf),
    .CLKOUT2(clk2_unused),
    .CLKOUT3(enet_clk),
    .CLKOUT4(clock_160),
    .CLKOUT5(clk5_unused),
    .CLKFBOUT(clk_feedback), // 1-bit output, feedback clock
    .LOCKED(clk_locked),
    .CLKIN1(CLK100MHZ),
    .PWRDWN(1'b0),
    .RST(1'b0),
    .CLKFBIN(clk_feedback)  // 1-bit input, feedback clock
);


//
// Virtual Propeller
//


p1v #(
    .NUMCOGS (8)
) p1v_ (
    .clock_160 (clock_160),
    .inp_resn (resn),
    .ledg (cogled[8:1]),
    .pin_out (pin_out),
    .pin_in (pin_in),
    .pin_dir (pin_dir)
);

endmodule