# Arty.xdc

# The contents of this file are based on https://github.com/Digilent/Arty/blob/27bcb857011cf3e7254f870f8e1a6d3683c6f41c/Resources/XDC/Arty_Master.xdc 
# This file is licensed under the following license: CC Attribution-Noncommercial-Share Alike 3.0 Unported http://creativecommons.org/licenses/by-nc-sa/3.0/

## This file is a general .xdc for the ARTY Rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock signal

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { CLK100MHZ }];

##Switches

set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
#set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]
#set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; #IO_L13N_T2_MRCC_16 Sch=sw[2]
#set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; #IO_L14P_T2_SRCC_16 Sch=sw[3]

##RGB LEDs

#set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led0_b }]; #IO_L18N_T2_35 Sch=led0_b
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { led0_g }]; #IO_L19N_T3_VREF_35 Sch=led0_g
#set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { led0_r }]; #IO_L19P_T3_35 Sch=led0_r
#set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { led1_b }]; #IO_L20P_T3_35 Sch=led1_b
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { led1_g }]; #IO_L21P_T3_DQS_35 Sch=led1_g
#set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { led1_r }]; #IO_L20N_T3_35 Sch=led1_r
#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { led2_b }]; #IO_L21N_T3_DQS_35 Sch=led2_b
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { led2_g }]; #IO_L22N_T3_35 Sch=led2_g
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { led2_r }]; #IO_L22P_T3_35 Sch=led2_r
#set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { led3_b }]; #IO_L23P_T3_35 Sch=led3_b
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { led3_g }]; #IO_L24P_T3_35 Sch=led3_g
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { led3_r }]; #IO_L23N_T3_35 Sch=led3_r

##LEDs

set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L24N_T3_35 Sch=led[4]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_25_35 Sch=led[5]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #IO_L24P_T3_A01_D17_14 Sch=led[6]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #IO_L24N_T3_A00_D16_14 Sch=led[7]

##Buttons

#set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; #IO_L6N_T0_VREF_16 Sch=btn[0]
#set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; #IO_L11P_T1_SRCC_16 Sch=btn[1]
#set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; #IO_L11N_T1_SRCC_16 Sch=btn[2]
#set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; #IO_L12P_T1_MRCC_16 Sch=btn[3]

##Pmod Header JA

set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { ja[0] }]; #IO_0_15 Sch=ja[1]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { ja[1] }]; #IO_L4P_T0_15 Sch=ja[2]
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { ja[2] }]; #IO_L4N_T0_15 Sch=ja[3]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { ja[3] }]; #IO_L6P_T0_15 Sch=ja[4]
set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { ja[4] }]; #IO_L6N_T0_VREF_15 Sch=ja[7]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { ja[5] }]; #IO_L10P_T1_AD11P_15 Sch=ja[8]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { ja[6] }]; #IO_L10N_T1_AD11N_15 Sch=ja[9]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { ja[7] }]; #IO_25_15 Sch=ja[10]

##Pmod Header JB

set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { jb[0] }]; #IO_L11P_T1_SRCC_15 Sch=jb_p[1]
set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { jb[1] }]; #IO_L11N_T1_SRCC_15 Sch=jb_n[1]
set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { jb[2] }]; #IO_L12P_T1_MRCC_15 Sch=jb_p[2]
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { jb[3] }]; #IO_L12N_T1_MRCC_15 Sch=jb_n[2]
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { jb[4] }]; #IO_L23P_T3_FOE_B_15 Sch=jb_p[3]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { jb[5] }]; #IO_L23N_T3_FWE_B_15 Sch=jb_n[3]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { jb[6] }]; #IO_L24P_T3_RS1_15 Sch=jb_p[4]
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { jb[7] }]; #IO_L24N_T3_RS0_15 Sch=jb_n[4]

##Pmod Header JC

