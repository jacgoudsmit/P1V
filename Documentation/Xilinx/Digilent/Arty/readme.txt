The Arty by Diligent Inc. is a great FPGA board targeted for Makers. It has a Xilinx Artix-7 35T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/arty/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The FPGA on this board has 33280 LE's in 5200 slices. The Propeller takes up about 40% of its space.

There is no EEPROM on board, so for now you can only run your Propeller software from RAM. There's also no SD card adapter so you'll have to work around this in some other way. The FPGA does have access to the Flash ROM from which the bit stream is loaded, so in theory it may be possible to work around this by replacing the Propeller boot loader.

You will need the Vivado software from Xilinx. The Arty comes with a card that has a license key for older versions, but you don't need it: the free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files

To build the Propeller, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Arty.xpr file in the HDL directory.
2. (*) Click the Run Synthesis button. 
3. (*) Click the Run Implementation button to start building the implementation for the Arty (if you just finished the Run Synthesis step, the program will ask you if this is what you want to do next).
3. (*) Click the Generate Bitstream button. This generates the file that you can download to the board to make it work.
4. Use the Hardware Manager and click Open Target. It will ask you to auto-detect. Once the device is open you can click Program Device. Browse to HDL/P1V_Arty.runs/impl_1/arty.bit for the bitstream file and click OK. We didn't provide a Debug Probes File but you can create one yourself. Click Program to download the code to the board.

(*) Instead of doing the steps separately, you can also click the Generate Bitstream button. If the synthesis and implementation are out of date, Vivado will automatically take care of those first, after it asks for confirmation.