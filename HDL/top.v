// top

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


`include "tim.v"
`include "dig.v"

module              top
(
input               clock_50,           // clock input
input               inp_resn,           // reset input (active low)

inout       [31:0]  io,                 // i/o pins

output       [7:0]  ledg                // cog leds
);

`include "features.v"

//
// reg and wire declarations
//
reg                 nres;
wire         [7:0]  cfg;
wire        [31:0]  pin_out, pin_dir;
wire                clkfb, clock_160, clk;
reg         [23:0]  reset_cnt;
reg                 reset_to;
wire                clk_pll;
wire                clk_cog;

wire         [31:0] pin_in = io;

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

//    
// Clock control
//

tim clkgen( .clk        (clock_160),
            .res        (~inp_resn),
            .cfg        (cfg[6:0]),
            .clk_pll    (clk_pll),
            .clk_cog    (clk_cog)
          );

//
// Propeller 1 core module
//

dig core (  .nres       (nres),
            .cfg        (cfg),
            .clk_cog    (clk_cog),
            .clk_pll    (clk_pll),
            .pin_in     (pin_in),
            .pin_out    (pin_out),
            .pin_dir    (pin_dir),
            .cog_led    (ledg) );

always @ (posedge clk_cog)
    nres <= inp_resn & !cfg[7];

//
// Bidir I/O buffers
//

genvar i;
generate
    for (i=0; i<32; i=i+1)
    begin : iogen
        assign io[i] = pin_dir[i] ? pin_out[i] : 1'bZ;
    end
endgenerate

endmodule
