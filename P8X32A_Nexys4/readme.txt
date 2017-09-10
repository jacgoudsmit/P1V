The Nexys4 by Diligent Inc. is a great FPGA board targeted for students. It has a Xilinx Artix-7 100T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/nexys-4/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The Propeller consumes about 18% of the FPGA's logic/FF slices and about 15% of available Block RAM.  There's therefore plenty of available space to rewire the Propeller I/Os internally to additional logic, or to connect unused pins externally to onboard peripherals or PMOD headers.

The default constraints wire up several Prop pins to the onboard VGA output. LEDs are also provided to indicate active cogs, and the CPU_RESET button to allow a manual reset of the Propeller. (DTR via the simulated Prop Plug also resets the Propeller as expected, i.e. "RTS" in the Parallax Serial Terminal.) Use of the onboard audio output jack or other peripherals is left as an exercise for the reader.

For now you can only run your Propeller software from RAM. Since the Nexys4 does support microSD, it seems reasonable to think that with a little work it should be possible to use the Propeller Tool to "save" your software to the SD card, or some region of the QSPI memory on the board.

You will need the Vivado software from Xilinx. The free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware. There is also plenty of room to add the Vivado ILA debug core, if needed to allow debugging of internal signals as needed.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files

To build the Propeller, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Nexys4.xpr file in the HDL directory, or just double click the file in the Windows File Explorer.
2. (*) Click the Run Synthesis button. 
3. (*) Click the Run Implementation button to start building the implementation for the Nexys4 (if you just finished the Run Synthesis step, the program will ask you if this is what you want to do next).
3. (*) Click the Generate Bitstream button. This generates the file that you can download to the board to make it work.
4. Use the Hardware Manager and click Open Target. It will ask you to auto-detect. Once the device is open you can click Program Device. The bitstream that was just created will typically be chosen automatically.  Click Program to download the code to the board.

(*) Instead of doing the steps separately, you can also click the Generate Bitstream button. If the synthesis and implementation are out of date, Vivado will automatically take care of those first, after it asks for confirmation.  Also note that some versions of Vivado are prone to toss a lot of warnings about removing unused elements or about possible excess power consumption. These can safely be ignored.

5. You can use the Propeller Tool and/or the Parallax Serial Terminal at this point to communicate over the already-attached USB cable with the Propeller chip.