//-------------------------------------------------------------------------------------------------------------
//// Top-level module for Digilent Arty (Xilinx Artix-7 FPGA)

///*
//-------------------------------------------------------------------------------

//This file is part of the hardware description for the Propeller 1 Design.

//The Propeller 1 Design is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by the
//Free Software Foundation, either version 3 of the License, or (at your option)
//any later version.

//The Propeller 1 Design is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
//or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//more details.

//You should have received a copy of the GNU General Public License along with
//the Propeller 1 Design.  If not, see <http://www.gnu.org/licenses/>.
//-------------------------------------------------------------------------------

//`include "p1v.v"

module              Nexys4
(
input  wire         CLK100MHZ,
output wire   [7:0] ledg,
inout  reg   [31:0] pin,
input  wire         rts,
input  wire         reset
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
// AndrewSi 08302017: Added rts input from serial port and added to reset below.
//

//
// Emulate RC filter on Prop Plug by generating a long reset pulse
// everytime rts goes high
//
wire clock_160;

reg [24:0] reset_cnt;
reg reset_to;

always @ (posedge clock_160 or negedge rts)
    if (!rts) begin               //Hold in reset whenever rts is low
        reset_cnt <= 25'h07a1200; //50ms delay value revised for 160Mhz clk.
        reset_to <= 1'b0;
    end else begin
        reset_cnt <= reset_to ? reset_cnt : reset_cnt - 1;  // Count down to zero and wrap around.
        reset_to <= (reset_cnt[24] == 1) ? 1'b1 : reset_to; // Reset pulse ends when MSB wraps back to 1.
    end

//Reset Propeller if RTS low, RTS counter is low (running), or CPU_RESET button is pushed (grounded).
wire inp_res = !rts | !reset_to | !reset; 

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

 assign pin[7] = `DIROUT(7);
 assign pin[6] = `DIROUT(6);
 assign pin[5] = `DIROUT(5);
 assign pin[4] = `DIROUT(4);
 assign pin[3] = `DIROUT(3);
 assign pin[2] = `DIROUT(2);
 assign pin[1] = `DIROUT(1);
 assign pin[0] = `DIROUT(0);
 
//
// Clock generator
// This section is based on https://github.com/ZipCPU/openarty/blob/master/rtl/toplevel.v
//

//
// DCM (100 MHz -> 160 MHz)
//

   MMCME2_BASE #(
      .BANDWIDTH("OPTIMIZED"),   // Jitter programming (OPTIMIZED, HIGH, LOW)
      .CLKFBOUT_MULT_F(8.0),     // Multiply value for all CLKOUT (2.000-64.000).
      .CLKFBOUT_PHASE(0.0),      // Phase offset in degrees of CLKFB (-360.000-360.000).
      .CLKIN1_PERIOD(10.0),       // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
      .CLKOUT1_DIVIDE(1),
      .CLKOUT2_DIVIDE(1),
      .CLKOUT3_DIVIDE(1),
      .CLKOUT4_DIVIDE(1),
      .CLKOUT5_DIVIDE(1),
      .CLKOUT6_DIVIDE(1),
      .CLKOUT0_DIVIDE_F(5.0),    // Divide amount for CLKOUT0 (1.000-128.000).
      // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      .CLKOUT6_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_PHASE(0.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .CLKOUT6_PHASE(0.0),
      .CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      .DIVCLK_DIVIDE(1),         // Master division value (1-106)
      .REF_JITTER1(0.010),         // Reference input jitter in UI (0.000-0.999).
      .STARTUP_WAIT("TRUE")     // Delays DONE until MMCM is locked (FALSE, TRUE)
   )
   genclock (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(clock_160),     // 1-bit output: CLKOUT0
      .CLKOUT0B(CLKOUT0B),   // 1-bit output: Inverted CLKOUT0
      .CLKOUT1(CLKOUT1),     // 1-bit output: CLKOUT1
      .CLKOUT1B(CLKOUT1B),   // 1-bit output: Inverted CLKOUT1
      .CLKOUT2(CLKOUT2),     // 1-bit output: CLKOUT2
      .CLKOUT2B(CLKOUT2B),   // 1-bit output: Inverted CLKOUT2
      .CLKOUT3(CLKOUT3),     // 1-bit output: CLKOUT3
      .CLKOUT3B(CLKOUT3B),   // 1-bit output: Inverted CLKOUT3
      .CLKOUT4(CLKOUT4),     // 1-bit output: CLKOUT4
      .CLKOUT5(CLKOUT5),     // 1-bit output: CLKOUT5
      .CLKOUT6(CLKOUT6),     // 1-bit output: CLKOUT6
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(CLKFBOUT),   // 1-bit output: Feedback clock
      .CLKFBOUTB(CLKFBOUTB), // 1-bit output: Inverted CLKFBOUT
      // Status Ports: 1-bit (each) output: MMCM status ports
      .LOCKED(LOCKED),       // 1-bit output: LOCK
      // Clock Inputs: 1-bit (each) input: Clock input
      .CLKIN1(CLK100MHZ),       // 1-bit input: Clock
      // Control Ports: 1-bit (each) input: MMCM control ports
      .PWRDWN(0),       // 1-bit input: Power-down
      .RST(0),             // 1-bit input: Reset
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(CLKFBOUT)      // 1-bit input: Feedback clock
   );


//
// Virtual Propeller
//


p1v #(
    .NUMCOGS (8)
) p1v_ (
    .clock_160 (clock_160),
    .inp_resn (~inp_res),
    .ledg (cogled[8:1]),
    .pin_out (pin_out),
    .pin_in (pin_in),
    .pin_dir (pin_dir)
);

endmodule