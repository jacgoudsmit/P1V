/*
-------------------------------------------------------------------------------
DE2 - Top-level file for the DE2 target.

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

// This file was based on the DE2_TOP.v file that's included on the CD-ROM that came with the DE2.

module DE2
(

////////////////////////    Clock Input     ////////////////////////
input           CLOCK_27,               //  27 MHz
input           CLOCK_50,               //  50 MHz
input           EXT_CLOCK,              //  External Clock
////////////////////////    Push Button     ////////////////////////
input   [3:0]   KEY,                    //  Pushbutton[3:0]
////////////////////////    DPDT Switch     ////////////////////////
input   [17:0]  SW,                     //  Toggle Switch[17:0]
////////////////////////    7-SEG Dispaly   ////////////////////////
output  [6:0]   HEX0,                   //  Seven Segment Digit 0
output  [6:0]   HEX1,                   //  Seven Segment Digit 1
output  [6:0]   HEX2,                   //  Seven Segment Digit 2
output  [6:0]   HEX3,                   //  Seven Segment Digit 3
output  [6:0]   HEX4,                   //  Seven Segment Digit 4
output  [6:0]   HEX5,                   //  Seven Segment Digit 5
output  [6:0]   HEX6,                   //  Seven Segment Digit 6
output  [6:0]   HEX7,                   //  Seven Segment Digit 7
////////////////////////////    LED     ////////////////////////////
output  [8:0]   LEDG,                   //  LED Green[8:0]
output  [17:0]  LEDR,                   //  LED Red[17:0]
////////////////////////////    UART    ////////////////////////////
output          UART_TXD,               //  UART Transmitter
input           UART_RXD,               //  UART Receiver
////////////////////////////    IRDA    ////////////////////////////
output          IRDA_TXD,               //  IRDA Transmitter
input           IRDA_RXD,               //  IRDA Receiver
///////////////////////     SDRAM Interface ////////////////////////
inout   [15:0]  DRAM_DQ,                //  SDRAM Data bus 16 Bits
output  [11:0]  DRAM_ADDR,              //  SDRAM Address bus 12 Bits
output          DRAM_LDQM,              //  SDRAM Low-byte Data Mask 
output          DRAM_UDQM,              //  SDRAM High-byte Data Mask
output          DRAM_WE_N,              //  SDRAM Write Enable
output          DRAM_CAS_N,             //  SDRAM Column Address Strobe
output          DRAM_RAS_N,             //  SDRAM Row Address Strobe
output          DRAM_CS_N,              //  SDRAM Chip Select
output          DRAM_BA_0,              //  SDRAM Bank Address 0
output          DRAM_BA_1,              //  SDRAM Bank Address 0
output          DRAM_CLK,               //  SDRAM Clock
output          DRAM_CKE,               //  SDRAM Clock Enable
////////////////////////    Flash Interface ////////////////////////
inout   [7:0]   FL_DQ,                  //  FLASH Data bus 8 Bits
output  [21:0]  FL_ADDR,                //  FLASH Address bus 22 Bits
output          FL_WE_N,                //  FLASH Write Enable
output          FL_RST_N,               //  FLASH Reset
output          FL_OE_N,                //  FLASH Output Enable
output          FL_CE_N,                //  FLASH Chip Enable
////////////////////////    SRAM Interface  ////////////////////////
inout   [15:0]  SRAM_DQ,                //  SRAM Data bus 16 Bits
output  [17:0]  SRAM_ADDR,              //  SRAM Address bus 18 Bits
output          SRAM_UB_N,              //  SRAM High-byte Data Mask 
output          SRAM_LB_N,              //  SRAM Low-byte Data Mask 
output          SRAM_WE_N,              //  SRAM Write Enable
output          SRAM_CE_N,              //  SRAM Chip Enable
output          SRAM_OE_N,              //  SRAM Output Enable
////////////////////    ISP1362 Interface   ////////////////////////
inout   [15:0]  OTG_DATA,               //  ISP1362 Data bus 16 Bits
output  [1:0]   OTG_ADDR,               //  ISP1362 Address 2 Bits
output          OTG_CS_N,               //  ISP1362 Chip Select
output          OTG_RD_N,               //  ISP1362 Write
output          OTG_WR_N,               //  ISP1362 Read
output          OTG_RST_N,              //  ISP1362 Reset
output          OTG_FSPEED,             //  USB Full Speed, 0 = Enable, Z = Disable
output          OTG_LSPEED,             //  USB Low Speed,  0 = Enable, Z = Disable
input           OTG_INT0,               //  ISP1362 Interrupt 0
input           OTG_INT1,               //  ISP1362 Interrupt 1
input           OTG_DREQ0,              //  ISP1362 DMA Request 0
input           OTG_DREQ1,              //  ISP1362 DMA Request 1
output          OTG_DACK0_N,            //  ISP1362 DMA Acknowledge 0
output          OTG_DACK1_N,            //  ISP1362 DMA Acknowledge 1
////////////////////    LCD Module 16X2 ////////////////////////////
inout   [7:0]   LCD_DATA,               //  LCD Data bus 8 bits
output          LCD_ON,                 //  LCD Power ON/OFF
output          LCD_BLON,               //  LCD Back Light ON/OFF
output          LCD_RW,                 //  LCD Read/Write Select, 0 = Write, 1 = Read
output          LCD_EN,                 //  LCD Enable
output          LCD_RS,                 //  LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////    SD Card Interface   ////////////////////////
inout           SD_DAT,                 //  SD Card Data
inout           SD_DAT3,                //  SD Card Data 3
inout           SD_CMD,                 //  SD Card Command Signal
output          SD_CLK,                 //  SD Card Clock
////////////////////////    I2C     ////////////////////////////////
inout           I2C_SDAT,               //  I2C Data
output          I2C_SCLK,               //  I2C Clock
////////////////////////    PS2     ////////////////////////////////
input           PS2_DAT,                //  PS2 Data
input           PS2_CLK,                //  PS2 Clock
////////////////////    USB JTAG link   ////////////////////////////
input           TDI,                    // CPLD -> FPGA (data in)
input           TCK,                    // CPLD -> FPGA (clk)
input           TCS,                    // CPLD -> FPGA (CS)
output          TDO,                    // FPGA -> CPLD (data out)
////////////////////////    VGA         ////////////////////////////
output          VGA_CLK,                //  VGA Clock
output          VGA_HS,                 //  VGA H_SYNC
output          VGA_VS,                 //  VGA V_SYNC
output          VGA_BLANK,              //  VGA BLANK
output          VGA_SYNC,               //  VGA SYNC
output  [9:0]   VGA_R,                  //  VGA Red[9:0]
output  [9:0]   VGA_G,                  //  VGA Green[9:0]
output  [9:0]   VGA_B,                  //  VGA Blue[9:0]
////////////////    Ethernet Interface  ////////////////////////////
inout   [15:0]  ENET_DATA,              //  DM9000A DATA bus 16Bits
output          ENET_CMD,               //  DM9000A Command/Data Select, 0 = Command, 1 = Data
output          ENET_CS_N,              //  DM9000A Chip Select
output          ENET_WR_N,              //  DM9000A Write
output          ENET_RD_N,              //  DM9000A Read
output          ENET_RST_N,             //  DM9000A Reset
input           ENET_INT,               //  DM9000A Interrupt
output          ENET_CLK,               //  DM9000A Clock 25 MHz
////////////////////    Audio CODEC     ////////////////////////////
inout           AUD_ADCLRCK,            //  Audio CODEC ADC LR Clock
input           AUD_ADCDAT,             //  Audio CODEC ADC Data
inout           AUD_DACLRCK,            //  Audio CODEC DAC LR Clock
output          AUD_DACDAT,             //  Audio CODEC DAC Data
inout           AUD_BCLK,               //  Audio CODEC Bit-Stream Clock
output          AUD_XCK,                //  Audio CODEC Chip Clock
////////////////////    TV Devoder      ////////////////////////////
input   [7:0]   TD_DATA,                //  TV Decoder Data bus 8 bits
input           TD_HS,                  //  TV Decoder H_SYNC
input           TD_VS,                  //  TV Decoder V_SYNC
output          TD_RESET,               //  TV Decoder Reset
////////////////////////    GPIO    ////////////////////////////////
inout   [35:0]  GPIO_0,                 //  GPIO Connection 0
inout   [35:0]  GPIO_1                  //  GPIO Connection 1
);

//
// Map the Propeller pins to match the picture in the documentation
//


wire                pin_resn;
wire         [31:0] pin_in;
wire         [31:0] pin_out;
wire         [31:0] pin_dir;

// I/O pins except 31 and 30
genvar i;
generate
    for (i = 0; i < 30; i++)
    begin : map_pin
        assign pin_in[i] = GPIO_1[33 - i];
        assign GPIO_1[33 - i] = pin_dir[i] ? pin_out[i] : 1'bz;
    end
endgenerate

// Prop plug attaches here
assign pin_resn     = GPIO_0[25];
assign pin_in[31]   = GPIO_0[27];
assign pin_in[30]   = GPIO_0[29];
assign GPIO_0[27]   = pin_dir[31] ? pin_out[31] : 1'bZ;
assign GPIO_0[29]   = pin_dir[30] ? pin_out[30] : 1'bZ;


//
// Clock generator for Altera FPGA's
//


wire clock_160;

altera altera_(
    .clock_50 (CLOCK_50),
    .clock_160 (clock_160)
);


//
// Reset
//


wire                inp_resn;
wire                res;

// generate a 50ms pulse from the button
reset reset_ (
    .clock_160      (clock_160),
    .async_res      (KEY[0]),
    .res            (res)
);

// The reset that comes from the reset pin doesn't have to be
// extended or debounced; the Prop Plug takes care of that.
// Mix the reset input for the P1V here.
assign inp_resn = !res & pin_resn;


//
// Virtual Propeller
//


p1v p1v_(
    .clock_160      (clock_160),
    .inp_resn       (inp_resn),
    .ledg           (LEDG[7:0]),
    .pin_out        (pin_out),
    .pin_in         (pin_in),
    .pin_dir        (pin_dir)
);


endmodule