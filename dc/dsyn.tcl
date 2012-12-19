########## Boilerplate ##########################################
# Standard System Level Settings. Do not change.
#################################################################

set SynopsysInstall [getenv "SYNOPSYS"]
set stdcellhome /sim/synopsys/SAED_EDK90nm/Digital_Standard_Cell_Library/
set design_db  $stdcellhome/synopsys/models/saed90nm_typ.db
set mw_ref_lib $stdcellhome/process/astro/gds-as/saed90nm_dv
#set astro_tf   $stdcellhome/process/astro/tech/astroTechFile.tf
set max_tlu    $stdcellhome/process/starrcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus
set min_tlu    $stdcellhome/process/starrcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus
set mapf       $stdcellhome/process/star_rcxt/saed90nm.map

set astro_tf /sim/synopsys/SAED_EDK90nm/Technology_Kit/techfile/saed90nm_icc_1p9m.tf

set mw_logic1_net "VDD"
set mw_logic0_net "VSS"

set search_path [list . [format "%s%s" $SynopsysInstall /dw/sim_ver]]
set target_library  $design_db
set synthetic_library [list dw_foundation.sldb]
set link_library [concat [concat "*" $target_library] $synthetic_library]
set symbol_library [list generic.sdb]

#   Controls  whether  a  warning  message  is  issued if a latch is
#   inferred from a design.
set hdlin_check_no_latch true
define_design_lib WORK -path ./WORK

##################################################################
# below are parameters that you will want to set for each design 
##################################################################

