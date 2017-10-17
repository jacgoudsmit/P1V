The Nexys4 by Diligent Inc. is an FPGA board designed for students. It has a Xilinx Artix-7 100T FPGA. See https://reference.digilentinc.com/reference/programmable-logic/nexys-4/start for more information. We strongly recommend you do some of the Digilent tutorials to get a feeling of how Vivado works. They will also tell you how to connect your board and make it work (you may need to change some jumpers).

The Propeller consumes about 18% of the FPGA's logic/FF slices and about 15% of available Block RAM.  There's therefore plenty of available space to rewire the Propeller I/Os internally to additional logic, or to connect unused pins externally to onboard peripherals or PMOD headers.

The default constraints are designed to emulate most of the Propeller Demo Board. The leftmost toggle switches offer several behavior options.
With all switches set low, you will get the following behavior:
1. LEDs 0-7 show which cogs are active in real time.
2. LEDs 8-15 emulate the LEDs on the demo board on simulated pins 16-23.
3. The onboard VGA output is connected to simulated pins 16-23 as well, so most of the VGA demo programs included in the Propeller Demo Library will execute without modification.
4. The mono headphone amplifier is connected to simulated pin 10.  (Pin 11, which is used in some Propeller sound demos is not connected.) The headphone amplifier will be enabled whenever pin 10 is set to an output.
5. The emulated PS2 Clock and Data lines from the PIC Microcontroller are connected to simulated pins 24 and 25 to emulate the mouse port on the demo board. (Untested).

By changing some of the switches, alternate configurations can be enabled in real time. (No reset is necessary.)
- When SW15 (the left-most switch) is low, simulated pins 30/31 are connected to the onboard USB UART and the incoming RTS signal is treated as a reset.  This allows the Propeller to be programmed from the Propeller Tool as a virtual com port over the same cable used for JTAG FPGA programming with no extra hardware.
- When SW15 is high, a real "Propeller Plug" can be connected to Pmod D on the top row using a male-to-male header pin adapter, one pin over from the left edge. (i.e. GND, and data pins 4, 3 and 2 as Reset, Tx, and Rx respectively as labeled on the plug.)
- SW14 set high allows Pmod B data pin 2 to behave as an ordinary I/O pin for simulated pin 10, rather than directing the I/O to the headphone amplifier.
- SW13 set high redirects virtual pins 16-23 to Pmod C pins 1-4 and 5-8 rather than to the onboard VGA output, so that they may be used as ordinary  I/Os.
- SW12 set high redirects the onboard emulated PS2 Clock and Data lines to virtual pins 26 and 27 to simulate the demo board's PS2 keyboard input, rather than the mouse. (Untested.)

At all times:
1. The CPU_RESET button allows a manual reset of the Propeller.
2. PMOD D data pins 7 and 8 are set as pins 29 and 28 respectively (reversed), so that an I2C EEPROM can be used for permanent Propeller program storage.  
For example, the "YL-90" board is cheaply available on Ebay for a few dollars from Chinese sellers, as a small header board with Vcc and Gnd inputs in addition to the 2 I2C pins and works perfectly.
3. PMOD A is always used for Propeller pins 0-7.

Without the extra EEPROM, you can still run your Propeller software from RAM. Since the Nexys4 does support microSD, it seems reasonable to think that with a little work it should also be possible to use the Propeller Tool to "save" your software to the SD card, or some region of the QSPI memory on the board.

You will need the Vivado software from Xilinx. The free (as in beer) Vivado WebPack Edition works fine and allows you to use all the features, without being locked to a specific computer or specific FPGA hardware. There is also plenty of room to add the Vivado ILA debug core, if needed to allow debugging of internal signals as needed.

After you download and install Vivado, you will also need to install the Digilent board support files; see here for more information: https://reference.digilentinc.com/reference/software/vivado/board-files

To build the P1V project, follow these steps:

1. Click "Open Project" (or use the menu to do the same), select the P1V_Nexys4.xpr file in the HDL directory, or just double click the file in the Windows File Explorer.
2. Click the Run button and select Run Synthesis (or press F11 on your keyboard). 
3. (*) Click the Run Implementation button to start building the implementation for the Nexys4.



To prepare image files to program your design into the Nexys4, do the following:

4. (*) Click the Generate Bitstream button. This generates the .bit file that you can download to the board to make it work.
5. Use the Hardware Manager.
6. If the hardware manager wasn't open yet, it will say "No hardware target is open"; click "Open Target". This will pop up a dialog where you can choose "Auto Connect". You should then see a hardware tree with "localhost" at the top and the type number of the FPGA underneath.


To download an image file, you have two options:
- Programming the FPGA with JTAG (via USB): This is a fast programming method, but your design doesn't get stored in Flash, so when you power the Nexys4 down and then up again, the FPGA will execute what's in the Flash ROM.
- Programming the Flash ROM via USB stores your design in nonvolatile memory so that it automatically gets loaded and executed when you power the Nexys4 down and then up again. While the initial flashing process takes much longer than JTAG programming, subsequent bootups are nearly instantaneous.
- If you decide to program the onboard Spansion Flash, use part number s25fl128sxxxxxx0-spi-x1_x2_x4 in the "Add Configuration Memory Device" dialog.


Please refer to the instructions at https://reference.digilentinc.com/reference/programmable-logic/nexys-4-ddr/reference-manual to download the design to the Nexys4.

Have fun!


(*) Vivado tries to guess what you are doing, and at the end of each operation it will suggest the next step. The choices marked with '(*)' in the instructions above can also be started by selecting the appropriate option from the suggestion popup.
