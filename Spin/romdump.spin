'' +--------------------------------------------------------------------------+
'' |  Cluso's:       Dump Propeller P8X32A ROM                          v0.10 |
'' +--------------------------------------------------------------------------+
'' |  Purpose:       To Dump the Propeller P8X32A internal ROM $8000-FFFF     |
'' |  Authors:       (c)2014 "Cluso99" (Ray Rodrick)                          |
'' |  License:       MIT License (for this program only)                      |
'' |                   - See end of file for terms of use                     |
'' |  WARNING: The actual ROM code is Copyright by Parallax www.parallax.com  |
'' +--------------------------------------------------------------------------+
'' Notes: Modify the "Dump" subroutine to dump the section(s) required.
''        Many thanks to Chip and Parallax for information provided about the ROM code.
''
'' RR20140811  v0.10    Commence
'' RR20140815  v0.20    Dump in Verilog Hex format $F000..FFFF (not scrambled)
''             v0.21    Verilog doesn't like the @xxxx address parameter so remove
'' RR20140816  v0.22    Simple dump longs (works) (Note need to dump in $800 blocks)
''             v0.25    Dump to file in suitable format for verilog (minor editing reqd)


CON
        _clkmode = xtal1 + pll16x                                               'Standard clock mode * crystal frequency = 80 MHz
        _xinfreq = 5_000_000
'       _xinfreq = 6_500_000                                                    ' 104MHz


        RAMBASE  = $0000                        ' RAM               $0000..7FFF  
        ROMBASE  = $8000                        ' ROM               $8000..FFFF
        RAMSIZE  = 8192 'longs                  ' RAM:              $0000..7FFF                       
        FONTSIZE = 4096 'longs                  ' ROM: FONT         $8000..BFFF                       
        LOGSIZE  = 1024 'longs                  ' ROM: LOG          $C000..CFFF 2048 words            
        ALOGSIZE = 1024 'longs                  ' ROM: ANTILOG      $D000..DFFF 2048 words            
        SINESIZE = 1025 'longs                  ' ROM: SINE         $E000..F002 2049 words + 1 filler 
'       INTERPSZ =                              ' ROM: Interpreter  $F004..F7A3  488 longs  (scrambled)           
'       BOOTERSZ =                              ' ROM: Booter       $F800..FB93  229 longs  (scrambled)           
'       RUNNERSZ =                              ' ROM: Runner       $FF70..FFFF   36 longs                     

 
OBJ
  fdx   : "FullDuplexSerial"

VAR
    
PUB Start

  waitcnt(cnt + (5 * clkfreq))                          ' wait 5s
  fdx.Start(31, 30, %0000, 115200)
  waitcnt(cnt + (1 * clkfreq))                          ' wait 1s
  fdx.tx(0)                                             ' cls
  fdx.tx(1)                                             ' home
  waitcnt(cnt + (5 * clkfreq))                        
' fdx.Str(string("Dump begin...",13,13))
' waitcnt(cnt + (1 * clkfreq))
  
  Dump
  
' waitcnt(cnt + (1 * clkfreq))
' fdx.Str(string(13,"Dump end.", 13))
  waitcnt(cnt + (1 * clkfreq))                          
  fdx.Stop

PRI Dump | i, n, x
' Dump the Propeller P8X32A ROM in Verilog format
  filler    := false
  scrambled := false

