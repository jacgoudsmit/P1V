/*
-------------------------------------------------------------------------------
altera

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

module              altera
(
input               clock_50,

output              clock_160
);

//
// Clock generation
//

wire [4:0] _dummy_clk;

altpll #( .operation_mode("NORMAL"),
          .pll_type("ENHANCED"),
          .inclk0_input_frequency(20000),   // 20000ps = 50MHz
          .clk0_multiply_by(16),
          .clk0_divide_by(5))
    pll ( .inclk({1'b0, clock_50}),
          .clk({_dummy_clk, clock_160})
        );

endmodule
