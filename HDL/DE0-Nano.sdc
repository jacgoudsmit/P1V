##
## DEVICE  "EP4CE22F17C6"
##

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************

create_clock -name CLOCK_50 -period 20.000 [get_ports {CLOCK_50}]

# virtual clock for I/O (matches cog_clock)
create_clock -name clock_io -period 12.500

#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks

# Generated automatically by derive_pll_clocks
# create_generated_clock -source {altera_|pll|auto_generated|pll1|inclk[0]} -divide_by 5 -multiply_by 16 -duty_cycle 50.00 -name {altera_|pll|auto_generated|pll1|clk[0]} {altera_|pll|auto_generated|pll1|clk[0]}

create_generated_clock -name cog_clk -source [get_pins {altera_|pll|auto_generated|pll1|clk[0]}] -divide_by 2 [get_registers { p1v:p1v_|tim:clkgen|divide[12] }]

create_generated_clock -name pll0a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[0].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll0b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[0].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll1a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[1].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll1b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[1].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll2a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[2].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll2b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[2].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll3a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[3].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll3b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[3].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll4a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[4].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll4b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[4].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll5a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[5].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll5b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[5].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll6a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[6].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll6b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[6].cog_|cog_ctr:cog_ctrb|pll
create_generated_clock -name pll7a -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[7].cog_|cog_ctr:cog_ctra|pll
create_generated_clock -name pll7b -source [get_nets {p1v_|clkgen|clk_pll}] -divide_by 2 p1v:p1v_|dig:core|cog:coggen[7].cog_|cog_ctr:cog_ctrb|pll

#**************************************************************
# Set Clock Latency
#**************************************************************

#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************

# The min/max delays are set to zero, so that TimeQuest doesn't
# input port timing into account.
set_input_delay -clock clock_io -min 0 [get_ports {GPIO0* GPIO1*}]
set_input_delay -clock clock_io -max 0 [get_ports {GPIO0* GPIO1*}]

#**************************************************************
# Set Output Delay
#**************************************************************

# The min/max delays are set to zero, so that TimeQuest doesn't
# output port timing into account.
set_output_delay -clock clock_io -min 0 [get_ports {LED* GPIO0* GPIO1*}]
set_output_delay -clock clock_io -max 0 [get_ports {LED* GPIO0* GPIO1*}]

#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -exclusive \
    -group { CLOCK_50 altera_|pll|auto_generated|pll1|clk[0] cog_clk}

#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_clocks {pll*}] -to clock_io
set_false_path -from [get_ports {KEY[0]}]

#**************************************************************
# Set Multicycle Path
#**************************************************************

#**************************************************************
# Set Maximum Delay
#**************************************************************

#**************************************************************
# Set Minimum Delay
#**************************************************************

#**************************************************************
# Set Input Transition
#**************************************************************