set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { jc[0] }]; #IO_L20P_T3_A08_D24_14 Sch=jc_p[1]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { jc[1] }]; #IO_L20N_T3_A07_D23_14 Sch=jc_n[1]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { jc[2] }]; #IO_L21P_T3_DQS_14 Sch=jc_p[2]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { jc[3] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=jc_n[2]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { jc[4] }]; #IO_L22P_T3_A05_D21_14 Sch=jc_p[3]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { jc[5] }]; #IO_L22N_T3_A04_D20_14 Sch=jc_n[3]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { jc[6] }]; #IO_L23P_T3_A03_D19_14 Sch=jc_p[4]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { jc[7] }]; #IO_L23N_T3_A02_D18_14 Sch=jc_n[4]

##Pmod Header JD

set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { jd[0] }]; #IO_L11N_T1_SRCC_35 Sch=jd[1]
set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { jd[1] }]; #IO_L12N_T1_MRCC_35 Sch=jd[2]
set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { jd[2] }]; #IO_L13P_T2_MRCC_35 Sch=jd[3]
set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { jd[3] }]; #IO_L13N_T2_MRCC_35 Sch=jd[4]
set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { jd[4] }]; #IO_L14P_T2_SRCC_35 Sch=jd[7]
set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { jd[5] }]; #IO_L14N_T2_SRCC_35 Sch=jd[8]
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { jd[6] }]; #IO_L15P_T2_DQS_35 Sch=jd[9]
set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { jd[7] }]; #IO_L15N_T2_DQS_35 Sch=jd[10]

##USB-UART Interface

set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { uart_rxd_out }]; #IO_L19N_T3_VREF_16 Sch=uart_rxd_out
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { uart_txd_in }]; #IO_L14N_T2_SRCC_16 Sch=uart_txd_in

##ChipKit Single Ended Analog Inputs
##NOTE: The ck_an_p pins can be used as single ended analog inputs with voltages from 0-3.3V (Chipkit Analog pins A0-A5). 
##      These signals should only be connected to the XADC core. When using these pins as digital I/O, use pins ck_io[14-19].

#set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[0] }]; #IO_L1N_T0_AD4N_35 Sch=ck_an_n[0]
#set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[0] }]; #IO_L1P_T0_AD4P_35 Sch=ck_an_p[0]
#set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=ck_an_n[1]
#set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[1] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=ck_an_p[1]
#set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[2] }]; #IO_L7N_T1_AD6N_35 Sch=ck_an_n[2]
#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[2] }]; #IO_L7P_T1_AD6P_35 Sch=ck_an_p[2]
#set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[3] }]; #IO_L9N_T1_DQS_AD7N_35 Sch=ck_an_n[3]
#set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[3] }]; #IO_L9P_T1_DQS_AD7P_35 Sch=ck_an_p[3]
#set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[4] }]; #IO_L10N_T1_AD15N_35 Sch=ck_an_n[4]
#set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[4] }]; #IO_L10P_T1_AD15P_35 Sch=ck_an_p[4]
#set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { ck_an_n[5] }]; #IO_L1N_T0_AD0N_15 Sch=ck_an_n[5]
#set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { ck_an_p[5] }]; #IO_L1P_T0_AD0P_15 Sch=ck_an_p[5]

##ChipKit Digital I/O Low

