/*
-------------------------------------------------------------------------------
Clock generator for Xilinx targets

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


module              xilinx_clock
(
input               clk_in,
output              clock_160,
output              clock_80,
output              pllX8,
output              pllX4,
output              pllX2,
output              pllX1
);

parameter  IN_PERIOD_NS = 10.0;
parameter  CLK_MULTIPLY = 64;
parameter  CLK_DIVIDE   = 4;

wire                CLKFBOUT;

// Each successive tap is half the speed of the previous e.g.: 160, 80, 40, 20, 10, 5 MHz 
parameter CLK_DIV_1 = CLK_DIVIDE << 1;
parameter CLK_DIV_2 = CLK_DIV_1 << 1;
parameter CLK_DIV_3 = CLK_DIV_2 << 1;
parameter CLK_DIV_4 = CLK_DIV_3 << 1;
parameter CLK_DIV_5 = CLK_DIV_4 << 1;
//parameter CLK_DIV_6 = CLK_DIV_5 << 1; // Exceeds max of 128

MMCME2_BASE #(
  .BANDWIDTH("OPTIMIZED"),              // Jitter programming (OPTIMIZED, HIGH, LOW)
  .CLKFBOUT_MULT_F(CLK_MULTIPLY),       // Multiply value for all CLKOUT (2.000-64.000).
  .CLKFBOUT_PHASE(0.0),                 // Phase offset in degrees of CLKFB (-360.000-360.000).
  .CLKIN1_PERIOD(IN_PERIOD_NS),         // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
  .CLKOUT0_DIVIDE_F(CLK_DIVIDE),        // Divide amount for CLKOUT0 (1.000-128.000 - .125 fracs OK).
  // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128 integer)
  .CLKOUT1_DIVIDE(CLK_DIV_1),
  .CLKOUT2_DIVIDE(CLK_DIV_2),
  .CLKOUT3_DIVIDE(CLK_DIV_3),
  .CLKOUT4_DIVIDE(CLK_DIV_4),
  .CLKOUT5_DIVIDE(CLK_DIV_5),
  .CLKOUT6_DIVIDE(1),
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
  .CLKOUT4_CASCADE("FALSE"),            // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
  .DIVCLK_DIVIDE(10),                    // Master division value (1-106)
  .REF_JITTER1(0.010),                  // Reference input jitter in UI (0.000-0.999).
  .STARTUP_WAIT("TRUE")                 // Delays DONE until MMCM is locked (FALSE, TRUE)
)
genclock (
  // Clock Outputs: 1-bit (each) output: User configurable clock outputs
  .CLKOUT0(clock_160),                  // 1-bit output: CLKOUT0
  .CLKOUT0B(),                          // 1-bit output: Inverted CLKOUT0
  .CLKOUT1(clock_80),                   // 1-bit output: CLKOUT1
  .CLKOUT1B(),                          // 1-bit output: Inverted CLKOUT1
  .CLKOUT2(pllX8),                      // 1-bit output: CLKOUT2
  .CLKOUT2B(),                          // 1-bit output: Inverted CLKOUT2
  .CLKOUT3(pllX4),                      // 1-bit output: CLKOUT3
  .CLKOUT3B(),                          // 1-bit output: Inverted CLKOUT3
  .CLKOUT4(pllX2),                      // 1-bit output: CLKOUT4
  .CLKOUT5(pllX1),                      // 1-bit output: CLKOUT5
  .CLKOUT6(),                           // 1-bit output: CLKOUT6
  // Feedback Clocks: 1-bit (each) output: Clock feedback ports
  .CLKFBOUT(CLKFBOUT),                  // 1-bit output: Feedback clock
  .CLKFBOUTB(),                         // 1-bit output: Inverted CLKFBOUT
  // Status Ports: 1-bit (each) output: MMCM status ports
  .LOCKED(),                            // 1-bit output: LOCK
  // Clock Inputs: 1-bit (each) input: Clock input
  .CLKIN1(clk_in),                      // 1-bit input: Clock
  // Control Ports: 1-bit (each) input: MMCM control ports
  .PWRDWN(0),                           // 1-bit input: Power-down
  .RST(0),                              // 1-bit input: Reset
  // Feedback Clocks: 1-bit (each) input: Clock feedback ports
  .CLKFBIN(CLKFBOUT)                    // 1-bit input: Feedback clock
);


endmodule