{{
' ------------------------------------------------------------------------------------
  fdx.str(string(13,13,"// FONT $8000..$BFFF",13))
  DumpBlock($8000, $BFFF)                               ' dump FONT
' ------------------------------------------------------------------------------------
  fdx.str(string("// LOG $C000..$CFFF",13))
  DumpBlock($C000, $CFFF)                               ' dump LOG
' ------------------------------------------------------------------------------------
  fdx.str(string("// ANTILOG $D000..$DFFF",13))
  DumpBlock($D000, $DFFF)                               ' dump ALOG
' ------------------------------------------------------------------------------------
  fdx.str(string("// SINE $E000..$F003",13))            ' SINE is 2049 words ($F002-3 is filler)                          
  DumpBlock($E000, $F003)                               ' dump SINE
' ------------------------------------------------------------------------------------

{{
' When the above is not inserted, we need to fill $F000-$F001 with the last SINE value
' ------------------------------------------------------------------------------------
  fdx.str(string("// END-OF-SINE $F000..$F003",13))     ' SINE is 2049 words ($F002-3 is filler)                          
  DumpBlock($F000, $F003)                               ' dump SINE
' ------------------------------------------------------------------------------------
}}

{{
' ------------------------------------------------------------------------------------
  fdx.str(string("// INTERPRETER $F004..$F7A3",13))
  scrambled := true                                     ' unscramble
  DumpBlock($F004, $F7A3)                               ' dump INTERPRETER
' ------------------------------------------------------------------------------------
  fdx.str(string("// FILLER $F7A4..$F7FF",13))
  filler := true
  DumpBlock($F7A4, $F7FF)                               ' dump FILLER
' ------------------------------------------------------------------------------------
}}

  fdx.str(string("// BOOTER $F800..$FB93",13))
  scrambled := true                                     ' unscramble
  DumpBlock($F800, $FB93)                               ' dump BOOTER
' ------------------------------------------------------------------------------------
  fdx.str(string("// FILLER $FB94..$FEFF",13))
  filler := true
  DumpBlock($FB94, $FEFF)                               ' dump FILLER
' ------------------------------------------------------------------------------------
  fdx.str(string("// COPYRIGHT $FF00..$FF5F",13))
  DumpBlock($FF00, $FF5F)                               ' dump RUNNER
' ------------------------------------------------------------------------------------
  fdx.str(string("// FILLER $FF60..$FF6F",13))
  filler := true
  DumpBlock($FF60, $FF6F)                               ' dump FILLER
' ------------------------------------------------------------------------------------
  fdx.str(string("// RUNNER $FF70..$FFFF",13))
  DumpBlock($FF70, $FFFF)                               ' dump RUNNER
' ------------------------------------------------------------------------------------

  fdx.tx(13)
  
PRI DumpBlock (i, i2) | blocks
  blocks := (i2+1+3 - i)/4                            ' bytes/4
  repeat blocks                                       ' dump longs
    if filler
      quad[0] := 0
    elseif scrambled
      quad[0] := unscramble(long[i])
    else
      quad[0] := long[i]
    fdx.hex(quad[0],8)
    fdx.tx(13)
    i += 4
    waitcnt(cnt + (clkfreq/100))                          
  filler    := false
  scrambled := false


PRI Unscramble(r)
  result := (((r>>03)&1)<<31) | (((r>>07)&1)<<30) | (((r>>21)&1)<<29) | (((r>>12)&1)<<28)
  result |= (((r>>06)&1)<<27) | (((r>>19)&1)<<26) | (((r>>04)&1)<<25) | (((r>>17)&1)<<24)
  result |= (((r>>20)&1)<<23) | (((r>>15)&1)<<22) | (((r>>08)&1)<<21) | (((r>>11)&1)<<20)
  result |= (((r>>00)&1)<<19) | (((r>>14)&1)<<18) | (((r>>30)&1)<<17) | (((r>>01)&1)<<16)
  result |= (((r>>23)&1)<<15) | (((r>>31)&1)<<14) | (((r>>16)&1)<<13) | (((r>>05)&1)<<12)
  result |= (((r>>09)&1)<<11) | (((r>>18)&1)<<10) | (((r>>25)&1)<<09) | (((r>>02)&1)<<08)
  result |= (((r>>28)&1)<<07) | (((r>>22)&1)<<06) | (((r>>13)&1)<<05) | (((r>>27)&1)<<04)
  result |= (((r>>29)&1)<<03) | (((r>>24)&1)<<02) | (((r>>26)&1)<<01) | (((r>>10)&1)<<00)
   

DAT
scrambled     long      0       ' true/false
filler        long      0       ' true/false
quadb         byte              '\\keep together
quad          long      0[4]    '//

DAT
''==============================================================================================================
{{
+------------------------------------------------------------------------------------------------------------------------------+
|                                                   TERMS OF USE: MIT License                                                  |                                                            
+------------------------------------------------------------------------------------------------------------------------------+
|Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    | 
|files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    |
|modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software|
|is furnished to do so, subject to the following conditions:                                                                   |
|                                                                                                                              |
|The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.|
|                                                                                                                              |
|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          |
|WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         |
|COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   |
|ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         |
+------------------------------------------------------------------------------------------------------------------------------+
}}

  