#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { ck_io[0] }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0]
#set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[1] }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1]
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { ck_io[2] }]; #IO_L8N_T1_D12_14 Sch=ck_io[2]
#set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { ck_io[3] }]; #IO_L19P_T3_A10_D26_14 Sch=ck_io[3]
#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { ck_io[4] }]; #IO_L5P_T0_D06_14 Sch=ck_io[4]
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { ck_io[5] }]; #IO_L14P_T2_SRCC_14 Sch=ck_io[5]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { ck_io[6] }]; #IO_L14N_T2_SRCC_14 Sch=ck_io[6]
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[7] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=ck_io[7]
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { ck_io[8] }]; #IO_L11P_T1_SRCC_14 Sch=ck_io[8]
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[9] }]; #IO_L10P_T1_D14_14 Sch=ck_io[9]
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { ck_io[10] }]; #IO_L18N_T2_A11_D27_14 Sch=ck_io[10]
#set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { ck_io[11] }]; #IO_L17N_T2_A13_D29_14 Sch=ck_io[11]
#set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { ck_io[12] }]; #IO_L12N_T1_MRCC_14 Sch=ck_io[12]
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { ck_io[13] }]; #IO_L12P_T1_MRCC_14 Sch=ck_io[13]

##ChipKit Digital I/O On Outer Analog Header
##NOTE: These pins should be used when using the analog header signals A0-A5 as digital I/O (Chipkit digital pins 14-19)

#set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { ck_io[14] }]; #IO_0_35 Sch=ck_a[0]
#set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { ck_io[15] }]; #IO_L4P_T0_35 Sch=ck_a[1]
#set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { ck_io[16] }]; #IO_L4N_T0_35 Sch=ck_a[2]
#set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { ck_io[17] }]; #IO_L6P_T0_35 Sch=ck_a[3]
#set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { ck_io[18] }]; #IO_L6N_T0_VREF_35 Sch=ck_a[4]
#set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ck_io[19] }]; #IO_L11P_T1_SRCC_35 Sch=ck_a[5]

##ChipKit Digital I/O On Inner Analog Header
##NOTE: These pins will need to be connected to the XADC core when used as differential analog inputs (Chipkit analog pins A6-A11)

#set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { ck_io[20] }]; #IO_L2P_T0_AD12P_35 Sch=ad_p[12]
#set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { ck_io[21] }]; #IO_L2N_T0_AD12N_35 Sch=ad_n[12]
#set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { ck_io[22] }]; #IO_L5P_T0_AD13P_35 Sch=ad_p[13]
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { ck_io[23] }]; #IO_L5N_T0_AD13N_35 Sch=ad_n[13]
#set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { ck_io[24] }]; #IO_L8P_T1_AD14P_35 Sch=ad_p[14]
#set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { ck_io[25] }]; #IO_L8N_T1_AD14N_35 Sch=ad_n[14]

##ChipKit Digital I/O High

#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { ck_io[26] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=ck_io[26]
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[27] }]; #IO_L16N_T2_A15_D31_14 Sch=ck_io[27]
#set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { ck_io[28] }]; #IO_L6N_T0_D08_VREF_14 Sch=ck_io[28]
#set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { ck_io[29] }]; #IO_25_14 Sch=ck_io[29]
#set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { ck_io[30] }]; #IO_0_14 Sch=ck_io[30]
#set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { ck_io[31] }]; #IO_L5N_T0_D07_14 Sch=ck_io[31]
#set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { ck_io[32] }]; #IO_L13N_T2_MRCC_14 Sch=ck_io[32]
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { ck_io[33] }]; #IO_L13P_T2_MRCC_14 Sch=ck_io[33]
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[34] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=ck_io[34]
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { ck_io[35] }]; #IO_L11N_T1_SRCC_14 Sch=ck_io[35]
#set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { ck_io[36] }]; #IO_L8P_T1_D11_14 Sch=ck_io[36]
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { ck_io[37] }]; #IO_L17P_T2_A14_D30_14 Sch=ck_io[37]
#set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { ck_io[38] }]; #IO_L7N_T1_D10_14 Sch=ck_io[38]
#set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { ck_io[39] }]; #IO_L7P_T1_D09_14 Sch=ck_io[39]
#set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { ck_io[40] }]; #IO_L9N_T1_DQS_D13_14 Sch=ck_io[40]
#set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { ck_io[41] }]; #IO_L9P_T1_DQS_14 Sch=ck_io[41]

