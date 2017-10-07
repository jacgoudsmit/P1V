## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock signal
##Bank = 35, Pin name = IO_L12P_T1_MRCC_35,                 Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports CLK100MHZ]
set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]

## Switches
##Bank = 34, Pin name = IO_L21P_T3_DQS_34,                  Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {switch[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]
#Bank = 34, Pin name = IO_25_34,                            Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]
#Bank = 34, Pin name = IO_L23P_T3_34,                       Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {switch[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[2]}]
#Bank = 34, Pin name = IO_L19P_T3_34,                       Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {switch[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[3]}]
#Bank = 34, Pin name = IO_L19N_T3_VREF_34,                  Sch name = SW4
set_property PACKAGE_PIN R5 [get_ports {switch[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[4]}]
#Bank = 34, Pin name = IO_L20P_T3_34,                       Sch name = SW5
set_property PACKAGE_PIN V7 [get_ports {switch[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[5]}]
#Bank = 34, Pin name = IO_L20N_T3_34,                       Sch name = SW6
set_property PACKAGE_PIN V6 [get_ports {switch[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[6]}]
#Bank = 34, Pin name = IO_L10P_T1_34,                       Sch name = SW7
set_property PACKAGE_PIN V5 [get_ports {switch[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[7]}]
#Bank = 34, Pin name = IO_L8P_T1-34,                        Sch name = SW8
set_property PACKAGE_PIN U4 [get_ports {switch[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[8]}]
#Bank = 34, Pin name = IO_L9N_T1_DQS_34,                    Sch name = SW9
set_property PACKAGE_PIN V2 [get_ports {switch[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[9]}]
#Bank = 34, Pin name = IO_L9P_T1_DQS_34,                    Sch name = SW10
set_property PACKAGE_PIN U2 [get_ports {switch[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[10]}]
#Bank = 34, Pin name = IO_L11N_T1_MRCC_34,                  Sch name = SW11
set_property PACKAGE_PIN T3 [get_ports {switch[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[11]}]
#Bank = 34, Pin name = IO_L17N_T2_34,                       Sch name = SW12
set_property PACKAGE_PIN T1 [get_ports {switch[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[12]}]
#Bank = 34, Pin name = IO_L11P_T1_SRCC_34,                  Sch name = SW13
set_property PACKAGE_PIN R3 [get_ports {switch[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[13]}]
#Bank = 34, Pin name = IO_L14N_T2_SRCC_34,                  Sch name = SW14
set_property PACKAGE_PIN P3 [get_ports {switch[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[14]}]
#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,                  Sch name = SW15
set_property PACKAGE_PIN P4 [get_ports {switch[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[15]}]



## LEDs
##Bank = 34, Pin name = IO_L24N_T3_34,                      Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports {ledg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[0]}]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,                   Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports {ledg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[1]}]
#Bank = 34, Pin name = IO_L24P_T3_34,                       Sch name = LED2
set_property PACKAGE_PIN R8 [get_ports {ledg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[2]}]
#Bank = 34, Pin name = IO_L23N_T3_34,                       Sch name = LED3
set_property PACKAGE_PIN T6 [get_ports {ledg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[3]}]
#Bank = 34, Pin name = IO_L12P_T1_MRCC_34,                  Sch name = LED4
set_property PACKAGE_PIN T5 [get_ports {ledg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[4]}]
#Bank = 34, Pin name = IO_L12N_T1_MRCC_34,                  Sch name = LED5
set_property PACKAGE_PIN T4 [get_ports {ledg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[5]}]
#Bank = 34, Pin name = IO_L22P_T3_34,                       Sch name = LED6
set_property PACKAGE_PIN U7 [get_ports {ledg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[6]}]
#Bank = 34, Pin name = IO_L22N_T3_34,                       Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {ledg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[7]}]
#Bank = 34, Pin name = IO_L10N_T1_34,                       Sch name = LED8
set_property PACKAGE_PIN V4 [get_ports {ledg[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[8]}]
##Bank = 34, Pin name = IO_L8N_T1_34,                       Sch name = LED9
set_property PACKAGE_PIN U3 [get_ports {ledg[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[9]}]
#Bank = 34, Pin name = IO_L7N_T1_34,                        Sch name = LED10
set_property PACKAGE_PIN V1 [get_ports {ledg[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[10]}]
#Bank = 34, Pin name = IO_L17P_T2_34,                       Sch name = LED11
set_property PACKAGE_PIN R1 [get_ports {ledg[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[11]}]
#Bank = 34, Pin name = IO_L13N_T2_MRCC_34,                  Sch name = LED12
set_property PACKAGE_PIN P5 [get_ports {ledg[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[12]}]
#Bank = 34, Pin name = IO_L7P_T1_34,                        Sch name = LED13
set_property PACKAGE_PIN U1 [get_ports {ledg[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[13]}]
#Bank = 34, Pin name = IO_L15N_T2_DQS_34,                   Sch name = LED14
set_property PACKAGE_PIN R2 [get_ports {ledg[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[14]}]
#Bank = 34, Pin name = IO_L15P_T2_DQS_34,                   Sch name = LED15
set_property PACKAGE_PIN P2 [get_ports {ledg[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ledg[15]}]

#Bank = 34, Pin name = IO_L5P_T0_34,                        Sch name = LED16_R
#set_property PACKAGE_PIN K5 [get_ports {pin[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[16]}]
##Bank = 15, Pin name = IO_L5P_T0_AD9P_15,                  Sch name = LED16_G
#set_property PACKAGE_PIN F13 [get_ports {pin[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[17]}]
##Bank = 35, Pin name = IO_L19N_T3_VREF_35,                 Sch name = LED16_B
#set_property PACKAGE_PIN F6 [get_ports {pin[18]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[18]}]
##Bank = 34, Pin name = IO_0_34,                            Sch name = LED17_R
#set_property PACKAGE_PIN K6 [get_ports {pin[19]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[19]}]
##Bank = 35, Pin name = IO_24P_T3_35,                       Sch name =  LED17_G
#set_property PACKAGE_PIN H6 [get_ports {pin[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[20]}]
##Bank = CONFIG, Pin name = IO_L3N_T0_DQS_EMCCLK_14,        Sch name = LED17_B
#set_property PACKAGE_PIN L16 [get_ports {pin[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {pin[21]}]



##7 segment display
##Bank = 34, Pin name = IO_L2N_T0_34,                       Sch name = CA
#set_property PACKAGE_PIN L3 [get_ports {seg[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
##Bank = 34, Pin name = IO_L3N_T0_DQS_34,                   Sch name = CB
#set_property PACKAGE_PIN N1 [get_ports {seg[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
##Bank = 34, Pin name = IO_L6N_T0_VREF_34,                  Sch name = CC
#set_property PACKAGE_PIN L5 [get_ports {seg[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
##Bank = 34, Pin name = IO_L5N_T0_34,                       Sch name = CD
#set_property PACKAGE_PIN L4 [get_ports {seg[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
##Bank = 34, Pin name = IO_L2P_T0_34,                       Sch name = CE
#set_property PACKAGE_PIN K3 [get_ports {seg[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
##Bank = 34, Pin name = IO_L4N_T0_34,                       Sch name = CF
#set_property PACKAGE_PIN M2 [get_ports {seg[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
##Bank = 34, Pin name = IO_L6P_T0_34,                       Sch name = CG
#set_property PACKAGE_PIN L6 [get_ports {seg[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

##Bank = 34, Pin name = IO_L16P_T2_34,                      Sch name = DP
#set_property PACKAGE_PIN M4 [get_ports dp]
#set_property IOSTANDARD LVCMOS33 [get_ports dp]

##Bank = 34, Pin name = IO_L18N_T2_34,                      Sch name = AN0
#set_property PACKAGE_PIN N6 [get_ports {an[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
##Bank = 34, Pin name = IO_L18P_T2_34,                      Sch name = AN1
#set_property PACKAGE_PIN M6 [get_ports {an[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
##Bank = 34, Pin name = IO_L4P_T0_34,                       Sch name = AN2
#set_property PACKAGE_PIN M3 [get_ports {an[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
##Bank = 34, Pin name = IO_L13_T2_MRCC_34,                  Sch name = AN3
#set_property PACKAGE_PIN N5 [get_ports {an[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
##Bank = 34, Pin name = IO_L3P_T0_DQS_34,                   Sch name = AN4
#set_property PACKAGE_PIN N2 [get_ports {an[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[4]}]
##Bank = 34, Pin name = IO_L16N_T2_34,                      Sch name = AN5
#set_property PACKAGE_PIN N4 [get_ports {an[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[5]}]
##Bank = 34, Pin name = IO_L1P_T0_34,                       Sch name = AN6
#set_property PACKAGE_PIN L1 [get_ports {an[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[6]}]
##Bank = 34, Pin name = IO_L1N_T034,                        Sch name = AN7
#set_property PACKAGE_PIN M1 [get_ports {an[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {an[7]}]



##Buttons
##Bank = 15, Pin name = IO_L3P_T0_DQS_AD1P_15,              Sch name = CPU_RESET
set_property PACKAGE_PIN C12 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
##Bank = 15, Pin name = IO_L11N_T1_SRCC_15,                 Sch name = BTNC
#set_property PACKAGE_PIN E16 [get_ports btnC]
#set_property IOSTANDARD LVCMOS33 [get_ports btnC]
##Bank = 15, Pin name = IO_L14P_T2_SRCC_15,                 Sch name = BTNU
#set_property PACKAGE_PIN F15 [get_ports btnU]
#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
##Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,   Sch name = BTNL
#set_property PACKAGE_PIN T16 [get_ports btnL]
#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
##Bank = 14, Pin name = IO_25_14,                           Sch name = BTNR
#set_property PACKAGE_PIN R10 [get_ports btnR]
#set_property IOSTANDARD LVCMOS33 [get_ports btnR]
##Bank = 14, Pin name = IO_L21P_T3_DQS_14,                  Sch name = BTND
#set_property PACKAGE_PIN V10 [get_ports btnD]
#set_property IOSTANDARD LVCMOS33 [get_ports btnD]



#Pmod Header JA
#Bank = 15, Pin name = IO_L1N_T0_AD0N_15,                  Sch name = JA1
set_property PACKAGE_PIN B13 [get_ports {pmodA[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[0]}]
#Bank = 15, Pin name = IO_L5N_T0_AD9N_15,                  Sch name = JA2
set_property PACKAGE_PIN F14 [get_ports {pmodA[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[1]}]
#Bank = 15, Pin name = IO_L16N_T2_A27_15,                  Sch name = JA3
set_property PACKAGE_PIN D17 [get_ports {pmodA[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[2]}]
#Bank = 15, Pin name = IO_L16P_T2_A28_15,                  Sch name = JA4
set_property PACKAGE_PIN E17 [get_ports {pmodA[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[3]}]
#Bank = 15, Pin name = IO_0_15,                            Sch name = JA7
set_property PACKAGE_PIN G13 [get_ports {pmodA[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[4]}]
#Bank = 15, Pin name = IO_L20N_T3_A19_15,                  Sch name = JA8
set_property PACKAGE_PIN C17 [get_ports {pmodA[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[5]}]
#Bank = 15, Pin name = IO_L21N_T3_A17_15,                  Sch name = JA9
set_property PACKAGE_PIN D18 [get_ports {pmodA[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[6]}]
#Bank = 15, Pin name = IO_L21P_T3_DQS_15,                  Sch name = JA10
set_property PACKAGE_PIN E18 [get_ports {pmodA[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodA[7]}]



#Pmod Header JB
#Bank = 15, Pin name = IO_L15N_T2_DQS_ADV_B_15,            Sch name = JB1
set_property PACKAGE_PIN G14 [get_ports {pmodB[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[0]}]
#Bank = 14, Pin name = IO_L13P_T2_MRCC_14,                 Sch name = JB2
set_property PACKAGE_PIN P15 [get_ports {pmodB[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[1]}]
#Bank = 14, Pin name = IO_L21N_T3_DQS_A06_D22_14,          Sch name = JB3
set_property PACKAGE_PIN V11 [get_ports {pmodB[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[2]}]
#Bank = CONFIG, Pin name = IO_L16P_T2_CSI_B_14,            Sch name = JB4
set_property PACKAGE_PIN V15 [get_ports {pmodB[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[3]}]
#Bank = 15, Pin name = IO_25_15,                           Sch name = JB7
set_property PACKAGE_PIN K16 [get_ports {pmodB[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[4]}]
#Bank = CONFIG, Pin name = IO_L15P_T2_DQS_RWR_B_14,        Sch name = JB8
set_property PACKAGE_PIN R16 [get_ports {pmodB[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[5]}]
#Bank = 14, Pin name = IO_L24P_T3_A01_D17_14,              Sch name = JB9
set_property PACKAGE_PIN T9 [get_ports {pmodB[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[6]}]
#Bank = 14, Pin name = IO_L19N_T3_A09_D25_VREF_14,         Sch name = JB10
set_property PACKAGE_PIN U11 [get_ports {pmodB[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodB[7]}]



#Pmod Header JC
#Bank = 35, Pin name = IO_L23P_T3_35,                      Sch name = JC1
set_property PACKAGE_PIN K2 [get_ports {pmodC[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[0]}]
#Bank = 35, Pin name = IO_L6P_T0_35,                       Sch name = JC2
set_property PACKAGE_PIN E7 [get_ports {pmodC[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[1]}]
#Bank = 35, Pin name = IO_L22P_T3_35,                      Sch name = JC3
set_property PACKAGE_PIN J3 [get_ports {pmodC[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[2]}]
#Bank = 35, Pin name = IO_L21P_T3_DQS_35,                  Sch name = JC4
set_property PACKAGE_PIN J4 [get_ports {pmodC[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[3]}]
#Bank = 35, Pin name = IO_L23N_T3_35,                      Sch name = JC7
set_property PACKAGE_PIN K1 [get_ports {pmodC[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[4]}]
#Bank = 35, Pin name = IO_L5P_T0_AD13P_35,                 Sch name = JC8
set_property PACKAGE_PIN E6 [get_ports {pmodC[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[5]}]
#Bank = 35, Pin name = IO_L22N_T3_35,                      Sch name = JC9
set_property PACKAGE_PIN J2 [get_ports {pmodC[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[6]}]
#Bank = 35, Pin name = IO_L19P_T3_35,                      Sch name = JC10
set_property PACKAGE_PIN G6 [get_ports {pmodC[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodC[7]}]


#Pmod Header JD
#Bank = 35, Pin name = IO_L21N_T2_DQS_35,                  Sch name = JD1
set_property PACKAGE_PIN H4 [get_ports {pmodD[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[0]}]
#Bank = 35, Pin name = IO_L17P_T2_35,                      Sch name = JD2
set_property PACKAGE_PIN H1 [get_ports {pmodD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[1]}]
#Bank = 35, Pin name = IO_L17N_T2_35,                      Sch name = JD3
set_property PACKAGE_PIN G1 [get_ports {pmodD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[2]}]
#Bank = 35, Pin name = IO_L20N_T3_35,                      Sch name = JD4
set_property PACKAGE_PIN G3 [get_ports {pmodD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[3]}]
#Bank = 35, Pin name = IO_L15P_T2_DQS_35,                  Sch name = JD7
set_property PACKAGE_PIN H2 [get_ports {pmodD[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[4]}]
#Bank = 35, Pin name = IO_L20P_T3_35,                      Sch name = JD8
set_property PACKAGE_PIN G4 [get_ports {pmodD[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[5]}]
#Bank = 35, Pin name = IO_L15N_T2_DQS_35,                  Sch name = JD9
set_property PACKAGE_PIN G2 [get_ports {pmodD[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[6]}]
#Bank = 35, Pin name = IO_L13N_T2_MRCC_35,                 Sch name = JD10
set_property PACKAGE_PIN F3 [get_ports {pmodD[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {pmodD[7]}]



##Pmod Header JXADC
##Bank = 15, Pin name = IO_L9P_T1_DQS_AD3P_15,              Sch name = XADC1_P -> XA1_P
#set_property PACKAGE_PIN A13 [get_ports {JXADC[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[0]}]
##Bank = 15, Pin name = IO_L8P_T1_AD10P_15,                 Sch name = XADC2_P -> XA2_P
#set_property PACKAGE_PIN A15 [get_ports {JXADC[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[1]}]
##Bank = 15, Pin name = IO_L7P_T1_AD2P_15,                  Sch name = XADC3_P -> XA3_P
#set_property PACKAGE_PIN B16 [get_ports {JXADC[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[2]}]
##Bank = 15, Pin name = IO_L10P_T1_AD11P_15,                Sch name = XADC4_P -> XA4_P
#set_property PACKAGE_PIN B18 [get_ports {JXADC[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[3]}]
##Bank = 15, Pin name = IO_L9N_T1_DQS_AD3N_15,              Sch name = XADC1_N -> XA1_N
#set_property PACKAGE_PIN A14 [get_ports {JXADC[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[4]}]
##Bank = 15, Pin name = IO_L8N_T1_AD10N_15,                 Sch name = XADC2_N -> XA2_N
#set_property PACKAGE_PIN A16 [get_ports {JXADC[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[5]}]
##Bank = 15, Pin name = IO_L7N_T1_AD2N_15,                  Sch name = XADC3_N -> XA3_N
#set_property PACKAGE_PIN B17 [get_ports {JXADC[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[6]}]
##Bank = 15, Pin name = IO_L10N_T1_AD11N_15,                Sch name = XADC4_N -> XA4_N
#set_property PACKAGE_PIN A18 [get_ports {JXADC[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[7]}]



##VGA Connector
##Bank = 35, Pin name = IO_L8N_T1_AD14N_35,                 Sch name = VGA_R0
#set_property PACKAGE_PIN A3 [get_ports {vgaRed[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
##Bank = 35, Pin name = IO_L7N_T1_AD6N_35,                  Sch name = VGA_R1
#set_property PACKAGE_PIN B4 [get_ports {vgaRed[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
##Bank = 35, Pin name = IO_L1N_T0_AD4N_35,                  Sch name = VGA_R2
set_property PACKAGE_PIN C5 [get_ports {vgaRed[0]}]
#pin[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]
#pin[22]}]
##Bank = 35, Pin name = IO_L8P_T1_AD14P_35,                 Sch name = VGA_R3
set_property PACKAGE_PIN A4 [get_ports {vgaRed[1]}]
#pin[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
#pin[23]}]
##Bank = 35, Pin name = IO_L2P_T0_AD12P_35,                 Sch name = VGA_B0
#set_property PACKAGE_PIN B7 [get_ports {vgaBlue[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
##Bank = 35, Pin name = IO_L4N_T0_35,                       Sch name = VGA_B1
#set_property PACKAGE_PIN C7 [get_ports {vgaBlue[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
##Bank = 35, Pin name = IO_L6N_T0_VREF_35,                  Sch name = VGA_B2
set_property PACKAGE_PIN D7 [get_ports {vgaBlue[0]}]
#pin[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
#pin[18]}]
##Bank = 35, Pin name = IO_L4P_T0_35,                       Sch name = VGA_B3
set_property PACKAGE_PIN D8 [get_ports {vgaBlue[1]}]
#pin[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
#pin[19]}]
##Bank = 35, Pin name = IO_L1P_T0_AD4P_35,                  Sch name = VGA_G0
#set_property PACKAGE_PIN C6 [get_ports {vgaGreen[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
##Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,              Sch name = VGA_G1
#set_property PACKAGE_PIN A5 [get_ports {vgaGreen[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
##Bank = 35, Pin name = IO_L2N_T0_AD12N_35,                 Sch name = VGA_G2
set_property PACKAGE_PIN B6 [get_ports {vgaGr[0]}]
#pin[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGr[0]}]
#pin[20]}]
##Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,              Sch name = VGA_G3
set_property PACKAGE_PIN A6 [get_ports {vgaGr[1]}]
#pin[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGr[1]}]
#pin[21]}]
##Bank = 15, Pin name = IO_L4P_T0_15,                       Sch name = VGA_HS
set_property PACKAGE_PIN B11 [get_ports vgaHS]
#pin[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports vgaHS]
#pin[17]}]
##Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,              Sch name = VGA_VS
set_property PACKAGE_PIN B12 [get_ports vgaVS]
#pin[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports vgaVS]
#pin[16]}]



##Micro SD Connector
##Bank = 35, Pin name = IO_L14P_T2_SRCC_35,                 Sch name = SD_RESET
#set_property PACKAGE_PIN E2 [get_ports sdReset]
#set_property IOSTANDARD LVCMOS33 [get_ports sdReset]
##Bank = 35, Pin name = IO_L9N_T1_DQS_AD7N_35,              Sch name = SD_CD
#set_property PACKAGE_PIN A1 [get_ports sdCD]
#set_property IOSTANDARD LVCMOS33 [get_ports sdCD]
##Bank = 35, Pin name = IO_L9P_T1_DQS_AD7P_35,              Sch name = SD_SCK
#set_property PACKAGE_PIN B1 [get_ports sdSCK]
#set_property IOSTANDARD LVCMOS33 [get_ports sdSCK]
##Bank = 35, Pin name = IO_L16N_T2_35,                      Sch name = SD_CMD
#set_property PACKAGE_PIN C1 [get_ports sdCmd]
#set_property IOSTANDARD LVCMOS33 [get_ports sdCmd]
##Bank = 35, Pin name = IO_L16P_T2_35,                      Sch name = SD_DAT0
#set_property PACKAGE_PIN C2 [get_ports {sdData[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sdData[0]}]
##Bank = 35, Pin name = IO_L18N_T2_35,                      Sch name = SD_DAT1
#set_property PACKAGE_PIN E1 [get_ports {sdData[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sdData[1]}]
##Bank = 35, Pin name = IO_L18P_T2_35,                      Sch name = SD_DAT2
#set_property PACKAGE_PIN F1 [get_ports {sdData[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sdData[2]}]
##Bank = 35, Pin name = IO_L14N_T2_SRCC_35,                 Sch name = SD_DAT3
#set_property PACKAGE_PIN D2 [get_ports {sdData[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {sdData[3]}]



##Accelerometer
##Bank = 15, Pin name = IO_L6N_T0_VREF_15,                  Sch name = ACL_MISO
#set_property PACKAGE_PIN D13 [get_ports aclMISO]
#set_property IOSTANDARD LVCMOS33 [get_ports aclMISO]
##Bank = 15, Pin name = IO_L2N_T0_AD8N_15,                  Sch name = ACL_MOSI
#set_property PACKAGE_PIN B14 [get_ports aclMOSI]
#set_property IOSTANDARD LVCMOS33 [get_ports aclMOSI]
##Bank = 15, Pin name = IO_L12P_T1_MRCC_15,                 Sch name = ACL_SCLK
#set_property PACKAGE_PIN D15 [get_ports aclSCK]
#set_property IOSTANDARD LVCMOS33 [get_ports aclSCK]
##Bank = 15, Pin name = IO_L12N_T1_MRCC_15,                 Sch name = ACL_CSN
#set_property PACKAGE_PIN C15 [get_ports aclSS]
#set_property IOSTANDARD LVCMOS33 [get_ports aclSS]
##Bank = 15, Pin name = IO_L20P_T3_A20_15,                  Sch name = ACL_INT1
#set_property PACKAGE_PIN C16 [get_ports aclInt1]
#set_property IOSTANDARD LVCMOS33 [get_ports aclInt1]
##Bank = 15, Pin name = IO_L11P_T1_SRCC_15,                 Sch name = ACL_INT2
#set_property PACKAGE_PIN E15 [get_ports aclInt2]
#set_property IOSTANDARD LVCMOS33 [get_ports aclInt2]



##Temperature Sensor
##Bank = 15, Pin name = IO_L14N_T2_SRCC_15,                 Sch name = TMP_SCL
#set_property PACKAGE_PIN F16 [get_ports tmpSCL]
#set_property IOSTANDARD LVCMOS33 [get_ports tmpSCL]
##Bank = 15, Pin name = IO_L13N_T2_MRCC_15,                 Sch name = TMP_SDA
#set_property PACKAGE_PIN G16 [get_ports tmpSDA]
#set_property IOSTANDARD LVCMOS33 [get_ports tmpSDA]
##Bank = 15, Pin name = IO_L1P_T0_AD0P_15,                  Sch name = TMP_INT
#set_property PACKAGE_PIN D14 [get_ports tmpInt]
#set_property IOSTANDARD LVCMOS33 [get_ports tmpInt]
##Bank = 15, Pin name = IO_L1N_T0_AD0N_15,                  Sch name = TMP_CT
#set_property PACKAGE_PIN C14 [get_ports tmpCT]
#set_property IOSTANDARD LVCMOS33 [get_ports tmpCT]



##Omnidirectional Microphone
##Bank = 35, Pin name = IO_25_35,                           Sch name = M_CLK
#set_property PACKAGE_PIN J5 [get_ports micClk]
#set_property IOSTANDARD LVCMOS33 [get_ports micClk]
##Bank = 35, Pin name = IO_L24N_T3_35,                      Sch name = M_DATA
#set_property PACKAGE_PIN H5 [get_ports micData]
#set_property IOSTANDARD LVCMOS33 [get_ports micData]
##Bank = 35, Pin name = IO_0_35,                            Sch name = M_LRSEL
#set_property PACKAGE_PIN F5 [get_ports micLRSel]
#set_property IOSTANDARD LVCMOS33 [get_ports micLRSel]



##PWM Audio Amplifier
##Bank = 15, Pin name = IO_L4N_T0_15,                       Sch name = AUD_PWM
set_property PACKAGE_PIN A11 [get_ports ampPWM]
set_property IOSTANDARD LVCMOS33 [get_ports ampPWM]
##Bank = 15, Pin name = IO_L6P_T0_15,                       Sch name = AUD_SD
set_property PACKAGE_PIN D12 [get_ports ampSD]
set_property IOSTANDARD LVCMOS33 [get_ports ampSD]


##USB-RS232 Interface
##Bank = 35, Pin name = IO_L7P_T1_AD6P_35,                  Sch name = UART_TXD_IN
set_property PACKAGE_PIN C4 [get_ports uartTX]
set_property IOSTANDARD LVCMOS33 [get_ports uartTX]
##Bank = 35, Pin name = IO_L11N_T1_SRCC_35,                 Sch name = UART_RXD_OUT
set_property PACKAGE_PIN D4 [get_ports uartRX]
set_property IOSTANDARD LVCMOS33 [get_ports uartRX]
##Bank = 35, Pin name = IO_L12N_T1_MRCC_35,                 Sch name = UART_CTS
#set_property PACKAGE_PIN D3 [get_ports RsCts]
#set_property IOSTANDARD LVCMOS33 [get_ports RsCts]
##Bank = 35, Pin name = IO_L5N_T0_AD13N_35,                 Sch name = UART_RTS
set_property PACKAGE_PIN E5 [get_ports rts]
set_property IOSTANDARD LVCMOS33 [get_ports rts]



##USB HID (PS/2)
##Bank = 35, Pin name = IO_L13P_T2_MRCC_35,                 Sch name = PS2_CLK
set_property PACKAGE_PIN F4 [get_ports PS2Clk]
set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
set_property PULLUP true [get_ports PS2Clk]
##Bank = 35, Pin name = IO_L10N_T1_AD15N_35,                Sch name = PS2_DATA
set_property PACKAGE_PIN B2 [get_ports PS2Data]
set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]
set_property PULLUP true [get_ports PS2Data]



##SMSC Ethernet PHY
##Bank = 16, Pin name = IO_L11P_T1_SRCC_16,                 Sch name = ETH_MDC
#set_property PACKAGE_PIN C9 [get_ports PhyMdc]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyMdc]
##Bank = 16, Pin name = IO_L14N_T2_SRCC_16,                 Sch name = ETH_MDIO
#set_property PACKAGE_PIN A9 [get_ports PhyMdio]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyMdio]
##Bank = 35, Pin name = IO_L10P_T1_AD15P_35,                Sch name = ETH_RSTN
#set_property PACKAGE_PIN B3 [get_ports PhyRstn]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyRstn]
##Bank = 16, Pin name = IO_L6N_T0_VREF_16,                  Sch name = ETH_CRSDV
#set_property PACKAGE_PIN D9 [get_ports PhyCrs]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyCrs]
##Bank = 16, Pin name = IO_L13N_T2_MRCC_16,                 Sch name = ETH_RXERR
#set_property PACKAGE_PIN C10 [get_ports PhyRxErr]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyRxErr]
##Bank = 16, Pin name = IO_L19N_T3_VREF_16,                 Sch name = ETH_RXD0
#set_property PACKAGE_PIN D10 [get_ports {PhyRxd[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {PhyRxd[0]}]
##Bank = 16, Pin name = IO_L13P_T2_MRCC_16,                 Sch name = ETH_RXD1
#set_property PACKAGE_PIN C11 [get_ports {PhyRxd[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {PhyRxd[1]}]
##Bank = 16, Pin name = IO_L11N_T1_SRCC_16,                 Sch name = ETH_TXEN
#set_property PACKAGE_PIN B9 [get_ports PhyTxEn]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyTxEn]
##Bank = 16, Pin name = IO_L14P_T2_SRCC_16,                 Sch name = ETH_TXD0
#set_property PACKAGE_PIN A10 [get_ports {PhyTxd[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {PhyTxd[0]}]
##Bank = 16, Pin name = IO_L12N_T1_MRCC_16,                 Sch name = ETH_TXD1
#set_property PACKAGE_PIN A8 [get_ports {PhyTxd[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {PhyTxd[1]}]
##Bank = 35, Pin name = IO_L11P_T1_SRCC_35,                 Sch name = ETH_REFCLK
#set_property PACKAGE_PIN D5 [get_ports PhyClk50Mhz]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyClk50Mhz]
##Bank = 16, Pin name = IO_L12P_T1_MRCC_16,                 Sch name = ETH_INTN
#set_property PACKAGE_PIN B8 [get_ports PhyIntn]
#set_property IOSTANDARD LVCMOS33 [get_ports PhyIntn]



##Quad SPI Flash
##Bank = CONFIG, Pin name = CCLK_0,                         Sch name = QSPI_SCK
#set_property PACKAGE_PIN E9 [get_ports {QspiSCK}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiSCK}]
##Bank = CONFIG, Pin name = IO_L1P_T0_D00_MOSI_14,          Sch name = QSPI_DQ0
#set_property PACKAGE_PIN K17 [get_ports {QspiDB[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[0]}]
##Bank = CONFIG, Pin name = IO_L1N_T0_D01_DIN_14,           Sch name = QSPI_DQ1
#set_property PACKAGE_PIN K18 [get_ports {QspiDB[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[1]}]
##Bank = CONFIG, Pin name = IO_L20_T0_D02_14,               Sch name = QSPI_DQ2
#set_property PACKAGE_PIN L14 [get_ports {QspiDB[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[2]}]
##Bank = CONFIG, Pin name = IO_L2P_T0_D03_14,               Sch name = QSPI_DQ3
#set_property PACKAGE_PIN M14 [get_ports {QspiDB[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[3]}]
##Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,   Sch name = QSPI_CSN
#set_property PACKAGE_PIN L13 [get_ports QspiCSn]
#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]



##Cellular RAM
##Bank = 14, Pin name = IO_L14N_T2_SRCC_14,                 Sch name = CRAM_CLK
#set_property PACKAGE_PIN T15 [get_ports RamCLK]
#set_property IOSTANDARD LVCMOS33 [get_ports RamCLK]
##Bank = 14, Pin name = IO_L23P_T3_A03_D19_14,              Sch name = CRAM_ADVN
#set_property PACKAGE_PIN T13 [get_ports RamADVn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamADVn]
##Bank = 14, Pin name = IO_L4P_T0_D04_14,                   Sch name = CRAM_CEN
#set_property PACKAGE_PIN L18 [get_ports RamCEn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamCEn]
##Bank = 15, Pin name = IO_L19P_T3_A22_15,                  Sch name = CRAM_CRE
#set_property PACKAGE_PIN J14 [get_ports RamCRE]
#set_property IOSTANDARD LVCMOS33 [get_ports RamCRE]
##Bank = 15, Pin name = IO_L15P_T2_DQS_15,                  Sch name = CRAM_OEN
#set_property PACKAGE_PIN H14 [get_ports RamOEn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamOEn]
##Bank = 14, Pin name = IO_0_14,                            Sch name = CRAM_WEN
#set_property PACKAGE_PIN R11 [get_ports RamWEn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamWEn]
##Bank = 15, Pin name = IO_L24N_T3_RS0_15,                  Sch name = CRAM_LBN
#set_property PACKAGE_PIN J15 [get_ports RamLBn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamLBn]
##Bank = 15, Pin name = IO_L17N_T2_A25_15,                  Sch name = CRAM_UBN
#set_property PACKAGE_PIN J13 [get_ports RamUBn]
#set_property IOSTANDARD LVCMOS33 [get_ports RamUBn]
##Bank = 14, Pin name = IO_L14P_T2_SRCC_14,                 Sch name = CRAM_WAIT
#set_property PACKAGE_PIN T14 [get_ports RamWait]
#set_property IOSTANDARD LVCMOS33 [get_ports RamWait]

##Bank = 14, Pin name = IO_L5P_T0_DQ06_14,                  Sch name = CRAM_DQ0
#set_property PACKAGE_PIN R12 [get_ports {MemDB[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[0]}]
##Bank = 14, Pin name = IO_L19P_T3_A10_D26_14,              Sch name = CRAM_DQ1
#set_property PACKAGE_PIN T11 [get_ports {MemDB[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[1]}]
##Bank = 14, Pin name = IO_L20P_T3_A08)D24_14,              Sch name = CRAM_DQ2
#set_property PACKAGE_PIN U12 [get_ports {MemDB[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[2]}]
##Bank = 14, Pin name = IO_L5N_T0_D07_14,                   Sch name = CRAM_DQ3
#set_property PACKAGE_PIN R13 [get_ports {MemDB[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[3]}]
##Bank = 14, Pin name = IO_L17N_T2_A13_D29_14,              Sch name = CRAM_DQ4
#set_property PACKAGE_PIN U18 [get_ports {MemDB[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[4]}]
##Bank = 14, Pin name = IO_L12N_T1_MRCC_14,                 Sch name = CRAM_DQ5
#set_property PACKAGE_PIN R17 [get_ports {MemDB[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[5]}]
##Bank = 14, Pin name = IO_L7N_T1_D10_14,                   Sch name = CRAM_DQ6
#set_property PACKAGE_PIN T18 [get_ports {MemDB[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[6]}]
##Bank = 14, Pin name = IO_L7P_T1_D09_14,                   Sch name = CRAM_DQ7
#set_property PACKAGE_PIN R18 [get_ports {MemDB[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[7]}]
##Bank = 15, Pin name = IO_L22N_T3_A16_15,                  Sch name = CRAM_DQ8
#set_property PACKAGE_PIN F18 [get_ports {MemDB[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[8]}]
##Bank = 15, Pin name = IO_L22P_T3_A17_15,                  Sch name = CRAM_DQ9
#set_property PACKAGE_PIN G18 [get_ports {MemDB[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[9]}]
##Bank = 15, Pin name = IO_IO_L18N_T2_A23_15,               Sch name = CRAM_DQ10
#set_property PACKAGE_PIN G17 [get_ports {MemDB[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[10]}]
##Bank = 14, Pin name = IO_L4N_T0_D05_14,                   Sch name = CRAM_DQ11
#set_property PACKAGE_PIN M18 [get_ports {MemDB[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[11]}]
##Bank = 14, Pin name = IO_L10N_T1_D15_14,                  Sch name = CRAM_DQ12
#set_property PACKAGE_PIN M17 [get_ports {MemDB[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[12]}]
##Bank = 14, Pin name = IO_L9N_T1_DQS_D13_14,               Sch name = CRAM_DQ13
#set_property PACKAGE_PIN P18 [get_ports {MemDB[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[13]}]
##Bank = 14, Pin name = IO_L9P_T1_DQS_14,                   Sch name = CRAM_DQ14
#set_property PACKAGE_PIN N17 [get_ports {MemDB[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[14]}]
##Bank = 14, Pin name = IO_L12P_T1_MRCC_14,                 Sch name = CRAM_DQ15
#set_property PACKAGE_PIN P17 [get_ports {MemDB[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemDB[15]}]

##Bank = 15, Pin name = IO_L23N_T3_FWE_B_15,                Sch name = CRAM_A0
#set_property PACKAGE_PIN J18 [get_ports {MemAdr[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[0]}]
##Bank = 15, Pin name = IO_L18P_T2_A24_15,                  Sch name = CRAM_A1
#set_property PACKAGE_PIN H17 [get_ports {MemAdr[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[1]}]
##Bank = 15, Pin name = IO_L19N_T3_A21_VREF_15,             Sch name = CRAM_A2
#set_property PACKAGE_PIN H15 [get_ports {MemAdr[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[2]}]
##Bank = 15, Pin name = IO_L23P_T3_FOE_B_15,                Sch name = CRAM_A3
#set_property PACKAGE_PIN J17 [get_ports {MemAdr[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[3]}]
##Bank = 15, Pin name = IO_L13P_T2_MRCC_15,                 Sch name = CRAM_A4
#set_property PACKAGE_PIN H16 [get_ports {MemAdr[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[4]}]
##Bank = 15, Pin name = IO_L24P_T3_RS1_15,                  Sch name = CRAM_A5
#set_property PACKAGE_PIN K15 [get_ports {MemAdr[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[5]}]
##Bank = 15, Pin name = IO_L17P_T2_A26_15,                  Sch name = CRAM_A6
#set_property PACKAGE_PIN K13 [get_ports {MemAdr[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[6]}]
##Bank = 14, Pin name = IO_L11P_T1_SRCC_14,                 Sch name = CRAM_A7
#set_property PACKAGE_PIN N15 [get_ports {MemAdr[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[7]}]
##Bank = 14, Pin name = IO_L16N_T2_SRCC-14,                 Sch name = CRAM_A8
#set_property PACKAGE_PIN V16 [get_ports {MemAdr[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[8]}]
##Bank = 14, Pin name = IO_L22P_T3_A05_D21_14,              Sch name = CRAM_A9
#set_property PACKAGE_PIN U14 [get_ports {MemAdr[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[9]}]
##Bank = 14, Pin name = IO_L22N_T3_A04_D20_14,              Sch name = CRAM_A10
#set_property PACKAGE_PIN V14 [get_ports {MemAdr[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[10]}]
##Bank = 14, Pin name = IO_L20N_T3_A07_D23_14,              Sch name = CRAM_A11
#set_property PACKAGE_PIN V12 [get_ports {MemAdr[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[11]}]
##Bank = 14, Pin name = IO_L8N_T1_D12_14,                   Sch name = CRAM_A12
#set_property PACKAGE_PIN P14 [get_ports {MemAdr[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[12]}]
##Bank = 14, Pin name = IO_L18P_T2_A12_D28_14,              Sch name = CRAM_A13
#set_property PACKAGE_PIN U16 [get_ports {MemAdr[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[13]}]
##Bank = 14, Pin name = IO_L13N_T2_MRCC_14,                 Sch name = CRAM_A14
#set_property PACKAGE_PIN R15 [get_ports {MemAdr[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[14]}]
##Bank = 14, Pin name = IO_L8P_T1_D11_14,                   Sch name = CRAM_A15
#set_property PACKAGE_PIN N14 [get_ports {MemAdr[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[15]}]
##Bank = 14, Pin name = IO_L11N_T1_SRCC_14,                 Sch name = CRAM_A16
#set_property PACKAGE_PIN N16 [get_ports {MemAdr[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[16]}]
##Bank = 14, Pin name = IO_L6N_T0_D08_VREF_14,              Sch name = CRAM_A17
#set_property PACKAGE_PIN M13 [get_ports {MemAdr[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[17]}]
##Bank = 14, Pin name = IO_L18N_T2_A11_D27_14,              Sch name = CRAM_A18
#set_property PACKAGE_PIN V17 [get_ports {MemAdr[18]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[18]}]
##Bank = 14, Pin name = IO_L17P_T2_A14_D30_14,              Sch name = CRAM_A19
#set_property PACKAGE_PIN U17 [get_ports {MemAdr[19]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[19]}]
##Bank = 14, Pin name = IO_L24N_T3_A00_D16_14,              Sch name = CRAM_A20
#set_property PACKAGE_PIN T10 [get_ports {MemAdr[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[20]}]
##Bank = 14, Pin name = IO_L10P_T1_D14_14,                  Sch name = CRAM_A21
#set_property PACKAGE_PIN M16 [get_ports {MemAdr[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[21]}]
##Bank = 14, Pin name = IO_L23N_T3_A02_D18_14,              Sch name = CRAM_A22
#set_property PACKAGE_PIN U13 [get_ports {MemAdr[22]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {MemAdr[22]}]

#--------------------------------------------------------------------------------------------------------------------
## P1V specific timing constraints

# Most of the propeller clocks are inferred from the 100Mhz input clock and the MMCM. However, there is an RCSLOW mode of only
# ~19.5Khz generated by dividing down the 5MHz clock output.  We need to tell the timing analyzer about this.
create_generated_clock -name rcslow -source [get_pins xilinx_clock_/genclock/CLKOUT5] -divide_by 256 [get_pins {xilinx_clock_/divide_reg[6]/Q}]

# Tell the timing analyzer that the various clock modes of the prop (<= 80Mhz) cannot all be in use at the same time, don't waste timing checking for those interactions.
set_clock_groups -name clkpll_taps -logically_exclusive -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT5]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT4]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT3]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT2]]] -group [get_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]] -group [get_clocks rcslow]

# The reset module generates a 50ms pulse when a reset signal is received and goes from a fixed fast 160Mhz circuit, which is
# captured using the cog clock, which is potentially as slow as the 20KHz CPU.  Need to tell the timing analyzer that it's OK
# for it to take a LOT of (fast) clock cycles to capture this data when using the slow clock.
set_multicycle_path -setup -start -from [get_clocks clock_160_o] -to [get_clocks rcslow] 8192
set_multicycle_path -hold -start -from [get_clocks clock_160_o] -to [get_clocks rcslow] 8191

# PLLs can run up to 128Mhz per spec and so CLKOUT6 is set to generate 128MHz.
# Each tap is logically exclusive (cannot be selected at the same time as) the others on the same PLL, so we don't want timing analysis to waste effort looking for interactions.
# Further, all PLL logic trees need to be treated as asynchronous from each other and the rest of the design.

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
set_clock_groups -name async_clks -asynchronous -group [get_clocks [list sys_clk_pin rcslow [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKFBOUT]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT0]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT5]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT4]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT3]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT2]] [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT1]]]] -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins xilinx_clock_/genclock/CLKOUT6]]]

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
set_clock_groups -asynchronous -group [get_clocks clk_pll_o] -group [get_clocks {pllX* rcslow clock_160_o}]
# Video clocks are also asynchronous with the primary cog clocks, since they are based on the PLLA outputs.
set_clock_groups -asynchronous -group [get_clocks vclk*] -group [get_clocks {pllX* rcslow clock_160_o}]
# Another slow-clock timing issue: reset output is always at least 50ms pulse
set_multicycle_path -setup -start -from [get_pins reset_/res_reg/C] -to [get_pins nres_reg/D] 2
set_multicycle_path -hold -start -from [get_pins reset_/res_reg/C] -to [get_pins nres_reg/D] 1

#Debouncing switch 15 means it can be slow for the right debounced reset input signals to reach the reset register reset/clear FF pins.

# These pblocks help physically locate the various bits of the Prop to minimize routing difficulties (e.g. put the hub in the middle,
# near its block RAMs, put the individual cog rams as close to the relevant cog as possible, etc.
#create_pblock {pblock_coggen[7].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[7].cog_}] [get_cells -quiet [list {core/coggen[7].cog_}]]
#resize_pblock [get_pblocks {pblock_coggen[7].cog_}] -add {SLICE_X52Y62:SLICE_X61Y99}
#create_pblock {pblock_coggen[3].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[3].cog_}] [get_cells -quiet [list {core/coggen[3].cog_} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__5} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__6}]]
#resize_pblock [get_pblocks {pblock_coggen[3].cog_}] -add {SLICE_X78Y118:SLICE_X89Y149}
#resize_pblock [get_pblocks {pblock_coggen[3].cog_}] -add {RAMB18_X3Y48:RAMB18_X3Y59}
#create_pblock {pblock_coggen[0].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[0].cog_}] [get_cells -quiet [list {core/coggen[0].cog_}]]
#resize_pblock [get_pblocks {pblock_coggen[0].cog_}] -add {SLICE_X74Y75:SLICE_X89Y99}
#resize_pblock [get_pblocks {pblock_coggen[0].cog_}] -add {RAMB18_X3Y30:RAMB18_X3Y39}
#create_pblock {pblock_coggen[5].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[5].cog_}] [get_cells -quiet [list {core/coggen[5].cog_} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__10} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__9}]]
#resize_pblock [get_pblocks {pblock_coggen[5].cog_}] -add {SLICE_X38Y70:SLICE_X51Y99}
#create_pblock {pblock_coggen[6].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[6].cog_}] [get_cells -quiet [list {core/coggen[6].cog_/GND} {core/coggen[6].cog_/VCC} {core/coggen[6].cog_/ac[10]_i_5} {core/coggen[6].cog_/ac[11]_i_5} {core/coggen[6].cog_/ac[12]_i_5} {core/coggen[6].cog_/ac[13]_i_29} {core/coggen[6].cog_/ac[13]_i_30} {core/coggen[6].cog_/ac[13]_i_31} {core/coggen[6].cog_/ac[13]_i_32} {core/coggen[6].cog_/ac[13]_i_5} {core/coggen[6].cog_/ac[14]_i_5} {core/coggen[6].cog_/ac[15]_i_23} {core/coggen[6].cog_/ac[15]_i_24} {core/coggen[6].cog_/ac[15]_i_5} {core/coggen[6].cog_/ac[2]_i_5} {core/coggen[6].cog_/ac[3]_i_5} {core/coggen[6].cog_/ac[4]_i_5} {core/coggen[6].cog_/ac[5]_i_29} {core/coggen[6].cog_/ac[5]_i_30} {core/coggen[6].cog_/ac[5]_i_31} {core/coggen[6].cog_/ac[5]_i_32} {core/coggen[6].cog_/ac[5]_i_5} {core/coggen[6].cog_/ac[6]_i_5} {core/coggen[6].cog_/ac[7]_i_5} {core/coggen[6].cog_/ac[8]_i_5} {core/coggen[6].cog_/ac[9]_i_29} {core/coggen[6].cog_/ac[9]_i_30} {core/coggen[6].cog_/ac[9]_i_31} {core/coggen[6].cog_/ac[9]_i_32} {core/coggen[6].cog_/ac[9]_i_5} {core/coggen[6].cog_/ac_reg[13]_i_12} {core/coggen[6].cog_/ac_reg[15]_i_12} {core/coggen[6].cog_/ac_reg[5]_i_12} {core/coggen[6].cog_/ac_reg[9]_i_12} {core/coggen[6].cog_/ampPWM_IOBUF_inst_i_2} {core/coggen[6].cog_/ampPWM_IOBUF_inst_i_8} {core/coggen[6].cog_/c_i_10__5} {core/coggen[6].cog_/c_i_11__5} {core/coggen[6].cog_/c_i_12__5} {core/coggen[6].cog_/c_i_13__5} {core/coggen[6].cog_/c_i_14__5} {core/coggen[6].cog_/c_i_15__5} {core/coggen[6].cog_/c_i_16__5} {core/coggen[6].cog_/c_i_17__5} {core/coggen[6].cog_/c_i_1__5} {core/coggen[6].cog_/c_i_2__5} {core/coggen[6].cog_/c_i_3__5} {core/coggen[6].cog_/c_i_4__5} {core/coggen[6].cog_/c_i_5__5} {core/coggen[6].cog_/c_i_6__5} {core/coggen[6].cog_/c_i_7__5} {core/coggen[6].cog_/c_i_8__5} {core/coggen[6].cog_/c_i_9__5} {core/coggen[6].cog_/c_reg} {core/coggen[6].cog_/cancel_i_3__5} {core/coggen[6].cog_/cancel_i_4__5} {core/coggen[6].cog_/cancel_reg} {core/coggen[6].cog_/cog_alu_} {core/coggen[6].cog_/cog_ctra} {core/coggen[6].cog_/cog_ctrb/GND} {core/coggen[6].cog_/cog_ctrb/PS2Clk_IOBUF_inst_i_18} {core/coggen[6].cog_/cog_ctrb/PS2Clk_IOBUF_inst_i_39} {core/coggen[6].cog_/cog_ctrb/PS2Clk_IOBUF_inst_i_40} {core/coggen[6].cog_/cog_ctrb/PS2Clk_IOBUF_inst_i_6} {core/coggen[6].cog_/cog_ctrb/PS2Data_IOBUF_inst_i_18} {core/coggen[6].cog_/cog_ctrb/PS2Data_IOBUF_inst_i_38} {core/coggen[6].cog_/cog_ctrb/PS2Data_IOBUF_inst_i_39} {core/coggen[6].cog_/cog_ctrb/PS2Data_IOBUF_inst_i_6} {core/coggen[6].cog_/cog_ctrb/VCC} {core/coggen[6].cog_/cog_ctrb/ampPWM_IOBUF_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ampPWM_IOBUF_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ampPWM_IOBUF_inst_i_41} {core/coggen[6].cog_/cog_ctrb/ampPWM_IOBUF_inst_i_6} {core/coggen[6].cog_/cog_ctrb/cancel_i_1__6} {core/coggen[6].cog_/cog_ctrb/ctr[30]_i_1__5} {core/coggen[6].cog_/cog_ctrb/ctr[30]_i_2__11} {core/coggen[6].cog_/cog_ctrb/ctr_reg[0]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[10]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[11]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[12]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[13]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[1]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[23]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[24]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[25]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[26]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[27]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[28]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[29]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[2]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[30]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[3]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[4]} {core/coggen[6].cog_/cog_ctrb/ctr_reg[9]} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_10__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_12__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_13__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_14__11} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_14__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_15__11} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_15__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_1__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__1} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__10} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__11} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__2} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__3} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__4} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__5} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__6} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__7} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__8} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_8__9} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__1} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__10} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__11} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__12} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__2} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__3} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__4} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__5} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__6} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__7} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__8} {core/coggen[6].cog_/cog_ctrb/dly[0]_i_9__9} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__1} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__10} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__11} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__2} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__3} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__4} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__5} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__6} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__7} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__8} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_10__9} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_11__11} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_11__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_12__11} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_12__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_13__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_14__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_1__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_2__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_7__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__1} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__10} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__11} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__12} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__2} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__3} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__4} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__5} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__6} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__7} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__8} {core/coggen[6].cog_/cog_ctrb/dly[1]_i_9__9} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_2__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_3__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__11} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_5__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_6__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_7__11} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_7__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_3__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__1} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__10} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__11} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__2} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__3} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__4} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__5} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__6} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__7} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__8} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_4__9} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_5__11} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_5__12} {core/coggen[6].cog_/cog_ctrb/dly_reg[1]_i_6__12} {core/coggen[6].cog_/cog_ctrb/frq[31]_i_1__11} {core/coggen[6].cog_/cog_ctrb/frq[31]_i_2__11} {core/coggen[6].cog_/cog_ctrb/frq_reg[0]} {core/coggen[6].cog_/cog_ctrb/frq_reg[10]} {core/coggen[6].cog_/cog_ctrb/frq_reg[11]} {core/coggen[6].cog_/cog_ctrb/frq_reg[12]} {core/coggen[6].cog_/cog_ctrb/frq_reg[13]} {core/coggen[6].cog_/cog_ctrb/frq_reg[14]} {core/coggen[6].cog_/cog_ctrb/frq_reg[15]} {core/coggen[6].cog_/cog_ctrb/frq_reg[16]} {core/coggen[6].cog_/cog_ctrb/frq_reg[17]} {core/coggen[6].cog_/cog_ctrb/frq_reg[18]} {core/coggen[6].cog_/cog_ctrb/frq_reg[19]} {core/coggen[6].cog_/cog_ctrb/frq_reg[1]} {core/coggen[6].cog_/cog_ctrb/frq_reg[20]} {core/coggen[6].cog_/cog_ctrb/frq_reg[21]} {core/coggen[6].cog_/cog_ctrb/frq_reg[22]} {core/coggen[6].cog_/cog_ctrb/frq_reg[23]} {core/coggen[6].cog_/cog_ctrb/frq_reg[24]} {core/coggen[6].cog_/cog_ctrb/frq_reg[25]} {core/coggen[6].cog_/cog_ctrb/frq_reg[26]} {core/coggen[6].cog_/cog_ctrb/frq_reg[27]} {core/coggen[6].cog_/cog_ctrb/frq_reg[28]} {core/coggen[6].cog_/cog_ctrb/frq_reg[29]} {core/coggen[6].cog_/cog_ctrb/frq_reg[2]} {core/coggen[6].cog_/cog_ctrb/frq_reg[30]} {core/coggen[6].cog_/cog_ctrb/frq_reg[31]} {core/coggen[6].cog_/cog_ctrb/frq_reg[3]} {core/coggen[6].cog_/cog_ctrb/frq_reg[4]} {core/coggen[6].cog_/cog_ctrb/frq_reg[5]} {core/coggen[6].cog_/cog_ctrb/frq_reg[6]} {core/coggen[6].cog_/cog_ctrb/frq_reg[7]} {core/coggen[6].cog_/cog_ctrb/frq_reg[8]} {core/coggen[6].cog_/cog_ctrb/frq_reg[9]} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[10]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[10]_inst_i_39} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[10]_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[10]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[11]_inst_i_22} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[11]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[12]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[12]_inst_i_39} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[12]_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[12]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[12]_inst_i_8} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[13]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[13]_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[13]_inst_i_41} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[13]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[14]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[14]_inst_i_43} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[14]_inst_i_44} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[14]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[14]_inst_i_71} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[15]_inst_i_25} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[15]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[8]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[8]_inst_i_39} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[8]_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[8]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[8]_inst_i_8} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[9]_inst_i_18} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[9]_inst_i_39} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[9]_inst_i_40} {core/coggen[6].cog_/cog_ctrb/ledg_OBUFT[9]_inst_i_6} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_10__1} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_11} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_111} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_112} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_12__1} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_1__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_21} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_26} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_28} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_2__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_3__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_41} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_4__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_59} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_5__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_6__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_7__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_7__6} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_80} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_81} {core/coggen[6].cog_/cog_ctrb/match2_carry__0_i_8__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_15} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_33} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_3__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_56} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_57} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_6__0} {core/coggen[6].cog_/cog_ctrb/match2_carry__1_i_8__1} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_12} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_16} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_1__0} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_22} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_23} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_2__0} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_32} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_46} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_5__6} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_6__2} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_7__0} {core/coggen[6].cog_/cog_ctrb/match2_carry_i_8__6} {core/coggen[6].cog_/cog_ctrb/outa[31]_i_2__5} {core/coggen[6].cog_/cog_ctrb/outa[31]_i_3__5} {core/coggen[6].cog_/cog_ctrb/outa[31]_i_4__5} {core/coggen[6].cog_/cog_ctrb/outa[31]_i_5__5} {core/coggen[6].cog_/cog_ctrb/p[0]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[1]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[2]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[3]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[4]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_2__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_3__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_4__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_5__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_6__5} {core/coggen[6].cog_/cog_ctrb/p[5]_i_7__5} {core/coggen[6].cog_/cog_ctrb/p[6]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[6]_i_2__5} {core/coggen[6].cog_/cog_ctrb/p[7]_i_1__5} {core/coggen[6].cog_/cog_ctrb/p[8]_i_2__6} {core/coggen[6].cog_/cog_ctrb/p[8]_i_4__5} {core/coggen[6].cog_/cog_ctrb/p[8]_i_5__5} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[11]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[15]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[19]_i_9__11} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[23]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[27]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[31]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[32]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs[32]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[32]_i_4__12} {core/coggen[6].cog_/cog_ctrb/phs[32]_i_5__12} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[3]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_2__11} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_3__11} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_4__11} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_5__11} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_6__12} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_7__12} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_8__12} {core/coggen[6].cog_/cog_ctrb/phs[7]_i_9__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[0]} {core/coggen[6].cog_/cog_ctrb/phs_reg[10]} {core/coggen[6].cog_/cog_ctrb/phs_reg[11]} {core/coggen[6].cog_/cog_ctrb/phs_reg[11]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[12]} {core/coggen[6].cog_/cog_ctrb/phs_reg[13]} {core/coggen[6].cog_/cog_ctrb/phs_reg[14]} {core/coggen[6].cog_/cog_ctrb/phs_reg[15]} {core/coggen[6].cog_/cog_ctrb/phs_reg[15]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[16]} {core/coggen[6].cog_/cog_ctrb/phs_reg[17]} {core/coggen[6].cog_/cog_ctrb/phs_reg[18]} {core/coggen[6].cog_/cog_ctrb/phs_reg[19]} {core/coggen[6].cog_/cog_ctrb/phs_reg[19]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[1]} {core/coggen[6].cog_/cog_ctrb/phs_reg[20]} {core/coggen[6].cog_/cog_ctrb/phs_reg[21]} {core/coggen[6].cog_/cog_ctrb/phs_reg[22]} {core/coggen[6].cog_/cog_ctrb/phs_reg[23]} {core/coggen[6].cog_/cog_ctrb/phs_reg[23]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[24]} {core/coggen[6].cog_/cog_ctrb/phs_reg[25]} {core/coggen[6].cog_/cog_ctrb/phs_reg[26]} {core/coggen[6].cog_/cog_ctrb/phs_reg[27]} {core/coggen[6].cog_/cog_ctrb/phs_reg[27]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[28]} {core/coggen[6].cog_/cog_ctrb/phs_reg[29]} {core/coggen[6].cog_/cog_ctrb/phs_reg[2]} {core/coggen[6].cog_/cog_ctrb/phs_reg[30]} {core/coggen[6].cog_/cog_ctrb/phs_reg[31]} {core/coggen[6].cog_/cog_ctrb/phs_reg[31]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[32]} {core/coggen[6].cog_/cog_ctrb/phs_reg[32]_i_2__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[3]} {core/coggen[6].cog_/cog_ctrb/phs_reg[3]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[4]} {core/coggen[6].cog_/cog_ctrb/phs_reg[5]} {core/coggen[6].cog_/cog_ctrb/phs_reg[6]} {core/coggen[6].cog_/cog_ctrb/phs_reg[7]} {core/coggen[6].cog_/cog_ctrb/phs_reg[7]_i_1__12} {core/coggen[6].cog_/cog_ctrb/phs_reg[8]} {core/coggen[6].cog_/cog_ctrb/phs_reg[9]} {core/coggen[6].cog_/cog_ctrb/pll_fake[0]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[0]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[0]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[0]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[0]_i_6__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[12]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[12]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[12]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[12]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[16]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[16]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[16]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[16]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[20]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[20]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[20]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[20]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[24]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[24]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[24]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[24]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[28]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[28]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[28]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[28]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[32]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[32]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[32]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[32]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[4]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[4]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[4]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[4]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[8]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[8]_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[8]_i_4__12} {core/coggen[6].cog_/cog_ctrb/pll_fake[8]_i_5__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[0]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[0]_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[10]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[11]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[12]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[12]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[13]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[14]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[15]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[16]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[16]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[17]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[18]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[19]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[1]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[20]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[20]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[21]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[22]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[23]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[24]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[24]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[25]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[26]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[27]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[28]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[28]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[29]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[2]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[30]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[31]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[32]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[32]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[33]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[34]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[35]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[3]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[4]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[4]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[5]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[6]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[7]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[8]} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[8]_i_1__12} {core/coggen[6].cog_/cog_ctrb/pll_fake_reg[9]} {core/coggen[6].cog_/cog_ctrb/pll_i_2__12} {core/coggen[6].cog_/cog_ctrb/pll_i_3__12} {core/coggen[6].cog_/cog_ctrb/pll_reg} {core/coggen[6].cog_/cog_ctrb/pll_reg_i_1__12} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[0]_inst_i_19} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[0]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[1]_inst_i_19} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[2]_inst_i_19} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[2]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[3]_inst_i_1} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[3]_inst_i_12} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[3]_inst_i_13} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[3]_inst_i_4} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[4]_inst_i_19} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[4]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[5]_inst_i_19} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[6]_inst_i_20} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[6]_inst_i_7} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_1} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_12} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_13} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_29} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_30} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_4} {core/coggen[6].cog_/cog_ctrb/pmodA_IOBUF[7]_inst_i_42} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[2]_inst_i_17} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[2]_inst_i_8} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[5]_inst_i_20} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[5]_inst_i_41} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[5]_inst_i_42} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[5]_inst_i_8} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[7]_inst_i_21} {core/coggen[6].cog_/cog_ctrb/pmodD_IOBUF[7]_inst_i_9} {core/coggen[6].cog_/cog_ctrb/r_reg_i_100__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_102__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_103__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_104__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_105__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_106__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_107__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_109__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_10__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_110__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_111__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_113__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_114__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_115__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_117__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_118__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_119__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_121__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_122__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_123__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_125__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_126__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_127__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_128__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_131__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_132__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_133__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_135__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_136__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_137__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_138__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_139__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_140__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_142__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_144__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_145__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_146__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_148__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_149__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_150__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_152__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_153__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_154__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_156__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_158__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_159__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_160__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_162__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_163__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_164__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_166__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_168__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_169__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_170__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_172__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_173__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_174__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_176__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_177__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_178__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_181__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_184__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_186__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_187__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_188__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_189__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_190__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_191__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_192__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_193__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_202__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_203__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_204__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_205__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_206__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_207__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_208__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_209__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_210__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_211__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_212__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_213__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_214__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_215__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_224__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_225__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_226__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_227__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_228__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_229__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_230__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_231__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_232__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_233__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_234__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_235__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_236__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_237__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_238__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_247__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_248__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_249__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_250__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_251__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_252__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_253__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_254__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_255__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_256__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_257__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_258__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_259__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_260__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_261__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_262__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_263__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_264__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_265__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_275__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_276__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_277__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_278__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_279__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_280__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_281__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_283__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_290__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_291__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_292__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_293__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_294__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_295__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_296__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_297__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_298__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_2__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_308__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_309__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_310__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_311__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_312__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_313__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_314__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_323__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_329__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_330__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_331__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_332__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_333__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_334__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_335__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_336__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_337__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_338__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_339__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_340__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_341__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_342__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_343__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_344__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_345__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_346__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_347__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_348__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_351__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_352__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_353__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_354__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_355__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_356__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_357__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_358__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_359__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_360__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_361__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_362__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_363__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_364__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_365__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_366__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_367__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_368__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_369__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_370__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_371__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_372__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_373__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_374__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_375__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_376__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_377__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_378__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_379__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_380__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_381__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_382__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_383__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_384__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_385__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_386__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_387__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_388__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_389__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_390__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_391__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_392__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_393__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_394__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_395__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_397__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_398__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_399__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_3__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_400__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_401__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_402__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_403__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_406__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_407__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_408__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_409__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_410__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_411__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_412__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_421__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_422__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_423__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_424__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_430__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_431__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_432__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_433__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_434__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_435__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_436__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_437__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_438__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_439__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_440__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_441__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_442__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_443__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_444__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_445__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_446__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_447__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_448__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_449__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_44__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_450__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_451__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_452__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_453__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_454__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_455__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_456__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_457__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_458__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_459__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_460__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_461__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_462__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_465__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_466__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_467__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_468__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_469__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_47__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_49__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_4__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_51__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_53__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_55__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_57__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_59__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_5__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_61__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_64__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_65__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_66__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_67__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_68__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_69__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_6__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_71__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_72__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_73__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_74__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_76__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_77__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_78__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_79__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_7__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_80__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_81__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_83__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_84__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_85__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_87__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_88__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_89__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_8__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_90__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_91__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_92__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_94__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_95__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_96__6} {core/coggen[6].cog_/cog_ctrb/r_reg_i_98__2} {core/coggen[6].cog_/cog_ctrb/r_reg_i_99__5} {core/coggen[6].cog_/cog_ctrb/r_reg_i_9__5} {core/coggen[6].cog_/cog_ctrb/run_i_3__5} {core/coggen[6].cog_/cog_ctrb/run_i_4__5} {core/coggen[6].cog_/cog_ctrb/s[0]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[0]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[0]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[10]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[10]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[10]_i_3} {core/coggen[6].cog_/cog_ctrb/s[11]_i_13} {core/coggen[6].cog_/cog_ctrb/s[11]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[11]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[11]_i_6} {core/coggen[6].cog_/cog_ctrb/s[12]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[12]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[13]_i_15} {core/coggen[6].cog_/cog_ctrb/s[13]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[13]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[13]_i_6} {core/coggen[6].cog_/cog_ctrb/s[14]_i_15} {core/coggen[6].cog_/cog_ctrb/s[14]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[14]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[14]_i_3} {core/coggen[6].cog_/cog_ctrb/s[14]_i_6} {core/coggen[6].cog_/cog_ctrb/s[15]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[15]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[16]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[16]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[16]_i_3} {core/coggen[6].cog_/cog_ctrb/s[17]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[17]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[18]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[18]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[19]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[19]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[1]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[1]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[1]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[20]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[20]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[20]_i_3} {core/coggen[6].cog_/cog_ctrb/s[21]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[21]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[22]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[22]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[22]_i_3} {core/coggen[6].cog_/cog_ctrb/s[23]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[23]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[24]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[24]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[25]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[25]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[26]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[26]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[26]_i_3} {core/coggen[6].cog_/cog_ctrb/s[27]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[27]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[28]_i_15} {core/coggen[6].cog_/cog_ctrb/s[28]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[28]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[28]_i_6} {core/coggen[6].cog_/cog_ctrb/s[29]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[29]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[2]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[2]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[2]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[2]_i_4} {core/coggen[6].cog_/cog_ctrb/s[30]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[30]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[31]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[31]_i_4__6} {core/coggen[6].cog_/cog_ctrb/s[3]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[3]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[3]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[4]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[4]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[4]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[5]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[5]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[5]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[6]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[6]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[6]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[7]_i_1__5} {core/coggen[6].cog_/cog_ctrb/s[7]_i_2__5} {core/coggen[6].cog_/cog_ctrb/s[7]_i_3__5} {core/coggen[6].cog_/cog_ctrb/s[8]_i_18} {core/coggen[6].cog_/cog_ctrb/s[8]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[8]_i_2__6} {core/coggen[6].cog_/cog_ctrb/s[8]_i_4__5} {core/coggen[6].cog_/cog_ctrb/s[8]_i_9} {core/coggen[6].cog_/cog_ctrb/s[9]_i_1__6} {core/coggen[6].cog_/cog_ctrb/s[9]_i_2__6} {core/coggen[6].cog_/cog_ctrb/uartRX_OBUFT_inst_i_16} {core/coggen[6].cog_/cog_ctrb/uartRX_OBUFT_inst_i_35} {core/coggen[6].cog_/cog_ctrb/uartRX_OBUFT_inst_i_36} {core/coggen[6].cog_/cog_ctrb/uartRX_OBUFT_inst_i_5} {core/coggen[6].cog_/cog_vid_} {core/coggen[6].cog_/ctr[30]_i_1} {core/coggen[6].cog_/d_reg[0]} {core/coggen[6].cog_/d_reg[10]} {core/coggen[6].cog_/d_reg[11]} {core/coggen[6].cog_/d_reg[12]} {core/coggen[6].cog_/d_reg[13]} {core/coggen[6].cog_/d_reg[14]} {core/coggen[6].cog_/d_reg[15]} {core/coggen[6].cog_/d_reg[16]} {core/coggen[6].cog_/d_reg[17]} {core/coggen[6].cog_/d_reg[18]} {core/coggen[6].cog_/d_reg[19]} {core/coggen[6].cog_/d_reg[1]} {core/coggen[6].cog_/d_reg[20]} {core/coggen[6].cog_/d_reg[21]} {core/coggen[6].cog_/d_reg[22]} {core/coggen[6].cog_/d_reg[23]} {core/coggen[6].cog_/d_reg[24]} {core/coggen[6].cog_/d_reg[25]} {core/coggen[6].cog_/d_reg[26]} {core/coggen[6].cog_/d_reg[27]} {core/coggen[6].cog_/d_reg[28]} {core/coggen[6].cog_/d_reg[29]} {core/coggen[6].cog_/d_reg[2]} {core/coggen[6].cog_/d_reg[30]} {core/coggen[6].cog_/d_reg[31]} {core/coggen[6].cog_/d_reg[3]} {core/coggen[6].cog_/d_reg[4]} {core/coggen[6].cog_/d_reg[5]} {core/coggen[6].cog_/d_reg[6]} {core/coggen[6].cog_/d_reg[7]} {core/coggen[6].cog_/d_reg[8]} {core/coggen[6].cog_/d_reg[9]} {core/coggen[6].cog_/dira[31]_i_1__5} {core/coggen[6].cog_/dira[31]_i_2__5} {core/coggen[6].cog_/dira_reg[0]} {core/coggen[6].cog_/dira_reg[10]} {core/coggen[6].cog_/dira_reg[11]} {core/coggen[6].cog_/dira_reg[12]} {core/coggen[6].cog_/dira_reg[13]} {core/coggen[6].cog_/dira_reg[14]} {core/coggen[6].cog_/dira_reg[15]} {core/coggen[6].cog_/dira_reg[16]} {core/coggen[6].cog_/dira_reg[17]} {core/coggen[6].cog_/dira_reg[18]} {core/coggen[6].cog_/dira_reg[19]} {core/coggen[6].cog_/dira_reg[1]} {core/coggen[6].cog_/dira_reg[20]} {core/coggen[6].cog_/dira_reg[21]} {core/coggen[6].cog_/dira_reg[22]} {core/coggen[6].cog_/dira_reg[23]} {core/coggen[6].cog_/dira_reg[24]} {core/coggen[6].cog_/dira_reg[25]} {core/coggen[6].cog_/dira_reg[26]} {core/coggen[6].cog_/dira_reg[27]} {core/coggen[6].cog_/dira_reg[28]} {core/coggen[6].cog_/dira_reg[29]} {core/coggen[6].cog_/dira_reg[2]} {core/coggen[6].cog_/dira_reg[30]} {core/coggen[6].cog_/dira_reg[31]} {core/coggen[6].cog_/dira_reg[3]} {core/coggen[6].cog_/dira_reg[4]} {core/coggen[6].cog_/dira_reg[5]} {core/coggen[6].cog_/dira_reg[6]} {core/coggen[6].cog_/dira_reg[7]} {core/coggen[6].cog_/dira_reg[8]} {core/coggen[6].cog_/dira_reg[9]} {core/coggen[6].cog_/ec_i_14} {core/coggen[6].cog_/ix_reg[0]} {core/coggen[6].cog_/ix_reg[10]} {core/coggen[6].cog_/ix_reg[11]} {core/coggen[6].cog_/ix_reg[12]} {core/coggen[6].cog_/ix_reg[13]} {core/coggen[6].cog_/ix_reg[14]} {core/coggen[6].cog_/ix_reg[15]} {core/coggen[6].cog_/ix_reg[16]} {core/coggen[6].cog_/ix_reg[17]} {core/coggen[6].cog_/ix_reg[18]} {core/coggen[6].cog_/ix_reg[19]} {core/coggen[6].cog_/ix_reg[1]} {core/coggen[6].cog_/ix_reg[20]} {core/coggen[6].cog_/ix_reg[21]} {core/coggen[6].cog_/ix_reg[22]} {core/coggen[6].cog_/ix_reg[23]} {core/coggen[6].cog_/ix_reg[24]} {core/coggen[6].cog_/ix_reg[25]} {core/coggen[6].cog_/ix_reg[26]} {core/coggen[6].cog_/ix_reg[27]} {core/coggen[6].cog_/ix_reg[28]} {core/coggen[6].cog_/ix_reg[29]} {core/coggen[6].cog_/ix_reg[2]} {core/coggen[6].cog_/ix_reg[30]} {core/coggen[6].cog_/ix_reg[31]} {core/coggen[6].cog_/ix_reg[3]} {core/coggen[6].cog_/ix_reg[4]} {core/coggen[6].cog_/ix_reg[5]} {core/coggen[6].cog_/ix_reg[6]} {core/coggen[6].cog_/ix_reg[7]} {core/coggen[6].cog_/ix_reg[8]} {core/coggen[6].cog_/ix_reg[9]} {core/coggen[6].cog_/ledg_OBUFT[10]_inst_i_2} {core/coggen[6].cog_/ledg_OBUFT[12]_inst_i_2} {core/coggen[6].cog_/ledg_OBUFT[14]_inst_i_2} {core/coggen[6].cog_/ledg_OBUFT[8]_inst_i_2} {core/coggen[6].cog_/m[0]_i_1__5} {core/coggen[6].cog_/m[4]_i_4__5} {core/coggen[6].cog_/m[4]_i_5__5} {core/coggen[6].cog_/m_reg[0]} {core/coggen[6].cog_/m_reg[1]} {core/coggen[6].cog_/m_reg[2]} {core/coggen[6].cog_/m_reg[3]} {core/coggen[6].cog_/m_reg[4]} {core/coggen[6].cog_/match2_carry} {core/coggen[6].cog_/match2_carry__0} {core/coggen[6].cog_/match2_carry__0_i_11__1} {core/coggen[6].cog_/match2_carry__0_i_9__1} {core/coggen[6].cog_/match2_carry__1} {core/coggen[6].cog_/match2_carry__1_i_1__0} {core/coggen[6].cog_/match2_carry__1_i_2__0} {core/coggen[6].cog_/match2_carry__1_i_4__3} {core/coggen[6].cog_/match2_carry__1_i_5__0} {core/coggen[6].cog_/match2_carry__1_i_7__1} {core/coggen[6].cog_/match2_carry_i_10__1} {core/coggen[6].cog_/match2_carry_i_11__5} {core/coggen[6].cog_/match2_carry_i_12__5} {core/coggen[6].cog_/match2_carry_i_13__3} {core/coggen[6].cog_/match2_carry_i_3__5} {core/coggen[6].cog_/match2_carry_i_4__5} {core/coggen[6].cog_/match2_carry_i_8__4} {core/coggen[6].cog_/match2_carry_i_9__3} {core/coggen[6].cog_/match_i_1__5} {core/coggen[6].cog_/match_reg} {core/coggen[6].cog_/outa[31]_i_1__5} {core/coggen[6].cog_/outa_reg[0]} {core/coggen[6].cog_/outa_reg[10]} {core/coggen[6].cog_/outa_reg[11]} {core/coggen[6].cog_/outa_reg[12]} {core/coggen[6].cog_/outa_reg[13]} {core/coggen[6].cog_/outa_reg[14]} {core/coggen[6].cog_/outa_reg[15]} {core/coggen[6].cog_/outa_reg[16]} {core/coggen[6].cog_/outa_reg[17]} {core/coggen[6].cog_/outa_reg[18]} {core/coggen[6].cog_/outa_reg[19]} {core/coggen[6].cog_/outa_reg[1]} {core/coggen[6].cog_/outa_reg[20]} {core/coggen[6].cog_/outa_reg[21]} {core/coggen[6].cog_/outa_reg[22]} {core/coggen[6].cog_/outa_reg[23]} {core/coggen[6].cog_/outa_reg[24]} {core/coggen[6].cog_/outa_reg[25]} {core/coggen[6].cog_/outa_reg[26]} {core/coggen[6].cog_/outa_reg[27]} {core/coggen[6].cog_/outa_reg[28]} {core/coggen[6].cog_/outa_reg[29]} {core/coggen[6].cog_/outa_reg[2]} {core/coggen[6].cog_/outa_reg[30]} {core/coggen[6].cog_/outa_reg[31]} {core/coggen[6].cog_/outa_reg[3]} {core/coggen[6].cog_/outa_reg[4]} {core/coggen[6].cog_/outa_reg[5]} {core/coggen[6].cog_/outa_reg[6]} {core/coggen[6].cog_/outa_reg[7]} {core/coggen[6].cog_/outa_reg[8]} {core/coggen[6].cog_/outa_reg[9]} {core/coggen[6].cog_/p[8]_i_10__5} {core/coggen[6].cog_/p[8]_i_11__5} {core/coggen[6].cog_/p[8]_i_12__5} {core/coggen[6].cog_/p[8]_i_13__5} {core/coggen[6].cog_/p[8]_i_14__2} {core/coggen[6].cog_/p[8]_i_1__5} {core/coggen[6].cog_/p[8]_i_3__5} {core/coggen[6].cog_/p[8]_i_6__5} {core/coggen[6].cog_/p[8]_i_7__2} {core/coggen[6].cog_/p[8]_i_8__5} {core/coggen[6].cog_/p[8]_i_9__5} {core/coggen[6].cog_/p_reg[0]} {core/coggen[6].cog_/p_reg[1]} {core/coggen[6].cog_/p_reg[2]} {core/coggen[6].cog_/p_reg[3]} {core/coggen[6].cog_/p_reg[4]} {core/coggen[6].cog_/p_reg[5]} {core/coggen[6].cog_/p_reg[6]} {core/coggen[6].cog_/p_reg[7]} {core/coggen[6].cog_/p_reg[8]} {core/coggen[6].cog_/pmodA_IOBUF[0]_inst_i_2} {core/coggen[6].cog_/pmodA_IOBUF[2]_inst_i_2} {core/coggen[6].cog_/pmodA_IOBUF[4]_inst_i_2} {core/coggen[6].cog_/pmodA_IOBUF[6]_inst_i_2} {core/coggen[6].cog_/pmodB_IOBUF[1]_inst_i_1} {core/coggen[6].cog_/pmodB_IOBUF[1]_inst_i_2} {core/coggen[6].cog_/ptr_reg[0]} {core/coggen[6].cog_/ptr_reg[10]} {core/coggen[6].cog_/ptr_reg[11]} {core/coggen[6].cog_/ptr_reg[12]} {core/coggen[6].cog_/ptr_reg[13]} {core/coggen[6].cog_/ptr_reg[14]} {core/coggen[6].cog_/ptr_reg[15]} {core/coggen[6].cog_/ptr_reg[16]} {core/coggen[6].cog_/ptr_reg[17]} {core/coggen[6].cog_/ptr_reg[18]} {core/coggen[6].cog_/ptr_reg[19]} {core/coggen[6].cog_/ptr_reg[1]} {core/coggen[6].cog_/ptr_reg[20]} {core/coggen[6].cog_/ptr_reg[21]} {core/coggen[6].cog_/ptr_reg[22]} {core/coggen[6].cog_/ptr_reg[23]} {core/coggen[6].cog_/ptr_reg[24]} {core/coggen[6].cog_/ptr_reg[25]} {core/coggen[6].cog_/ptr_reg[26]} {core/coggen[6].cog_/ptr_reg[27]} {core/coggen[6].cog_/ptr_reg[2]} {core/coggen[6].cog_/ptr_reg[3]} {core/coggen[6].cog_/ptr_reg[4]} {core/coggen[6].cog_/ptr_reg[5]} {core/coggen[6].cog_/ptr_reg[6]} {core/coggen[6].cog_/ptr_reg[7]} {core/coggen[6].cog_/ptr_reg[8]} {core/coggen[6].cog_/ptr_reg[9]} {core/coggen[6].cog_/r_reg_i_180__2} {core/coggen[6].cog_/r_reg_i_182__2} {core/coggen[6].cog_/r_reg_i_185__2} {core/coggen[6].cog_/r_reg_i_194__2} {core/coggen[6].cog_/r_reg_i_195__2} {core/coggen[6].cog_/r_reg_i_196__5} {core/coggen[6].cog_/r_reg_i_197__5} {core/coggen[6].cog_/r_reg_i_1__5} {core/coggen[6].cog_/r_reg_i_216__5} {core/coggen[6].cog_/r_reg_i_217__5} {core/coggen[6].cog_/r_reg_i_218__2} {core/coggen[6].cog_/r_reg_i_219__2} {core/coggen[6].cog_/r_reg_i_239__2} {core/coggen[6].cog_/r_reg_i_240__2} {core/coggen[6].cog_/r_reg_i_241__5} {core/coggen[6].cog_/r_reg_i_242__5} {core/coggen[6].cog_/r_reg_i_266__6} {core/coggen[6].cog_/r_reg_i_267__5} {core/coggen[6].cog_/r_reg_i_268__5} {core/coggen[6].cog_/r_reg_i_269__2} {core/coggen[6].cog_/r_reg_i_270__5} {core/coggen[6].cog_/r_reg_i_284__5} {core/coggen[6].cog_/r_reg_i_285__2} {core/coggen[6].cog_/r_reg_i_286__2} {core/coggen[6].cog_/r_reg_i_300__5} {core/coggen[6].cog_/r_reg_i_301__5} {core/coggen[6].cog_/r_reg_i_302__2} {core/coggen[6].cog_/r_reg_i_303__2} {core/coggen[6].cog_/r_reg_i_315__2} {core/coggen[6].cog_/r_reg_i_316__2} {core/coggen[6].cog_/r_reg_i_317__5} {core/coggen[6].cog_/r_reg_i_318__5} {core/coggen[6].cog_/r_reg_i_327__5} {core/coggen[6].cog_/r_reg_i_328__5} {core/coggen[6].cog_/r_reg_i_349__5} {core/coggen[6].cog_/r_reg_i_350__5} {core/coggen[6].cog_/r_reg_i_396__5} {core/coggen[6].cog_/r_reg_i_404__5} {core/coggen[6].cog_/r_reg_i_413__5} {core/coggen[6].cog_/r_reg_i_414__5} {core/coggen[6].cog_/r_reg_i_415__5} {core/coggen[6].cog_/r_reg_i_416__5} {core/coggen[6].cog_/r_reg_i_45__5} {core/coggen[6].cog_/r_reg_i_463__5} {core/coggen[6].cog_/r_reg_i_464__5} {core/coggen[6].cog_/r_reg_i_46__5} {core/coggen[6].cog_/r_reg_i_48__5} {core/coggen[6].cog_/r_reg_i_50__5} {core/coggen[6].cog_/r_reg_i_52__5} {core/coggen[6].cog_/r_reg_i_54__5} {core/coggen[6].cog_/r_reg_i_56__5} {core/coggen[6].cog_/r_reg_i_60__5} {core/coggen[6].cog_/rc_i_3} {core/coggen[6].cog_/run_i_1} {core/coggen[6].cog_/run_reg} {core/coggen[6].cog_/run_reg_rep} {core/coggen[6].cog_/run_reg_rep__0} {core/coggen[6].cog_/run_rep__0_i_1} {core/coggen[6].cog_/run_rep_i_1} {core/coggen[6].cog_/s[31]_i_1} {core/coggen[6].cog_/s[31]_i_3__5} {core/coggen[6].cog_/s[31]_i_5__5} {core/coggen[6].cog_/s[31]_i_6__4} {core/coggen[6].cog_/s[8]_i_3__5} {core/coggen[6].cog_/s[8]_i_5__5} {core/coggen[6].cog_/s[8]_i_7__5} {core/coggen[6].cog_/s[8]_i_8__5} {core/coggen[6].cog_/s_reg[0]} {core/coggen[6].cog_/s_reg[10]} {core/coggen[6].cog_/s_reg[11]} {core/coggen[6].cog_/s_reg[12]} {core/coggen[6].cog_/s_reg[13]} {core/coggen[6].cog_/s_reg[14]} {core/coggen[6].cog_/s_reg[15]} {core/coggen[6].cog_/s_reg[16]} {core/coggen[6].cog_/s_reg[17]} {core/coggen[6].cog_/s_reg[18]} {core/coggen[6].cog_/s_reg[19]} {core/coggen[6].cog_/s_reg[1]} {core/coggen[6].cog_/s_reg[20]} {core/coggen[6].cog_/s_reg[21]} {core/coggen[6].cog_/s_reg[22]} {core/coggen[6].cog_/s_reg[23]} {core/coggen[6].cog_/s_reg[24]} {core/coggen[6].cog_/s_reg[25]} {core/coggen[6].cog_/s_reg[26]} {core/coggen[6].cog_/s_reg[27]} {core/coggen[6].cog_/s_reg[28]} {core/coggen[6].cog_/s_reg[29]} {core/coggen[6].cog_/s_reg[2]} {core/coggen[6].cog_/s_reg[30]} {core/coggen[6].cog_/s_reg[31]} {core/coggen[6].cog_/s_reg[3]} {core/coggen[6].cog_/s_reg[4]} {core/coggen[6].cog_/s_reg[5]} {core/coggen[6].cog_/s_reg[6]} {core/coggen[6].cog_/s_reg[7]} {core/coggen[6].cog_/s_reg[8]} {core/coggen[6].cog_/s_reg[9]} {core/coggen[6].cog_/sc[0]_i_5} {core/coggen[6].cog_/sc[1]_i_5} {core/coggen[6].cog_/sy_reg[0]} {core/coggen[6].cog_/sy_reg[10]} {core/coggen[6].cog_/sy_reg[11]} {core/coggen[6].cog_/sy_reg[12]} {core/coggen[6].cog_/sy_reg[13]} {core/coggen[6].cog_/sy_reg[14]} {core/coggen[6].cog_/sy_reg[15]} {core/coggen[6].cog_/sy_reg[16]} {core/coggen[6].cog_/sy_reg[17]} {core/coggen[6].cog_/sy_reg[18]} {core/coggen[6].cog_/sy_reg[19]} {core/coggen[6].cog_/sy_reg[1]} {core/coggen[6].cog_/sy_reg[20]} {core/coggen[6].cog_/sy_reg[21]} {core/coggen[6].cog_/sy_reg[22]} {core/coggen[6].cog_/sy_reg[23]} {core/coggen[6].cog_/sy_reg[24]} {core/coggen[6].cog_/sy_reg[25]} {core/coggen[6].cog_/sy_reg[26]} {core/coggen[6].cog_/sy_reg[27]} {core/coggen[6].cog_/sy_reg[28]} {core/coggen[6].cog_/sy_reg[29]} {core/coggen[6].cog_/sy_reg[2]} {core/coggen[6].cog_/sy_reg[30]} {core/coggen[6].cog_/sy_reg[31]} {core/coggen[6].cog_/sy_reg[3]} {core/coggen[6].cog_/sy_reg[4]} {core/coggen[6].cog_/sy_reg[5]} {core/coggen[6].cog_/sy_reg[6]} {core/coggen[6].cog_/sy_reg[7]} {core/coggen[6].cog_/sy_reg[8]} {core/coggen[6].cog_/sy_reg[9]} {core/coggen[6].cog_/vgaBlue_IOBUF[0]_inst_i_1} {core/coggen[6].cog_/vgaBlue_IOBUF[0]_inst_i_2} {core/coggen[6].cog_/vgaGr_IOBUF[0]_inst_i_1} {core/coggen[6].cog_/vgaGr_IOBUF[0]_inst_i_2} {core/coggen[6].cog_/vgaRed_IOBUF[0]_inst_i_1} {core/coggen[6].cog_/vgaRed_IOBUF[0]_inst_i_2} {core/coggen[6].cog_/vgaVS_IOBUF_inst_i_1} {core/coggen[6].cog_/vgaVS_IOBUF_inst_i_2} {core/coggen[6].cog_/z_i_6__5} {core/coggen[6].cog_/z_reg}]]
#resize_pblock [get_pblocks {pblock_coggen[6].cog_}] -add {SLICE_X38Y102:SLICE_X51Y130}
#create_pblock {pblock_coggen[1].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[1].cog_}] [get_cells -quiet [list {core/coggen[1].cog_} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__1} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__2}]]
#resize_pblock [get_pblocks {pblock_coggen[1].cog_}] -add {SLICE_X78Y100:SLICE_X89Y117 SLICE_X68Y105:SLICE_X77Y124}
#resize_pblock [get_pblocks {pblock_coggen[1].cog_}] -add {RAMB18_X3Y40:RAMB18_X3Y45 RAMB18_X2Y42:RAMB18_X2Y49}
#create_pblock {pblock_coggen[4].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[4].cog_}] [get_cells -quiet [list {core/coggen[4].cog_} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__7} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__8}]]
#resize_pblock [get_pblocks {pblock_coggen[4].cog_}] -add {SLICE_X52Y108:SLICE_X67Y131}
#resize_pblock [get_pblocks {pblock_coggen[4].cog_}] -add {RAMB18_X1Y44:RAMB18_X1Y51}
#create_pblock {pblock_coggen[2].cog_}
#add_cells_to_pblock [get_pblocks {pblock_coggen[2].cog_}] [get_cells -quiet [list {core/coggen[2].cog_} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__3} {core/coggen[6].cog_/cog_ctrb/dly_reg[0]_i_4__4}]]
#resize_pblock [get_pblocks {pblock_coggen[2].cog_}] -add {SLICE_X64Y62:SLICE_X73Y99}
#resize_pblock [get_pblocks {pblock_coggen[2].cog_}] -add {RAMB18_X2Y26:RAMB18_X2Y39}
#create_pblock pblock_hub_
#add_cells_to_pblock [get_pblocks pblock_hub_] [get_cells -quiet [list core/hub_]]
#resize_pblock [get_pblocks pblock_hub_] -add {SLICE_X58Y100:SLICE_X77Y104}
#resize_pblock [get_pblocks pblock_hub_] -add {RAMB36_X1Y18:RAMB36_X2Y21}
#create_pblock pblock_clkgen
#add_cells_to_pblock [get_pblocks pblock_clkgen] [get_cells -quiet [list xilinx_clock_]]
#resize_pblock [get_pblocks pblock_clkgen] -add {SLICE_X50Y100:SLICE_X53Y101}
#create_pblock pblock_reset_
#add_cells_to_pblock [get_pblocks pblock_reset_] [get_cells -quiet [list reset_]]
#resize_pblock [get_pblocks pblock_reset_] -add {SLICE_X56Y100:SLICE_X57Y107}

## Other Vivado settings
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]



