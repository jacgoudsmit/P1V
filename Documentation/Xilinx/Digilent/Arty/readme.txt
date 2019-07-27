P1V FOR THE DIGILENT ARTY (A7)

These instructions are for the original Arty or the Arty A7-35T. The two boards are identical but Digilent renamed the Arty when they decided to release more variants. For other Arty variants, see the "Arty Variants" section at the bottom of this Readme file.


INTRODUCTION

The Arty by Diligent Inc. is an FPGA board designed for Makers. It has a Xilinx Artix-7 35T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/arty/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The FPGA on this board has 33280 LE's in 5200 slices. The Propeller takes up about 40% of its space.

There is no EEPROM on board, so for now you can only run your Propeller software from RAM. There's also no SD card adapter so you'll have to work around this in some other way. The FPGA does have access to the Flash ROM from which the bit stream is loaded, so in theory it may be possible to work around this by replacing the Propeller boot loader. Or you can change the HDL so that your Propeller program is loaded in the RAM at startup.


GETTING STARTED

You will need the Vivado software from Xilinx. The Arty may come with a paper that has a license key for older versions, but you don't need it: the free (as in beer) Vivado HLx WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware.

This page on the website of Digilent (the makers of the Arty, not the makers of Vivado) gives information on how to install Vivado and prepare it to work with their boards: https://reference.digilentinc.com/vivado/installing-vivado/start . NOTE: The section about how to install the board files is mostly obsolete because of recent changes in both Vivado and the Digilent Github repository. The .tcl script that's mentioned on the page doesn't exist anymore and is no longer necessary: instead, you go to the Settings in Vivado and select Board Repository under Tool Settings. There you add the directory where you unpacked the board files to the list. You only need to add the top-level directory; it will search subdirectories for all board files it can find. NOTE: Don't use directories with spaces in the name, it doesn't handle those correctly.


BUILDING P1V

To build the P1V project, follow these steps. Most of the process happens in the background. Before the steps marked (*), a dialog will pop up, from which you can choose the next step, but you can also choose to cancel and manually continue the process later. NOTE: Sometimes the pop-up dialog's default choice is not how you want to continue if you're just building the project and aren't interested in inspecting everything.

1. Click "Open Project" (or use the menu to do the same), select the P1V_Arty.xpr file in the HDL directory. If you get an error about the program not finding the board, remember to add the top level directory where the board files are stored to the Board Repository list in the Settings.
2. Click the Run button and select Run Synthesis (or press F11 on your keyboard). If a dialog pops up asking where you want to run the operation, just click OK. You may click the "Don't Show This Again" checkbox to save some clicking. Otherwise the same dialog will pop up everytime you start an operation.
3. (*) Click the Run Implementation button to start building the implementation for the Arty.


DOWNLOADING P1V TO THE ARTY

To prepare image files to program your design into the Arty, do the following:

4. (*) Click the Generate Bitstream button. This generates the .bit file that you can download to the FPGA, and the .bin file that you can download to the Flash ROM.
5. (*) Open the Hardware Manager. 
6. If the hardware manager wasn't open yet, it will say "No hardware target is open"; click "Open Target". This will pop up a dialog where you can choose "Auto Connect". You should then see a hardware tree with "localhost" at the top and "xc7a35t" underneath.

To download an image file, you have two options:
- Programming the FPGA with JTAG (via USB): This is a fast programming method, but your design doesn't get stored in Flash, so when you power the Arty down and then up again, or when you push the PROG button, the FPGA will revert to whatever is in the Flash ROM if JP1 is on, or it will remain idle when JP1 is off.
- Programming the Flash ROM via USB stores your design in nonvolatile memory so that it automatically gets loaded and executed when you power the Arty down and then up again, or when you push the PROG button. But this takes much longer than JTAG programming.


To program the FPGA from your design, do the following:
7. Click Program Device in the flow navigator and then select xc7a35t, or right-click the xc7a35t in the hardware tree and click Program Device. This pops up the programming dialog.
8. Navigate to HDL/P1V_Arty.runs/impl_1/arty.bit for the bitstream file. You can leave the Debug Probes field blank. Click Program.
9. The Arty is now running your P1V (one green LED lights up to indicate that one cog is running), and a red LED may indicate that the virtual Prop Plug is connected through the USB port.