## ChipKit SPI

#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { ck_miso }]; #IO_L17N_T2_35 Sch=ck_miso
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { ck_mosi }]; #IO_L17P_T2_35 Sch=ck_mosi
#set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { ck_sck }]; #IO_L18P_T2_35 Sch=ck_sck
#set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { ck_ss }]; #IO_L16N_T2_35 Sch=ck_ss

## ChipKit I2C

#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { ck_scl }]; #IO_L4P_T0_D04_14 Sch=ck_scl
#set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { ck_sda }]; #IO_L4N_T0_D05_14 Sch=ck_sda
#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { scl_pup }]; #IO_L9N_T1_DQS_AD3N_15 Sch=scl_pup
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { sda_pup }]; #IO_L9P_T1_DQS_AD3P_15 Sch=sda_pup

##Misc. ChipKit signals

#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { ck_ioa }]; #IO_L10N_T1_D15_14 Sch=ck_ioa
set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { ck_rst }]; #IO_L16P_T2_35 Sch=ck_rst

##SMSC Ethernet PHY

#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { eth_col }]; #IO_L16N_T2_A27_15 Sch=eth_col
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { eth_crs }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=eth_crs
#set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { eth_mdc }]; #IO_L14N_T2_SRCC_15 Sch=eth_mdc
#set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { eth_mdio }]; #IO_L17P_T2_A26_15 Sch=eth_mdio
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { eth_ref_clk }]; #IO_L22P_T3_A17_15 Sch=eth_ref_clk
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { eth_rstn }]; #IO_L20P_T3_A20_15 Sch=eth_rstn
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { eth_rx_clk }]; #IO_L14P_T2_SRCC_15 Sch=eth_rx_clk
#set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { eth_rx_dv }]; #IO_L13N_T2_MRCC_15 Sch=eth_rx_dv
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { eth_rxd[0] }]; #IO_L21N_T3_DQS_A18_15 Sch=eth_rxd[0]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { eth_rxd[1] }]; #IO_L16P_T2_A28_15 Sch=eth_rxd[1]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { eth_rxd[2] }]; #IO_L21P_T3_DQS_15 Sch=eth_rxd[2]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { eth_rxd[3] }]; #IO_L18N_T2_A23_15 Sch=eth_rxd[3]
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { eth_rxerr }]; #IO_L20N_T3_A19_15 Sch=eth_rxerr
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { eth_tx_clk }]; #IO_L13P_T2_MRCC_15 Sch=eth_tx_clk
#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { eth_tx_en }]; #IO_L19N_T3_A21_VREF_15 Sch=eth_tx_en
#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { eth_txd[0] }]; #IO_L15P_T2_DQS_15 Sch=eth_txd[0]
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { eth_txd[1] }]; #IO_L19P_T3_A22_15 Sch=eth_txd[1]
#set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { eth_txd[2] }]; #IO_L17N_T2_A25_15 Sch=eth_txd[2]
#set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { eth_txd[3] }]; #IO_L18P_T2_A24_15 Sch=eth_txd[3]

##Quad SPI Flash

#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { qspi_cs }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_cs
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { qspi_dq[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]

##Power Measurements 

#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33     } [get_ports { vsnsvu_n }]; #IO_L7N_T1_AD2N_15 Sch=ad_n[2]
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33     } [get_ports { vsnsvu_p }]; #IO_L7P_T1_AD2P_15 Sch=ad_p[2]
#set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33     } [get_ports { vsns5v0_n }]; #IO_L3N_T0_DQS_AD1N_15 Sch=ad_n[1]
#set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33     } [get_ports { vsns5v0_p }]; #IO_L3P_T0_DQS_AD1P_15 Sch=ad_p[1]
#set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33     } [get_ports { isns5v0_n }]; #IO_L5N_T0_AD9N_15 Sch=ad_n[9]
#set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33     } [get_ports { isns5v0_p }]; #IO_L5P_T0_AD9P_15 Sch=ad_p[9]
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33     } [get_ports { isns0v95_n }]; #IO_L8N_T1_AD10N_15 Sch=ad_n[10]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33     } [get_ports { isns0v95_p }]; #IO_L8P_T1_AD10P_15 Sch=ad_p[10]

