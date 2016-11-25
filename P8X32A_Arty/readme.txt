The Arty by Diligent Inc. is a great FPGA board targeted for Makers. It has a Xilinx Artix-7 35T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/arty/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

Unfortunately, the FPGA on this board only has 33280 LE's in 5200 slices, which is only enough to emulate 2 cores of the Propeller.

There is no EEPROM on board, so for now you can only run your Propeller software from RAM. There's also no SD card adapter so you'll have to work around this in some other way. The FPGA does have access to the Flash ROM from which the bit stream is loaded, so in theory it may be possible to work around this by replacing the Propeller boot loader.

You will need the Vivado software from Xilinx. The Arty comes with a card that has a license key for older versions, but you don't need it: the free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files

To build the Propeller, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Arty.xpr file in the HDL directory.
2. Click the Run Synthesis button (a green triangle with 3 blue circles on top), which takes a few minutes. 
3. You can click the Run Implementation button (green triangle) to start building the implementation for the Arty (if you just finished the Run Synthesis step, the program will ask you if this is what you want to do next).
3. You can click the Generate Bitstream button (the icon is a green arrow pointing down on a piece of paper). This generates the file that you can download to the board to make it work. The generated file is called HDL/P1V_Arty.runs/impl_1/arty.bit.
4. Follow the instructions from the tutorials to download the bit stream file to the board. 