To program the Flash ROM instead of the FPGA, do the following:
7. If the hardware tree already shows both the FPGA (xc7a35t) and the mt25ql128-spi-x1_x2_x4 memory device, skip to step 9. Otherwise, right click the xc7a35t item and select Add Configuration Memory Device. This opens the Add Configuration Memory Device dialog.
8. In the Add Configuration Memory Device dialog, select the mt25ql128-spi-x1_x2_x4 device (hint: type "QL128" in the search box and it will probably be the only device that shows up). Click OK.
9. (*) Right click on the mt25ql128-spi-x1_x2_x4 line in the hardware manager and select "Program Configuration Memory Device". This pops up a dialog.
10. In the Program Configuration Memory Device dialog, set the configuration file to HDL/P1V_Arty.runs/impl_1/arty.bin. Normally you shouldn't have to change any other settings. Click OK.
11. The Flash ROM gets programmed, this takes a few seconds.
12. Push the PROG button on the Arty to load the program from the Flash ROM into the FPGA. This also happens automatically when the board is powered up (unless JP1 is off).
13. After a second or two, the FPGA starts (the DONE led lights up) and starts working. One LED lights up to show that one cog is running, and a red LED may indicate that the virtual Prop Plug is connected through the USB port.


PROGRAMMING THE P1V

For the Arty, you don't need a Prop Plug: unless you turn SW0 on, the on-board FTDI plug serves as a Prop Plug. So as long as the Arty is connected to the USB port and JP2 is on, you can use the Propeller Tool or any other tool compatible with the Propeller 1 to download programs to the Propeller and use the serial port on P30 and P31. Make sure you configure the Propeller Tool to use DTR as reset line.

Unfortunately the Arty doesn't have an I2C EEPROM on board to store your Propeller program, so you can only run your programs from RAM. But at the time of this writing, it's easy to find EEPROM boards that can be used with the PMOD headers (Google for PMOD I2C EEPROM). You may have to do some "rewiring" in the top level HDL module to connect SCL to P28 and SDA to P29 if you use such an EEPROM board. Another option is to change the HDL to replace the boot loader to load your program some other way (e.g. from Flash ROM or from an SD card via SPI), and/or preload your Propeller program in the hub RAM when you program the FPGA.


OTHER ARTY VARIANTS

As far as we know, the Arty and Arty A7-35T are basically the same board with a different name. The Arty A7-100T is the same circuit board but with a bigger FPGA, so if you have one, it should be enough to change the board in the project settings.

Other Arty variants such as the S7 and Z7 boards use different FPGAs and the board layout is different. For example the Arty S7 has fewer LEDs, no Ethernet and there are other differences. You CANNOT simply change the project to target one of the other boards, and expect it to work without making other changes. Separate project files (particularly .xpr, .xdc and a top level .sv file) will have to be written. This is not very difficult but takes some time. Here's a suggestion on how to go from an existing Arty board to a new Arty board:

Given an existing known-good configuration, say Arty, and to-be-supported other Digilent board, say Berty (change the names to apply to your situation):
1. Create a new project in Vivado, with no source files, and name it P1V_Berty. Save the project and close Vivado.
2. Use a tool such as KDiff3 or BeyondCompare to compare P1V_Arty.xpr to P1V_Berty.xpr and change Berty.xpr to prepare it to build P1V. Keep in mind that Berty already has the correct target FPGA etc., but it doesn't know anything about the P1V yet. Arty has customizations e.g. for the name of the top level module, and the names of the other modules. You need to change P1V_Berty.xpr so that it matches all the project-specific stuff from P1V_Arty but not the hardware-specific stuff.
3. Download the Berty.xdc template file from the Digilent Github repo, and compare it to Arty.xdc. The Berty.xdc file will have a long list of commented-out lines that define how each pin is connected. Your mission is to find as many pins as possible in Berty.xdc that correspond to similar pins in Arty.xdc. For example, it will probably have a long list of pins on PMOD headers and you'll want to uncomment those in Berty.xdc and make sure they get pin names that are similar to the names in Arty.xdc so that the Verilog code that connects the P1V to those pins doesn't have to change too much.
4. Copy the Arty.sv file to Berty.sv and change all the HDL that needs to be different, based on differences in the hardware, starting with the module name. For example, if Berty has fewer LEDs, you'll have to change how the P1V is wired to the LEDs. If Berty has an I2C EEPROM (something Arty doesn't have), you may want to connect it to P28 and P29 of the Propeller. And so on.

Have fun!