#--------------------------------------------------------------------------------------------------------------------
## P1V specific timing constraints

# Most of the propeller clocks are inferred from the 100Mhz input clock and the MMCM. However, there is an RCSLOW mode of only
# ~19.5Khz generated by dividing down the 5MHz clock output.  We need to tell the timing analyzer about this.
create_generated_clock -name rcslow -source [get_pins xilinx_clock_/genclock/CLKOUT5] -divide_by 256 [get_pins {xilinx_clock_/divide_reg[6]/Q}]

# Tell the timing analyzer that the various clock modes of the prop (<= 80Mhz) cannot all be in use at the same time, don't waste timing checking for those interactions.
set_clock_groups -name clkpll_taps -logically_exclusive -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT5]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT4]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT3]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT2]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] -group [get_clocks rcslow]

# PLLs can run up to 128Mhz per spec and so CLKOUT6 is set to generate 128MHz.
# Each tap is logically exclusive (cannot be selected at the same time as) the others on the same PLL, so we don't want timing analysis to waste effort looking for interactions.
# Further, all PLL logic trees need to be treated as asynchronous from each other and the rest of the design.

# Input and output delay
set_output_delay -clock [get_clocks *rcslow*] 0.000 [get_ports -filter {NAME =~  "led*"}]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] 0.000 [get_ports ja]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] 0.000 [get_ports jb]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] 0.000 [get_ports jc]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] 0.000 [get_ports jd]

## PLLA (i.e. CTRA), 8 taps, per cog.
create_generated_clock -name plla0_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla0_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla0_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla0_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla0_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla0_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla0_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla0_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[0].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll0_exclusive -logically_exclusive -group [get_clocks plla0_1] -group [get_clocks plla0_2] -group [get_clocks plla0_3] -group [get_clocks plla0_4] -group [get_clocks plla0_5] -group [get_clocks plla0_6] -group [get_clocks plla0_7] -group [get_clocks plla0_8]

create_generated_clock -name plla1_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla1_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla1_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla1_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla1_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla1_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla1_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla1_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[1].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll1_exclusive -logically_exclusive -group [get_clocks plla1_1] -group [get_clocks plla1_2] -group [get_clocks plla1_3] -group [get_clocks plla1_4] -group [get_clocks plla1_5] -group [get_clocks plla1_6] -group [get_clocks plla1_7] -group [get_clocks plla1_8]

create_generated_clock -name plla2_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla2_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla2_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla2_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla2_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla2_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla2_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla2_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[2].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll2_exclusive -logically_exclusive -group [get_clocks plla2_1] -group [get_clocks plla2_2] -group [get_clocks plla2_3] -group [get_clocks plla2_4] -group [get_clocks plla2_5] -group [get_clocks plla2_6] -group [get_clocks plla2_7] -group [get_clocks plla2_8]

create_generated_clock -name plla3_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla3_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla3_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla3_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla3_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla3_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla3_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla3_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[3].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll3_exclusive -logically_exclusive -group [get_clocks plla3_1] -group [get_clocks plla3_2] -group [get_clocks plla3_3] -group [get_clocks plla3_4] -group [get_clocks plla3_5] -group [get_clocks plla3_6] -group [get_clocks plla3_7] -group [get_clocks plla3_8]

create_generated_clock -name plla4_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla4_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla4_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla4_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla4_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla4_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla4_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla4_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[4].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll4_exclusive -logically_exclusive -group [get_clocks plla4_1] -group [get_clocks plla4_2] -group [get_clocks plla4_3] -group [get_clocks plla4_4] -group [get_clocks plla4_5] -group [get_clocks plla4_6] -group [get_clocks plla4_7] -group [get_clocks plla4_8]

