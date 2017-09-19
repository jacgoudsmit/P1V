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
    input           clk,        // clock, nominally 160MHz
    input           res,        // reset
    input [6:0]     cfg,        // 7LSBs of CLK register structure 
    
    output          clk_pll,    // "PLL" clock, twice the rate of clk_cog
    output          clk_cog     // cog clock
);

reg [6:0]   cfgx;
reg [12:0]  divide;

wire[4:0] clksel = {cfgx[6:5], cfgx[2:0]};  // convenience, skipping the OSCM1 and OSCM0 signals

assign clk_pll = (clksel == 5'b11111)       // If set to PLL16X
                    ? clk                   // PLL is the full clock rate
                    : divide[11];           // Otherwise, it is twice the rate of clk_cog

assign clk_cog = divide[12];                // Half the rate of clk_pll

always @ (posedge clk)
begin
    cfgx <= cfg;
end

always @ (posedge clk)
begin
    divide <= divide + 
    {
         clksel == 5'b11111 || res,                                                     // PLL16X or reset
         clksel == 5'b11110 && !res,                                                    // PLL8X
         clksel == 5'b11101 && !res,                                                    // PLL4X
        (clksel == 5'b11100 || clksel[2:0] == 3'b000) && !res,                          // PLL2X or RCFAST
        (clksel == 5'b11011 || (clksel[4] == 1'b1 && clksel[2:0] == 3'b010)) && !res,   // PLL1X or XINPUT
         1'b0,
         1'b0,
         1'b0,
         1'b0,
         1'b0,
         1'b0,
         1'b0,
         clksel[2:0] == 3'b001 && !res                                                  // RCSLOW
        };
end

endmodule
