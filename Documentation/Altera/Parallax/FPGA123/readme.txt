To compile the P8X32A hardware description and load it into the Parallax 1-2-3-FPGA (A7 or A9):

1) Open Quartus II (You will need version 15 or higher).

2) File | Open Project...

3) Select 'P1V_Altera_Cyclone5.qpf' file from the HDL directory

3a) Click Project | Revisions, and make sure the fpga123-A7 or fpga123-A9 revision (whichever applies to your board) is the current revision. If not, click on it, then click Set Current. Click OK to close the dialog.

4) The 1-2-3 FPGA board requires a .rbf file be created by Quartus II. Check to make sure the project is set to create the .rbf file: from the main menu, select Assignments|Device, click on "Device and Pin Options...", click on "Programming Files", make sure "Raw Binary File (.rbf) is checked, click "Ok", click "Ok" and you should be ready to compile the verilog. 

5) Press the 'play' button to start compilation (takes several minutes)

** Unlike other FPGA boards typically used for P1V development, the 1-2-3 FPGA board has a Propeller on it that comes with a loader program pre-installed. It DOES NOT use the Quartus loader to load the FPGA image. You should already have the px.exe program from Parallax set up and tested. Installing px.exe and testing this is beyond this document as your final solution will vary depending on your development system choice. **

6) connect the 1-2-3 FPGA board to your computer with a USB cable and connect a power supply.

7) Set the PGM/RUN switch on the board to PGM, power up the board.

8) run "px.exe <your_output>.rbf /P /n" - replace n with your com port number

9) px.exe will open a status window and send the FPGA image to the board - during loading, your FPGA will continue to run whatever it was last loaded with. The USB lights will flash and the Conf Status light will flash as the new image is downloaded. When complete, the FPGA will reset and your new image will start running on the FPGA

10) Change the PGM/RUN switch to RUN and your P1V should be connected to the USB port, ready to accept your Spin/PASM programs. As released, user LEDs GRN0-GRN7 are used to indicate COG0 through COG7 being active. GRN8-GRN15 are used to indicate COG0 through COG7 being inactive. The 3.3V I/O header on the 1-2-3 FPGA board should map to Propeller pins 0-29 just like a real Propeller. Pins 30 and 31 are "hard wired" in the FPGA configuration to use the USB port for serial I/O.  

11) You can now use your favorite Propeller programming tool to the P8X32A being emulated in the 1-2-3 FPGA board.

Have fun!