create_generated_clock -name plla5_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla5_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla5_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla5_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla5_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla5_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla5_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla5_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[5].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll5_exclusive -logically_exclusive -group [get_clocks plla5_1] -group [get_clocks plla5_2] -group [get_clocks plla5_3] -group [get_clocks plla5_4] -group [get_clocks plla5_5] -group [get_clocks plla5_6] -group [get_clocks plla5_7] -group [get_clocks plla5_8]

create_generated_clock -name plla6_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla6_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla6_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla6_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla6_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla6_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla6_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla6_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[6].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll6_exclusive -logically_exclusive -group [get_clocks plla6_1] -group [get_clocks plla6_2] -group [get_clocks plla6_3] -group [get_clocks plla6_4] -group [get_clocks plla6_5] -group [get_clocks plla6_6] -group [get_clocks plla6_7] -group [get_clocks plla6_8]

create_generated_clock -name plla7_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[35]/Q}]
create_generated_clock -name plla7_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[34]/Q}]
create_generated_clock -name plla7_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[33]/Q}]
create_generated_clock -name plla7_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[32]/Q}]
create_generated_clock -name plla7_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[31]/Q}]
create_generated_clock -name plla7_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[30]/Q}]
create_generated_clock -name plla7_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[29]/Q}]
create_generated_clock -name plla7_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[7].cog_/cog_ctra/pll_fake_reg[28]/Q}]
set_clock_groups -name pll7_exclusive -logically_exclusive -group [get_clocks plla7_1] -group [get_clocks plla7_2] -group [get_clocks plla7_3] -group [get_clocks plla7_4] -group [get_clocks plla7_5] -group [get_clocks plla7_6] -group [get_clocks plla7_7] -group [get_clocks plla7_8]

## PLLB (i.e. CTRB), 8 taps, per cog.
create_generated_clock -name pllb0_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb0_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb0_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb0_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb0_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb0_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb0_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb0_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[0].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb0_exclusive -logically_exclusive -group [get_clocks pllb0_1] -group [get_clocks pllb0_2] -group [get_clocks pllb0_3] -group [get_clocks pllb0_4] -group [get_clocks pllb0_5] -group [get_clocks pllb0_6] -group [get_clocks pllb0_7] -group [get_clocks pllb0_8]

create_generated_clock -name pllb1_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb1_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb1_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb1_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb1_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb1_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb1_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb1_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[1].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb1_exclusive -logically_exclusive -group [get_clocks pllb1_1] -group [get_clocks pllb1_2] -group [get_clocks pllb1_3] -group [get_clocks pllb1_4] -group [get_clocks pllb1_5] -group [get_clocks pllb1_6] -group [get_clocks pllb1_7] -group [get_clocks pllb1_8]

create_generated_clock -name pllb2_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb2_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb2_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb2_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb2_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb2_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb2_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb2_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[2].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb2_exclusive -logically_exclusive -group [get_clocks pllb2_1] -group [get_clocks pllb2_2] -group [get_clocks pllb2_3] -group [get_clocks pllb2_4] -group [get_clocks pllb2_5] -group [get_clocks pllb2_6] -group [get_clocks pllb2_7] -group [get_clocks pllb2_8]

create_generated_clock -name pllb3_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb3_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb3_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb3_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb3_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb3_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb3_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb3_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[3].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb3_exclusive -logically_exclusive -group [get_clocks pllb3_1] -group [get_clocks pllb3_2] -group [get_clocks pllb3_3] -group [get_clocks pllb3_4] -group [get_clocks pllb3_5] -group [get_clocks pllb3_6] -group [get_clocks pllb3_7] -group [get_clocks pllb3_8]

