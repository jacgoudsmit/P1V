/*
-------------------------------------------------------------------------------
Top-level module for Digilent Nexys4 (Xilinx Artix-7 FPGA)

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


module              Nexys4
(
input  wire         CLK100MHZ,
output wire  [15:0] ledg,
input  wire  [15:0] switch,
input  wire         rts,
input  wire         reset,
output reg          ampSD,              // Even though some of these Nexys4 pins are technically for output only,
output reg          ampPWM,             // they are declared as inout so that output signals can feed back to the input pin bus
input  wire         uartTX,             // through the IOBUF, as per the original Propeller design.
output reg          uartRX,
inout  wire         PS2Clk,
inout  wire         PS2Data,
inout  wire   [7:0] pmodA,
inout  wire   [7:0] pmodB,
inout  wire   [7:0] pmodC,
inout  wire   [7:0] pmodD,
inout  wire   [1:0] vgaRed, vgaBlue, vgaGr,
inout  wire         vgaHS, vgaVS
);

parameter           NUMCOGS = 8;
parameter           INVERT_COG_LEDS = 0;

wire                clock_160;
wire                clk_cog;
wire                clk_pll;
wire                slow_clk;


//
// Clock generator
//


wire                inp_res;
reg                 propplug_reset;
reg                 usb_reset;
wire [7:0]          cfg;                                     // Config register output from Propeller core

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
    .clk_pll        (clk_pll),
    .slow_clk       (slow_clk)  
);


// Debounce toggle switch inputs to avoid thrashing pin assignments unnecessarily.
wire   [15:0]   switch_db;
Debounce sw_debounce (
    .clock  (slow_clk),
    .reset  (inp_res),
    .switch (switch),
    .switch_db (switch_db)
);


//
// Reset
//


reg                 nres;

reset reset_ (
    .clock          (slow_clk),
    .async_res      (~rts | ~reset),
    .res            (inp_res)
);

always @(posedge clk_cog)
    nres <= ~inp_res & !cfg[7];


//
// Propeller Input and Output busses
//


reg[31:0] pin_in;       // The actual input bus pins of the virtual propeller.
reg[31:0] pin_in_ext;   // Declaring this extra layer gives us a means to identify the external inputs cleanly at the multiplexer below.
wire[31:0] pin_out;
wire[31:0] pin_dir;

// Ensure that pins set as outputs have their values looped back to the pin input bus without the routing delay of traveling all the way to the IOBUF at the pad.
genvar loopback;
generate
    for (loopback = 0; loopback < 32; loopback++)
        always @(pin_dir, pin_out, pin_in_ext) begin
            if (pin_dir[loopback])
                pin_in[loopback] = pin_out[loopback];
            else
                pin_in[loopback] = pin_in_ext[loopback]; 
        end
endgenerate 


//
// Propeller 1 core module
//


dig #(
    .INVERT_COG_LEDS (INVERT_COG_LEDS),
    .NUMCOGS        (NUMCOGS)
) core (
            .nres       (nres),
            .cfg        (cfg),
            .clk_cog    (clk_cog),
            .clk_pll    (clk_pll),
            .pin_in     (pin_in),
            .pin_out    (pin_out),
            .pin_dir    (pin_dir),
            .cog_led    (ledg[7:0])
        );
        

//-----------------------------------------------------------------------------------------------
// By default, emulate Propeller Demo Board behavior and pin assignments with onboard peripherals
//-----------------------------------------------------------------------------------------------

// Pins 0 through 7 go to pmodA 0-7 (i.e. breadboard on demo board.)
assign pin_in_ext[7:0] = pmodA[7:0];
genvar pmodAPin;
generate
    for (pmodAPin = 0; pmodAPin < 8; pmodAPin++)
        assign pmodA[pmodAPin] = pin_dir[pmodAPin] ? pin_out[pmodAPin] : 1'bZ;
endgenerate

//Turn on audio amplifier power when PWM output on Pin 10 is set to output direction, by default.
//When switch 14 is on, pin 10 is redirected to pmodB[1] for in or out, and ampSD is off.

reg pmodB_out_1;
assign pmodB[1] = pmodB_out_1;

always @(switch_db[14], pin_dir[10], pin_out[10], pmodB[1], ampPWM) begin
    if (~switch_db[14]) begin
        ampSD = pin_dir[10];  //Turn on audio amplifier if switch 14 is off (default) and pin 10 is set as an output.
        ampPWM = pin_dir[10] ? pin_out[10] : 1'bZ;     // Also treat pin 10 as PWM audio out in that case.
        pmodB_out_1 = 1'bZ;
        pin_in_ext[10] = ampPWM;
    end else begin
        ampSD = 1'bZ;
        ampPWM = 1'bZ;
        pmodB_out_1 = pin_dir[10] ? pin_out[10] : 1'bZ;
        pin_in_ext[10] = pmodB[1];                             // Use pmodB[1] as pin10 input.
    end 
end


// Multiplex the prop pins 30 and 31 to a Propeller Plug, either via USB UART (no plug needed), or PMOD D based on SW15 position.
reg [7:0] pmodD_out;
assign pmodD[3:2] = pmodD_out[3:2];
assign pmodD[7] = pin_dir[28] ? pin_out[28] : 1'bZ;    // pmodD[7] always used as pin 28 (SCL) to accomodate external EEPROM
assign pmodD[6] = pin_dir[29] ? pin_out[29] : 1'bZ;    // pmodD[6] always used as pin 29 (SDA) to accomodate external EEPROM 
assign pin_in_ext[29] = pmodD[6];                      // pin 29 gets input from pmodD[6] for I2C bus
assign pin_in_ext[28] = pmodD[7];                      // pin 28 gets input from pmodD[7] for I2C bus

always @(switch_db[15], uartTX, pin_out[31:29], pin_dir[31:29], pmodD[3:1], rts) begin
    if (~switch_db[15]) begin
        //Switch low (default - use USB UART)
        uartRX = pin_out[30];                               // Transmit out to UART RX
        usb_reset = rts;                                    // USB reset the propeller from UART RTS
        propplug_reset = 1'b1;                              // Tie the prop plug active low reset signal to 1, it's not connected.
        pin_in_ext[31] = uartTX;                            // Pin31 gets input from USB UART or pmodD[6] based on switch
        pin_in_ext[30] = ~pin_dir[30] ? pmodD[2] : pin_out[30]; // Allow input on pmodD[3] as pin 30 when no prop plug.
        pmodD_out[3] = pin_dir[31] ? pin_out[31] : 1'bZ;    // pmodD[4] becomes pin 31 output (when direction is output) if no prop plug is expected.
        pmodD_out[2] = pin_dir[30] ? pin_out[30] : 1'bZ;    // pmodD[3] becomes pin 30 output (when direction is output) if no prop plug is expected.
    end else begin
        //Switch high - use real Propeller Plug on pmodD pins 10-8 (bits 7-5)
        uartRX = 1'bZ;                                                  // Disconnect USB UART
        usb_reset = 1'b1;                                               // USB UART reset disabled when switch high.
        propplug_reset = pmodD[3];                                      // In from prop plug reset line
        pin_in_ext[31] = pmodD[2];                                      // Connect pin31 to Prop Plug on pmodD
        pin_in_ext[30] = ~pin_dir[30] ? pmodD[1] : pin_out[30];         // Pin 30 input comes from pmodD[1] so prop plug can receive data.
        pmodD_out[3] = 1'bZ;                                            // Used as reset input when prop plug is in place, must high-Z the output
        pmodD_out[2] = 1'bZ;                                            // Used as data input for prop plug, so high-Z the output.
    end
end


// VGA outputs for Nexys4 are assigned to prop pins to match the original Propeller 1 Demo Board
reg [7:0] pmodC_out;                                                  // Required for procedural assignment, doesn't actually synth to flops.
reg [1:0] vgaBlue_out, vgaRed_out, vgaGr_out;
reg vgaVS_out, vgaHS_out;
assign pmodC = pmodC_out;
assign vgaVS = vgaVS_out;
assign vgaHS = vgaHS_out;
assign vgaBlue = vgaBlue_out;
assign vgaGr = vgaGr_out;
assign vgaRed = vgaRed_out;

always @(switch_db[13], pin_dir[23:16], pin_out[23:16], pin_in_ext[23:16], pmodC,
            vgaHS, vgaVS, vgaBlue, vgaGr, vgaRed)                     // When switch 13 is low, use onboard VGA output for pins 16-23 
    if (~switch_db[13]) begin
         vgaVS_out = pin_dir[16] ? pin_out[16] : 1'bZ;                // Vertical sync
         vgaHS_out = pin_dir[17] ? pin_out[17] : 1'bZ;                // Horizontal sync
         vgaBlue_out[0] = pin_dir[18] ? pin_out[18] : 1'bZ;           // Blue lsb
         vgaBlue_out[1] = pin_dir[19] ? pin_out[19] : 1'bZ;           // Blue msb
         vgaGr_out[0] = pin_dir[20] ? pin_out[20] : 1'bZ;             // Green lsb
         vgaGr_out[1] = pin_dir[21] ? pin_out[21] : 1'bZ;             // Green msb
         vgaRed_out[0] = pin_dir[22] ? pin_out[22] : 1'bZ;            // Red lsb
         vgaRed_out[1] = pin_dir[23] ? pin_out[23] : 1'bZ;            // Red msb
         pmodC_out[7:0] = 8'bZZZZZZZZ;                                // Tristate pmodC pins.
         pin_in_ext[16] = vgaVS;                                          // \
         pin_in_ext[17] = vgaHS;                                          // |
         pin_in_ext[18] = vgaBlue[0];                                     // |
         pin_in_ext[19] = vgaBlue[1];                                     // |
         pin_in_ext[20] = vgaGr[0];                                       // Ensure loopback from pins_out to pins_in.
         pin_in_ext[21] = vgaGr[1];                                       // |
         pin_in_ext[22] = vgaRed[0];                                      // |
         pin_in_ext[23] = vgaRed[1];                                      // /
    end 
    else begin
         vgaVS_out = 1'bZ;                                            // Switch 13 high: Don't use the VGA onboard, use pmodC as pins 16-23.
         vgaHS_out = 1'bZ;                        
         vgaBlue_out = 2'bZ;
         vgaGr_out = 2'bZ;
         vgaRed_out = 2'bZ;
         pmodC_out[0] = pin_dir[16] ? pin_out[16] : 1'bZ;
         pmodC_out[1] = pin_dir[17] ? pin_out[17] : 1'bZ;
         pmodC_out[2] = pin_dir[18] ? pin_out[18] : 1'bZ;
         pmodC_out[3] = pin_dir[19] ? pin_out[19] : 1'bZ;
         pmodC_out[4] = pin_dir[20] ? pin_out[20] : 1'bZ;
         pmodC_out[5] = pin_dir[21] ? pin_out[21] : 1'bZ;
         pmodC_out[6] = pin_dir[22] ? pin_out[22] : 1'bZ;
         pmodC_out[7] = pin_dir[23] ? pin_out[23] : 1'bZ;
         pin_in_ext[23:16] = pmodC[7:0];
    end
    
// LEDs 8-15 emulate the Propeller Demo board, in that they are connected to the same Propeller pins as the VGA jack (P16-P23)
genvar led;
generate
    for (led = 8; led < 16; led++)
        assign ledg[led] = pin_dir[led+8] ? pin_out[led+8] : 1'bZ;
endgenerate

// Connect emulated PS2 mouse/keyboard port to pins 24/25, or 26/27 based on switch 12.
// Demo board uses 24/25 as a mouse, 26/27 as a keyboard, but there's only one emulated device on the Nexys4 from a USB host controller.
reg PS2Data_out, PS2Clk_out;
assign PS2Data = PS2Data_out;
assign PS2Clk = PS2Clk_out;
assign pmodD[3:0] = pmodD_out[3:0];

always @(switch_db[12], pin_dir[27:24], pin_out[27:24], PS2Data, PS2Clk, pmodD[3:0]) begin
  if (~switch_db[12]) begin
    PS2Data_out = pin_dir[24] ? pin_out[24] : 1'bZ;
    PS2Clk_out  = pin_dir[25] ? pin_out[25] : 1'bZ;
    pin_in_ext[24] = PS2Data;
    pin_in_ext[25] = PS2Clk;
    pin_in_ext[26] = pmodD[2];
    pin_in_ext[27] = pmodD[3];
    pmodD_out[1:0] = 2'bZZ;
    pmodD_out[2] = pin_dir[26] ? pin_out[26] : 1'bZ;
    pmodD_out[3] = pin_dir[27] ? pin_out[27] : 1'bZ;
  end else begin
    PS2Data_out = 1'bZ;
    PS2Clk_out  = 1'bZ;
    pin_in_ext[24] = pmodD[0];
    pin_in_ext[25] = pmodD[1];
    pin_in_ext[26] = PS2Data;
    pin_in_ext[27] = PS2Clk;
    pmodD_out[0] = pin_dir[24] ? pin_out[24] : 1'bZ;
    pmodD_out[1] = pin_dir[25] ? pin_out[25] : 1'bZ;
    pmodD_out[3:2] = 2'bZZ;
  end    
end

endmodule