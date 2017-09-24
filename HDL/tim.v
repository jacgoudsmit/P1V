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


module tim
(
    input           clock_160,  // external clock, nominally 160MHz
    input           pllX16,     // 1/2 external clock, i.e. 80Mhz
    input           pllX8,      // 40Mhz
    input           pllX4,      // 20Mhz
    input           pllX2,      // 10Mhz
    input           pllX1,      //  5Mhz
    input           res,        // reset
    input [6:0]     cfg,        // 7LSBs of CLK register structure 
    
    output          clk_pll,    // "Fake PLL" clock, 2x the cog clock.
    output          clk_cog     // Cog clock out, from selector logic below
);

reg [6:0]   cfgx = 7'b0;
reg [12:0]  divide = 13'b0;

wire pllX8_or_4, pllX4_or_2, pllX2_or_1, pllX1_or_rcslow;

wire[4:0] clksel = {cfgx[6:5], cfgx[2:0]};  // convenience, skipping the OSCM1 and OSCM0 signals

always @ (posedge clock_160)
begin
    cfgx <= cfg;
end

//   BUFGMUX_CTRL BUFGMUX_CTRL_clkpll (
//      .O(clk_pll),              // 1-bit output: PLL clock output
//      .I0(cogclk_x2),           // 1-bit input: CogClk x 2 when clock mode is something other than PLLX16
//      .I1(clock_160),           // 1-bit input: Use clock_160 when set to PLLx16 mode
//      .S(clksel == 5'b11111)    // 1-bit input: (Is clock mode PLLx16?)
//   );
   assign clk_pll = clock_160;    // TODO: Find some way to select the right 2x clock for the fake PLL without overusing BUFGMUX_CTRL's
      
   BUFGMUX_CTRL BUFGMUX_CTRL_cogclk (
      .O(clk_cog),
      .I0(pllX8_or_4),
      .I1(pllX16),
      .S(clksel == 5'b11111)      // Select PLLX16 if true, otherwise lower
   );
   
   BUFGMUX_CTRL BUFGMUX_CTRL_medpll (
      .O(pllX8_or_4),
      .I0(pllX4_or_2),
      .I1(pllX8),
      .S(clksel == 5'b11110) // Select PLLX8 when true, otherwise lower
   ); 

   BUFGMUX_CTRL BUFGMUX_CTRL_lowpll (
      .O(pllX4_or_2),
      .I0(pllX2_or_1),
      .I1(pllX4),
      .S(clksel == 5'b11101) // Select PLLX4 when true, otherwise lower
   );
   
   BUFGMUX_CTRL BUFGMUX_CTRL_lastpll (
      .O(pllX2_or_1),
      .I0(pllX1_or_rcslow),
      .I1(pllX2),
      .S(clksel == 5'b11100 || clksel[2:0] == 3'b000) // Select PLLX2 when true, otherwise lower
   );
      
   BUFGMUX_CTRL BUFGMUX_CTRL_rcslow (
      .O(pllX1_or_rcslow),
      .I0(divide[12]),
      .I1(pllX1),
      .S(clksel == 5'b11011 || clksel == 5'b01010) // Select PLLX1 or XINPUT when true, otherwise RCSLOW
   );      

always @ (posedge clock_160)
begin
    divide <= divide + 
    {res, 11'b00000000000, !res}; //13 bit counter at 160Mhz results in divide[12] toggling at ~19.5Khz for RCSLOW
end

endmodule
