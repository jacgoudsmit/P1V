The Arty by Diligent Inc. is an FPGA board designed for Makers. It has a Xilinx Artix-7 35T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/arty/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The FPGA on this board has 33280 LE's in 5200 slices. The Propeller takes up about 40% of its space.

There is no EEPROM on board, so for now you can only run your Propeller software from RAM. There's also no SD card adapter so you'll have to work around this in some other way. The FPGA does have access to the Flash ROM from which the bit stream is loaded, so in theory it may be possible to work around this by replacing the Propeller boot loader. Or you can change the HDL so that your Propeller program is loaded in the RAM at startup.

You will need the Vivado software from Xilinx. The Arty comes with a card that has a license key for older versions, but you don't need it: the free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files


To build the P1V project, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Arty.xpr file in the HDL directory.
2. Click the Run button and select Run Synthesis (or press F11 on your keyboard).
3. (*) Click the Run Implementation button to start building the implementation for the Arty.


To prepare image files to program your design into the Arty, do the following:

4. (*) Click the Generate Bitstream button. This generates the .bit file that you can download to the FPGA, and the .bin file that you can download to the Flash ROM.
5. (*) Open the Hardware Manager. 
6. If the hardware manager wasn't open yet, it will say "No hardware target is open"; click "Open Target". This will pop up a dialog where you can choose "Auto Connect". You should then see a hardware tree with "localhost" at the top and "xc7a35t" underneath.


To download an image file, you have two options:
- Programming the FPGA with JTAG (via USB): This is a fast programming method, but your design doesn't get stored in Flash, so when you power the Arty down and then up again, or when you push the PROG button, the FPGA will execute what's in the Flash ROM if JP1 is on, or it will remain idle when JP1 is off.
- Programming the Flash ROM via USB stores your design in nonvolatile memory so that it automatically gets loaded and executed when you power the Arty down and then up again, or when you push the PROG button. But this takes much longer than JTAG programming.


To program the FPGA from your design, do the following:
7. Click Program Device in the flow navigator and then select xc7a35t, or right-click the xc7a35t in the hardware tree and click Program Device. This pops up the programming dialog.
8. Navigate to HDL/P1V_Arty.runs/impl_1/arty.bit for the bitstream file. You can leave the Debug Probes field blank. Click Program.
9. The Arty is now running your P1V (one green LED lights up to indicate that one cog is running), and a red LED may indicate that the virtual Prop Plug is connected through the USB port.


To program the Flash ROM instead of the FPGA, do the following:
7. If the hardware tree only shows the FPGA (xc7a35t) and no other devices, right click on it and select Add Configuration Memory Device. This opens the Add Configuration Memory Device dialog.
8. In the Add Configuration Memory Device dialog, select the mt25ql128-spi-x1_x2_x4 device (hint: type "QL128" in the search box and it will be the only device that shows up). Click OK.
9. (*) Right click on the mt25ql128-spi-x1_x2_x4 line in the hardware manager and select "Program Configuration Memory Device". This pops up a dialog
10. In the Program Configuration Memory Device dialog, set the configuration file to HDL/P1V_Arty.runs/impl_1/arty.bin. Normally you shouldn't have to change any other settings. Click OK.
11. The Flash ROM gets programmed, this takes a few seconds.
12. Push the PROG button on the Arty to load the program from the Flash ROM into the FPGA. This also happens automatically when the board is powered up (unless JP1 is off).
13. After a second or two, the FPGA starts (the DONE led lights up) and starts working. One LED lights up to show that one cog is running, and a red LED may indicate that the virtual Prop Plug is connected through the USB port.


For the Arty, you don't need a Prop Plug: unless you turn SW0 on, the on-board FTDI plug serves as a Prop Plug. So as long as the Arty is connected to the USB port and JP2 is on, you can use the Propeller Tool or any other tool compatible with the Propeller 1 to download programs to the Propeller and use the serial port on P30 and P31. Make sure you configure the Propeller Tool to use DTR as reset line.

Unfortunately the Arty doesn't have an I2C EEPROM on board to store your Propeller program, so you can only run your programs from RAM. But at the time of this writing, it's easy to find EEPROM boards that can be used with the PMOD headers (Google for PMOD I2C EEPROM). You may have to do some "rewiring" in the top level HDL module to connect SCL to P28 and SDA to P29 if you use such an EEPROM board. Another option is to change the HDL to replace the boot loader to load your program some other way, and/or preload your Propeller program in the hub RAM. 

Have fun!



(*) Vivado tries to guess what you are doing, and at the end of each operation it will suggest the next step. The choices marked with '(*)' in the instructions above can also be started by selecting the appropriate option from the suggestion popup.
