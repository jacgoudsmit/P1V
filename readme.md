P1V: Parallax Propeller (P8X32A) Emulation on FPGA Boards
===============================================
The Propeller 1 Design is a collection of (System)Verilog source files that describes the hardware of the [Parallax Propeller 1 microcontroller](http://www.parallax.com/microcontrollers/propeller). This source can be compiled and downloaded to a compatible FPGA development board to emulate the Propeller 1 hardware. In fact, this is how the Propeller 1 was designed and tested before silicon was produced.

With this project, you can run the Parallax Propeller 1 design and experiment with modifications in the Verilog hardware description language right on your own workbench.

If you've ever wondered how the Propeller chip actually works, it's all in front of you now, and it is malleable.

For additional information, see the [Propeller 1 Design Wiki](https://github.com/parallaxinc/Propeller_1_Design/wiki) and the [Propeller 1 Open Source](http://www.parallax.com/microcontrollers/propeller-1-open-source) page.

License - GPL General Public License v3
=======================================

The files in the original distribution by Parallax were (C) Copyright 2014-2015 Parallax Inc. 

Many of the files were modified or edited by the contributors whose names are listed in the Revision Notes below. They are (C) Copyright Parallax Inc. and the P1V Contributors.

This repository is produced under the GNU General Public License v3.0. The GPL license grants everyone the freedom to use and modify the software, provided that derived works are distributed under the same license terms. See the included license file for details. 

Supported FPGA Boards
=====================

The Propeller 1 Design files are structured to run on the following development boards. The ones marked "Limited" have some hardware limitations that make it impossible to emulate the full Propeller. It may be possible that in the future, workarounds can be implemented; for example if there's not enough RAM, it may be possible to modify the implementation to use an external RAM chip.

We welcome submissions with support for new hardware! Github pull-requests are preferred, but if you post in the Parallax forums with "P1V" in the subject, you'll get our attention too. 

Altera-based targets:
---------------------

* [Terasic DE2-115](http://www.parallax.com/product/60050) (Altera Cyclone IV)
* [Terasic DE0-Nano](http://www.parallax.com/product/60056) (Altera Cyclone IV) *LIMITED*
* [Arrow BeMicro CV](https://parts.arrow.com/item/detail/arrow-development-tools/bemicrocv) (Altera Cyclone V)
* [Arrow BeMicro CV-A9](http://www.alterawiki.com/wiki/BeMicro_CV_A9) (Altera Cyclone V)
* [Parallax 1-2-3 Board (A7 and A9 versions)](http://forums.parallax.com/discussion/161545) (Altera Cyclone V)

Xilinx-based targets:
---------------------

* [Digilent Arty](https://reference.digilentinc.com/reference/programmable-logic/arty/start) (Xilinx Artix-7 35T)
* [Digilent Nexys4](https://reference.digilentinc.com/reference/programmable-logic/nexys-4/start) (Xilinx Artix-7 100T)

Project Structure
=================

The HDL directory contains all the files you need to turn your supported FPGA board into a Propeller. All targets use roughly the same files, but you have to follow different instructions depending on your hardware. Please browse the Documentation directory to find specific instructions for your board. Note: some targets have PDF files produced by Parallax, but the instructions in those PDF files are outdated. The reason is that it's harder to edit PDF files than text files. The readme.txt files should be the most accurate.

These are the most important files, the hierarchy of relationships, and the functions of each module:

* altera_clock.sv: Master clock generator for Altera targets
* xilinx_clock.sv: Master clock generator for Xilinx targets
* reset.sv: Generates synchronous reset from asynchronous input
* dig.v: Top level module of the actual Propeller
  * hub.v: Hub logic
     * hub_mem.v: RAM and ROM in the hub
  * cog.v: Cog logic for each cog (this is instantiated 8 times)
     * cog_alu.v: Arithmetic/Logic Unit
     * cog_ctr.v: Counters/timers (instantiated 2x per cog)
     * cog_ram.v: Cog RAM
     * cog_vid.v: Video logic
 
By default, the emulated P8X32A will behave exactly like a real Propeller chip with a 5MHz crystal connected to the XI pin. This allows normal 80MHz operation when PLL16X is used. You can program the 'chip' via any Propeller development software (like Propeller Tool, PropellerIDE, or SimpleIDE) by plugging a [Prop Plug](http://www.parallax.com/product/32201) onto the pins as described in the readme.txt for your board. On some boards, the onboard USB serial connection substitutes for the Prop Plug so no additional hardware is necessary.

On most FPGA boards, there is no EEPROM available (or it's not big enough) so you can't use the "Download to EEPROM" option from the various Propeller tools, so you'll have to run your Propeller program from the internal RAM. The good news is that P1V gives you the opportunity to replace the boot loader with your own, so you can let your virtual Propeller boot from Flash ROM or an SD card adapter. Or you can make your application be part of the FPGA bit stream, and change the boot loader to jump straight into your program. All of this is not really documented, but if you need help, ask in the forums.

The Spin directory contains the original source files for the code in the P8X32A's ROM. They were created with an early version of the development tools, so they might not compile correctly. For example, you will have to put a 'PUB *anyname*' at the top before compiling some of the files. They are not directly executable, but are provided to show you what went into the ROM:

* interpreter.spin - begins at $F004
* booter.spin - begins at $F800
* runner.spin - butts up against $FFFF

Another file in that directory called cogledtest.spin can be downloaded to the FPGA to verify that the Propeller is working: it simply starts all cogs in succession so you should see the LEDs on your board light up one by one.

Code of Conduct
===============

Everyone is invited to use the sources in whichever way they see fit. If you want to build your own project based on an FPGA that runs this code with or without your modifications, you're free to do so. However, if you're going to make your project available to others, you should follow the rules of the GPL: you should make the source code available to the people to whom you distribute your project.

The easiest way to make your changes available and to make it easy for yourself to integrate awesome changes that others have made, is to fork the Github repository and make your changes in your fork. Others can then make their own forks off your project. But to maintain a minimum amount of order, let's define some rules:

The "rel" (Release) branch emulates a real Propeller 1
------------------------------------------------------
If a user checks out the "rel" branch and follows the instructions to compile the project for their target hardware, it should always produce a virtual Propeller that's as close to the original as possible. It should act like a real Propeller running with a 5MHz crystal, resulting in an 80MHz internal clock speed in PLL16X mode.

The internal architecture will match the Propeller as much as possible too.

Any unavoidable deficiencies where the emulation can't match the original must be documented; for example, the DE0-Nano doesn't emulate the character ROM area in the hub.

No tabs in source files
------------------------
Source files should contain only spaces, no tab characters. Tabs date from a time when printers were slow, memories were small and mass storage was expensive. In the 21st century, all they are is a source of disagreement, so we don't use them.

All tabs from the original 2014 distribution from Parallax have been eliminated (except in some generated files that aren't intended for editing), and you should not introduce any new ones. To make sure that you don't, make sure your editor settings are correct before you make any changes. For example in the Altera Quartus II tool, open any source file and click on the Tools | Options | Text Editor menu. Make sure that "Insert Space on Tab" is enabled. The "Tab Size (in Spaces)" should be set to 4, which is our indentation size.

No unnecessary files in the Git repository
------------------------------------------
Files that are normally generated by the tools have no place in source control. Any file that you add to your own repository will be tracked by everyone who will ever use that repository, and this can waste a lot of time, space and bandwidth for binary files, even if you delete the file later. After all, Git was designed so that every computer who has a clone of your repo, also has the entire history of that repo.

When you submit your files to Github, make sure that no unnecessary files are checked in. We try to maintain a .gitignore file to prevent unneeded files from ending up in source control, but this rule also applies to changes that are automatically entered into the files by the tools. For example, if you only install support for the Cyclone IV in Quartus because you own Cyclone IV based hardware, and you open a project file that has Cyclone V based projects in it, Quartus converts all projects to Cyclone IV because that's what it knows. If you would allow Github to store this change, your build might work fine but others who use another project in the file won't be able to build the project for *their* hardware anymore. Please review your changes before you check them in.

You should use tools that can help you with this. The [Github tool for Windows](https://windows.github.com/) is adequate, but there are other tools available that (arguably) do a better job of letting you review your changes, such as [GitExtensions](http://sourceforge.net/projects/gitextensions/).

Respect other developers
------------------------
[The Parallax forums](http://forums.parallax.com) where this project originates, are a friendly place where everyone respects each other. The P1V maintainers will continue this great tradition here. While most of the developers in the P1V community may work with Windows, we don't want to discriminate against those who use Linux or OS/X, so you should avoid using any tools that can't be used on other operating systems besides the one you're using.

Also, while English is spoken here, you should keep in mind that not everyone is in the USA, so we should avoid confusion with international issues like date/time formats. The international date format is YYYY-MM-DD.

Revision Notes
==============

* 2017-10-28 - (Jac Goudsmit) Added Parallax FPGA-123 (A9) target.
* 2017-10-28 - (Jac Goudsmit) Modified all targets to use Chip Gracey's original "dig.v" architecture.
* 2017-10-17 - (Andy Silverman) Added features to the Nexys4 build, to allow using some of the on-board hardware like a Propeller Demo board. Thanks Andy!
* 2017-10-12 - (Jac Goudsmit) Altera targets split into separate project files; reorganized documentation.
* 2017-10-11 - (Jac Goudsmit) Modified DE0-Nano to use the "p1v" architecture. Many thanks to Ray Rodrick (Cluso99), Brian Dennis (Ozpropdev), (Tubular), (Blittled), (Heater) for your help! 
* 2017-09-06 - (Andy Silverman) Added support for Digilent Nexys4 (Artix -7 100T)
* 2017-09-01 - (Andy Silverman) Contributed a small change in the declaration of cog memory, which makes the Xilinx Vivado tool use block RAM instead of LUTs as cog RAM. This change allows full support of 8 cogs on the Digilent Arty, with room to spare. Thanks Andy!
* 2016-11-24 - (Jac Goudsmit) Added limited support for the Digilent Arty (Xilinx Artix-7 35T)
* 2016-11-21 - (Chip Gracey) Fixed out-of-order 'reg'/'wire" declarations that caused trouble with generic Verilog compilers.
* 2015-07-31 - (Rick Post (MindRobots)) Added FPGA123-A7 target.
* 2015-07-26 - (Jac Goudsmit) Added BeMicroCV-A9 target, updated documentation.
* 2015-07-22 - (Jac Goudsmit) Fixed bug in PLL simulator ('&' in original source should be '|')
* 2015-02-08 - (Seairth Jacobs) Added SDC files for DE0-Nano and DE2-115.
* 2015-01-13 - (Jac Goudsmit) De-tabbed all source files, merged all sources into one directory to reduce maintenance effort, updated documentation.
* 2014-08-11 - (Parallax) Fixed bug in reset for dira register (cog.v). Added support for the BeMicroCV board.
* 2014-08-06 - (Parallax) First public release.
