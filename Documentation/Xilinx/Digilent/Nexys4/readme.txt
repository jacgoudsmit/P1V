The Nexys4 by Diligent Inc. is an FPGA board designed for students. It has a Xilinx Artix-7 100T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/nexys-4/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The Propeller consumes about 18% of the FPGA's logic/FF slices and about 15% of available Block RAM.  There's therefore plenty of available space to rewire the Propeller I/Os internally to additional logic, or to connect unused pins externally to onboard peripherals or PMOD headers.

The default constraints wire up several Prop pins to the onboard VGA output. LEDs are also provided to indicate active cogs, and the CPU_RESET button to allow a manual reset of the Propeller. (DTR via the simulated Prop Plug also resets the Propeller as expected, i.e. "RTS" in the Parallax Serial Terminal). Use of the onboard audio output jack or other peripherals is left as an exercise for the reader.

For now you can only run your Propeller software from RAM. Since the Nexys4 does support microSD, it seems reasonable to think that with a little work it should be possible to use the Propeller Tool to "save" your software to the SD card, or some region of the QSPI memory on the board.

You will need the Vivado software from Xilinx. The free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware. There is also plenty of room to add the Vivado ILA debug core, if needed to allow debugging of internal signals as needed.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files

To build the P1V project, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Nexys4.xpr file in the HDL directory, or just double click the file in the Windows File Explorer.
2. Click the Run button and select Run Synthesis (or press F11 on your keyboard). 
3. (*) Click the Run Implementation button to start building the implementation for the Nexys4.



To prepare image files to program your design into the Arty, do the following:

4. (*) Click the Generate Bitstream button. This generates the .bit file that you can download to the board to make it work.
5. Use the Hardware Manager.
6. If the hardware manager wasn't open yet, it will say "No hardware target is open"; click "Open Target". This will pop up a dialog where you can choose "Auto Connect". You should then see a hardware tree with "localhost" at the top and the type number of the FPGA underneath.


To download an image file, you have two options:
- Programming the FPGA with JTAG (via USB): This is a fast programming method, but your design doesn't get stored in Flash, so when you power the Nexys4 down and then up again, the FPGA will execute what's in the Flash ROM.
- Programming the Flash ROM via USB stores your design in nonvolatile memory so that it automatically gets loaded and executed when you power the Nexys4 down and then up again. But this takes much longer than JTAG programming.


Please refer to the instructions at https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/reference-manual to download the design to the Nexys4.

Have fun!


(*) Vivado tries to guess what you are doing, and at the end of each operation it will suggest the next step. The choices marked with '(*)' in the instructions above can also be started by selecting the appropriate option from the suggestion popup.