set RTL_PATH  "../rtl/router/"
set myFiles [glob $RTL_PATH/*]
set fileFormat sverilog              ;# verilog or sverilog
set basename top_router                     ;# Top-level module name
set CLK "clk"                  ;# The name of your clock 
set virtual 0                        ;# 1 if virtual clock, 0 if real clock

# Timing and loading information                
set clkPeriod_ns 2     ;# desired clock period (in ns) 

# Input delay tells DC how long after the clock before an input becomes
# valid. 
set inDelay_ns [expr $clkPeriod_ns*.1]  ;# delay from clock to inputs valid
set outDelay_ns [expr $clkPeriod_ns*.1] ;# delay from clock to output valid
set inputDrive INVX16 
set LoadLib $design_db         ;# name of library the cell comes from
set myLoadPin "INP"             ;# name of pin that the outputs drive
set CLK_SKEW [expr $clkPeriod_ns*.1]
set CLK_JITTER [expr $clkPeriod_ns*0.1]

# Create MW library

set MW_LIB_NAME [format "%s%s" $basename "_LIB"]
create_mw_lib -technology $astro_tf -mw_reference_library $mw_ref_lib $MW_LIB_NAME
open_mw_lib $MW_LIB_NAME
check_library

# Control the writing of result files               
set STAGE synth                ;# Name appended to output files

# the following control which output files you want. They   
# should be set to 1 if you want the file, 0 if not     
set write_v 1           ;# compiled structural Verilog file
set write_ddc 1         ;# compiled file in ddc format (XG-mode)
set write_sdf 1         ;# sdf file for back-annotated timing sim
set write_sdc 1         ;# sdc constraint file for place and route
set write_rep 1         ;# report file from compilation
set write_pow 1         ;# report file for power estimate
set write_ref 1         ;# report file for power estimate

# compiler switches...                  
set useUltra 1                      ;# 1 for compile_ultra, 0 for compile
                                     # mapEffort, useUngroup are for    
                                     # non-ultra compile...         
set mapEffort1      high            ;# First pass - low, medium, or high
set mapEffort2      high            ;# second pass - low, medium, or high
set useUngroup 1                    ;# 0 if no flatten, 1 if flatten

#*********************************************************
#*   below here shouldn't need to be changed...          *
#*********************************************************

# analyze and elaborate the files 
analyze -format $fileFormat -lib WORK $myFiles
elaborate $basename -lib WORK -update
current_design $basename

# The link command makes sure that all the required design 
# parts are linked together.                   
# The uniquify command makes unique copies of replicated   
# modules.                          
link
uniquify

# now you can create clocks for the design                 
# and set other constraints                                
if {  $virtual == 0 } {
   create_clock -period $clkPeriod_ns $CLK
} else {
   create_clock -period $clkPeriod_ns -name $CLK
}


# Set the driving cell for all inputs except the clock     
# The clock has infinite drive by default. This is usually  
# what you want for synthesis because you will use other   
# tools (like SOC Encounter) to build the clock tree        
# (or define it by hand).              
if {  $virtual == 0 } {
    set_driving_cell  -library $LoadLib -lib_cell $inputDrive -pin "ZN" [all_inputs] \
} else {
   set_driving_cell  -library $LoadLib -lib_cell $inputDrive  \
         [remove_from_collection [all_inputs] $CLK]
}

# set the input and output delay relative to CLK         
if {  $virtual == 0 } {
    set_input_delay $inDelay_ns -clock $CLK [all_inputs] \
} else {
    set_input_delay $inDelay_ns -clock $CLK \
     [remove_from_collection [all_inputs] $CLK]
}
set_output_delay $outDelay_ns -clock $CLK [all_outputs]

# set the load of the circuit outputs in terms of the load 
# of the next cell that they will drive, also try to fix   
# hold time issues                     
set_load [load_of [format "%s%s%s%s%s" $LoadLib "/" $inputDrive "/" $myLoadPin]] [all_outputs]
set_fix_hold $CLK

# This command will fix the problem of having             
# assign statements left in your structural file.         
# But, it will insert pairs of inverters for feedthroughs!
#set_fix_multiple_port_nets -all -buffer_constants

#   
check_design

##################################################################
# Check for design errors
# Designer should examine log file, look for:
#   - inferred latches not in syn.lib
#   -  fanout nets other than clk
##################################################################


# now compile the design with given mapping effort        
# and do a second compile with incremental mapping        
# or use the compile_ultra meta-command        
if {  $useUltra == 1 } {
   compile_ultra
} else {
   if {  $useUngroup == 1 } {
     compile -ungroup_all -map_effort $mapEffort1
     compile -incremental_mapping -map_effort $mapEffort2
  } else {
     compile -map_effort $mapEffort1
     compile -incremental_mapping -map_effort $mapEffort2
  }
}

report_constraint -all_violators

#************************************************************
#* now write out the results                                *
#************************************************************

set filebase [format "%s%s" [format "%s%s" $basename "_"] $STAGE] 

# structural (synthesized) file as verilog                 
if {  $write_v == 1 } {
    set filename [format "%s%s" $filebase ".v"]
    write -format verilog -hierarchy -output $filename
}

# write out the sdf file for back-annotated verilog sim    
# This file can be large!                   
if {  $write_sdf == 1 } {
    set filename [format "%s%s" $filebase ".sdf"]
    write_sdf -version 1.0 $filename
}

# this is the timing constraints file generated from the   
# conditions above - used in the place and route program   
if {  $write_sdc == 1 } {
    set filename [format "%s%s" $filebase ".sdc"]
    write_sdc $filename
}

# synopsys database format in case you want to read this               
# synthesized result back in to synopsys later in XG mode (ddc format) 
if {  $write_ddc == 1 } {
    set filename [format "%s%s" $filebase ".ddc"]
    write -format ddc -hierarchy -output $filename
    set mw_filename [format "%s%s" $filebase "_DCT"]
    write_milkyway -overwrite -output $mw_filename
}

# report on the results from synthesis                     
# note that > makes a new file and >> appends to a file    
if {  $write_rep == 1 } {
    set filename [format "%s%s" $filebase ".rep"]
    redirect $filename { report_timing }
    redirect -append $filename { report_area }
}

# report the power estimate from synthesis.             
if {  $write_pow == 1 } {
    set filename [format "%s%s" $filebase ".pow"]
    redirect $filename { report_power }
}

if {  $write_ref == 1 } {
    set filename [format "%s%s" $filebase ".ref"]
    redirect $filename { report_reference -nosplit -hierarchy }
}

quit
