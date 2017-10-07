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
input [6:0]         cfg,
input               res,
output              clock_160,
output              clk_cog,
output              clk_pll,
output              slow_clk
);

//
//  First, instantiate the MMCM clock module primitive.
//

parameter  IN_PERIOD_NS = 10.0;
parameter  CLK_MULTIPLY = 64;
parameter  CLK_DIVIDE   = 4;

wire      clock_160_o,clk_pll_o,CLKFBOUT, pllX16, pllX8, pllX4, pllX2, pllX1;

// Each successive tap is half the speed of the previous e.g.: 80, 40, 20, 10, 5 MHz 
parameter CLK_DIV_1 = CLK_DIVIDE << 1;  // 80Mhz - PLLX16
parameter CLK_DIV_2 = CLK_DIV_1 << 1;   // 40 - PLLX8
parameter CLK_DIV_3 = CLK_DIV_2 << 1;   // 20 - PLLX4
parameter CLK_DIV_4 = CLK_DIV_3 << 1;   // 10 - PLLX2 - Doubles as crystal-less "RCFAST" setting
parameter CLK_DIV_5 = CLK_DIV_4 << 1;   //  5 - PLLX1
parameter CLK_DIV_6 = CLK_DIVIDE + (CLK_DIVIDE >> 2); //CLK_PLL (Simulated) - 128Mhz


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
  .CLKOUT6_DIVIDE(CLK_DIV_6),
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
  .CLKOUT0(clock_160_o),                  // 1-bit output: CLKOUT0
  .CLKOUT0B(),                          // 1-bit output: Inverted CLKOUT0
  .CLKOUT1(pllX16),                     // 1-bit output: CLKOUT1
  .CLKOUT1B(),                          // 1-bit output: Inverted CLKOUT1
  .CLKOUT2(pllX8),                      // 1-bit output: CLKOUT2
  .CLKOUT2B(),                          // 1-bit output: Inverted CLKOUT2
  .CLKOUT3(pllX4),                      // 1-bit output: CLKOUT3
  .CLKOUT3B(),                          // 1-bit output: Inverted CLKOUT3
  .CLKOUT4(pllX2),                      // 1-bit output: CLKOUT4
  .CLKOUT5(pllX1),                      // 1-bit output: CLKOUT5
  .CLKOUT6(clk_pll_o),                  // 1-bit output: CLKOUT6
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

//
//  Latch the config register inputs to determine the clock mode requested for output.
//

reg [6:0]   cfgx = 7'b0;
reg [6:0]  divide = 6'b0;

wire pllX8_or_4, pllX4_or_2, pllX2_or_1, pllX1_or_rcslow;

wire[4:0] clksel = {cfgx[6:5], cfgx[2:0]};  // convenience, skipping the OSCM1 and OSCM0 signals

always @ (posedge pllX16)
begin
    cfgx <= cfg;
end

// The 160Mhz clock needs to go on a clock buffer.
BUFG BUFG_160 (
    .O(clock_160),
    .I(clock_160_o)
);

// As does the Cog-PLLs clock.
BUFG BUFG_pll (
    .O(clk_pll),
    .I(clk_pll_o)
);

//
//  The next section creates a chain of 2-to-1 clock MUXes such that only the clock selected by the cog clock config register is output to them.
//      
BUFGMUX_CTRL BUFGMUX_CTRL_clkcog (
      .O(clk_cog),
      .I0(pllX8_or_4),
      .I1(pllX16),
      .S(clksel == 5'b11111)        // Select PLLX16 if true, otherwise lower
);
   
BUFGMUX_CTRL BUFGMUX_CTRL_medpll (
      .O(pllX8_or_4),
      .I0(pllX4_or_2),
      .I1(pllX8),
      .S(clksel == 5'b11110)        // Select PLLX8 when true, otherwise lower
); 

BUFGMUX_CTRL BUFGMUX_CTRL_lowpll (
      .O(pllX4_or_2),
      .I0(pllX2_or_1),
      .I1(pllX4),
      .S(clksel == 5'b11101)        // Select PLLX4 when true, otherwise lower
);
   
BUFGMUX_CTRL BUFGMUX_CTRL_lastpll (
      .O(pllX2_or_1),
      .I0(pllX1_or_rcslow),
      .I1(pllX2),
      .S(clksel == 5'b11100 || clksel[2:0] == 3'b000)   // Select PLLX2 when true, otherwise lower
);

BUFG slow_bufg (
    .O(slow_clk),
    .I(divide[6])
);
      
BUFGMUX_CTRL BUFGMUX_CTRL_rcslow (
      .O(pllX1_or_rcslow),
      .I0(divide[6]),
      .I1(pllX1),
      .S(clksel == 5'b11011 || clksel == 5'b01010)      // Select PLLX1 or XINPUT when true, otherwise RCSLOW
);      

// Generate a ~20Khz clock for RCSLOW mode from a counter. (Can't get the MMCM to run that slow).
always @ (posedge pllX1)
begin
    divide <= divide + 
    {res, 5'b00000, !res}; //7 bit counter at 5Mhz results in divide[6] toggling at ~19.5Khz for RCSLOW
end


endmodule
