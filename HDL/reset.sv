/*
-------------------------------------------------------------------------------
Simulated RC filter for reset

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


module              reset
(
input               clock_160,
input               async_res,

output reg          res
);

parameter DELAY_CYCLES = 32'd8_000_000; // 50ms

reg [31:0]          reset_cnt;
wire                out_res;

assign out_res = |reset_cnt;

always @(posedge clock_160)
    res <= out_res;
    
always @(posedge clock_160)
    if (async_res) begin
        reset_cnt <= DELAY_CYCLES;
    end else if (out_res) begin
        reset_cnt--;
    end
endmodule