create_generated_clock -name pllb4_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb4_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb4_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb4_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb4_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb4_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb4_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb4_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[4].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb4_exclusive -logically_exclusive -group [get_clocks pllb4_1] -group [get_clocks pllb4_2] -group [get_clocks pllb4_3] -group [get_clocks pllb4_4] -group [get_clocks pllb4_5] -group [get_clocks pllb4_6] -group [get_clocks pllb4_7] -group [get_clocks pllb4_8]

create_generated_clock -name pllb5_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb5_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb5_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb5_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb5_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb5_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb5_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb5_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[5].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb5_exclusive -logically_exclusive -group [get_clocks pllb5_1] -group [get_clocks pllb5_2] -group [get_clocks pllb5_3] -group [get_clocks pllb5_4] -group [get_clocks pllb5_5] -group [get_clocks pllb5_6] -group [get_clocks pllb5_7] -group [get_clocks pllb5_8]

create_generated_clock -name pllb6_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb6_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb6_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb6_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb6_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb6_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb6_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb6_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb6_exclusive -logically_exclusive -group [get_clocks pllb6_1] -group [get_clocks pllb6_2] -group [get_clocks pllb6_3] -group [get_clocks pllb6_4] -group [get_clocks pllb6_5] -group [get_clocks pllb6_6] -group [get_clocks pllb6_7] -group [get_clocks pllb6_8]

create_generated_clock -name pllb7_1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 128 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[35]/Q}]
create_generated_clock -name pllb7_2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 64 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[34]/Q}]
create_generated_clock -name pllb7_3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 32 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[33]/Q}]
create_generated_clock -name pllb7_4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 16 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[32]/Q}]
create_generated_clock -name pllb7_5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 8 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[31]/Q}]
create_generated_clock -name pllb7_6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 4 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[30]/Q}]
create_generated_clock -name pllb7_7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 2 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[29]/Q}]
create_generated_clock -name pllb7_8 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[7].cog_/cog_ctrb/pll_fake_reg[28]/Q}]
set_clock_groups -name pllb7_exclusive -logically_exclusive -group [get_clocks pllb7_1] -group [get_clocks pllb7_2] -group [get_clocks pllb7_3] -group [get_clocks pllb7_4] -group [get_clocks pllb7_5] -group [get_clocks pllb7_6] -group [get_clocks pllb7_7] -group [get_clocks pllb7_8]

# Make PLL trees asynchronous from cogs - 1st group is "everything else", 2nd group is "all clocks derived from clk_pll"
set_clock_groups -name async_clks -asynchronous -group [get_clocks [list sys_clk_pin rcslow [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKFBOUT]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT5]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT4]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT3]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT2]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]]] -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT6]]]

# Video clock in each cog is generated based on the PLL output of CTRA.
create_generated_clock -name vclk0 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[0].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk1 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[1].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk2 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[2].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk3 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[3].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk4 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[4].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk5 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[5].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk6 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[6].cog_/cog_ctra/pll_reg/Q}]
create_generated_clock -name vclk7 -source [get_pins xilinx_clock_/genclock/CLKOUT6] -divide_by 1 [get_pins {core/coggen[7].cog_/cog_ctra/pll_reg/Q}]

# Logic derived from the pseudo-PLL clock is asynchronous from the primary cog clocks as well.
set_clock_groups -asynchronous -group [get_clocks clk_pll_o] -group [get_clocks {pllX* rcslow}]
# Video clocks are also asynchronous with the primary cog clocks, since they are based on the PLLA outputs.
set_clock_groups -asynchronous -group [get_clocks vclk*] -group [get_clocks {pllX* rcslow}]
# Another slow-clock timing issue: reset output is always at least 50ms pulse
set_multicycle_path -setup -start -from [get_pins reset_/res_reg/C] -to [get_pins core/nres_reg/D] 2
set_multicycle_path -hold -start -from [get_pins reset_/res_reg/C] -to [get_pins core/nres_reg/D] 1

## Other Vivado settings

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


