########## Boilerplate ##########################################
# Standard System Level Settings. Do not change.
#################################################################

set SynopsysInstall [getenv "SYNOPSYS"]

# Next line defines the location of the standard cell libraries. Std.
# Cells can be aligned in datapaths between power and ground rails. So
# AND, XOR, NOR etc., all have at least one matching dimension.

set stdcellhome /sim/synopsys/SAED_EDK90nm/Digital_Standard_Cell_Library/

# The design library is used by design compiler to performance logic
# optimations.  Technology libraries contain information about the
# characteristics and functions of each cell provided in a semiconductor
# vendors library. Semiconductor vendors maintain and distribute
# the technology libraries. In our case the vendor is Synopsys. Cell
# characteristics include information such as cell names, pin names,
# area, delay arcs, and pin loading. The technology library also defines
# the conditions that must be met for a functional design (for example,
# the maximum transition time for nets).  These conditions are called
# design rule constraints. In addition to cell information and design rule
# constraints, technology libraries specify the operating conditions and
# wire load models specific to that technology. 

set design_db  $stdcellhome/synopsys/models/saed90nm_typ.db

# The next few includes contains backend process parameters. For instance,
# it includes detailed information about the poly and metal layers
# in the  design and the standard cell layouts.  These libraries also
# contain logical information (functionality and timing characteristics)
# for every cell in the library.  Finally, libraries contain technology
# information required for design and fabrication.  

# In a Milkyway library below you will find different views for each
# cell, for example, NOR1.CEL and NOR1.FRAM. CEL is the full layout view,
# and FRAM is the abstract view for place and route operation

set mw_ref_lib $stdcellhome/process/astro/gds-as/saed90nm_dv

# tf - Vendor Technology File. This file contains technology-specific
# information such as the names, characteristics (physical and electrical)
# for each metal layer, and design rules. These information are required
# to route a design.

set astro_tf   $stdcellhome/process/astro/tech/astroTechFile.tf
set mapf       $stdcellhome/process/star_rcxt/saed90nm.map


# TLUPlus models are a set of models containing advanced process ects 
# that can be used by the parasitic extractors in Synopsys place-and-route
# tools. These files are used for extracting parasitics from the 
# design. They are created from the tf file using other synopsys tools.

set max_tlu    $stdcellhome/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus
set min_tlu    $stdcellhome/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus

#   Controls  whether  a  warning  message  is  issued if a latch is
#   inferred from a design.

set search_path [list . [format "%s%s" $SynopsysInstall /dw/sim_ver]]
set target_library  $design_db
set synthetic_library [list dw_foundation.sldb]
set link_library [concat [concat "*" $target_library] $synthetic_library]
set symbol_library [list generic.sdb]

define_design_lib WORK -path ./WORK

set basename cam                     ;# Top-level module name
set CLK "sig.clock"                  ;# The name of your clock 

# Read the milkyway library created during synthesis
set MW_LIB_NAME [format "%s%s" $basename "_LIB"]
open_mw_lib $MW_LIB_NAME
check_library
set_tlu_plus_file -max_tluplus $max_tlu -min_tluplus $min_tlu -tech2itf_map $mapf
check_tlu_plus_files

# Start Physical Synthesis

# Read the synthesized design back into ICC. Specify the top level module
# and save the designs again in milkyway format.
import_designs cam_synth.ddc -format ddc -top cam -cel cam

# Define power and ground, only for the top level
derive_pg_connection -power_net "VDD" -power_pin "VDD" -ground_net "VSS" -ground_pin "VSS" -create_ports "top"

# Create a floor plan. Please look in the ICC UG to understand these
# options further. Basically this produces  a  floorplan  with chip
# boundary, core, rows, and wire tracks.

# For example, an aspect ratio of 1.00 means that the  height  and
# the  width  of  the  core area are the same and the shape
# of the core is a square.

# a core utilization of 0.7 means that 70 percent  of the  core  area
# is  used  for  cell placement and 30 percent is available for routing.

# A smaller row to core ratio means that more space is left for the routing
# channels. A value of 1.0 means no routing channel space.

initialize_floorplan -control_type "aspect_ratio" -core_aspect_ratio "1" -core_utilization "0.7" -row_core_ratio "1"  -left_io2core "30" -bottom_io2core "30" -right_io2core "30" -top_io2core "30"  -start_first_row

# Place all hard macros and leaf cells

create_fp_placement

# Synthesizes power networks or power switch arrays based on user-
# specified constraints. In  a  single  run,  you  can  synthesize either
# a  power network for a single voltage design, power networks for a
# multivoltage design, or a power switch array.

synthesize_fp_rail -power_budget "1000" -voltage_supply "1.2" -target_voltage_drop "250" -output_dir "./pna_output" -nets "VDD VSS" -create_virtual_rails "M1" -synthesize_power_plan -synthesize_power_pads -use_strap_ends_as_pad

commit_fp_rail

# Now do clock tree synthesis

# Let us first analyze this and insert clock buffers to minimize skew

clock_opt -only_cts -no_clock_route
route_zrt_group -all_clock_nets -reuse_existing_global_route true

# Show Clock Tree Clock->Color->Reload->OK

# Let us route everything else; we had to do clock tree first because it is one of the highest fanout nets
route_opt -initial_route_only
route_opt -skip_initial_route -effort low

# Fill in the empty spaces. Depending on the process you plan to fab your
# chip you may have one more task. Some processes use CMP -
# Chemical-Mechanical Polishing to make their circuits more planar during
# fabrication. This process requires a certain density of poly, metal1 and
# metal2 densities. In our sample we fill in the gaps with a bunch of
# fillers.

insert_stdcell_filler -cell_with_metal "SHFILL1 SHFILL2 SHFILL3"

# Do another optimization -- In case there are some Design Rule Errors
route_opt -incremental -size_only

set write_v 1           ;# compiled structural Verilog file
set write_ddc 1         ;# compiled file in ddc format (XG-mode)
set write_sdf 1         ;# sdf file for back-annotated timing sim
set write_sdc 1         ;# sdc constraint file for place and route
set write_rep 1         ;# report file from compilation
set write_pow 1         ;# report file for power estimate
set write_ref 1         ;# report file for power estimate


set STAGE ppr
set filebase [format "%s%s" [format "%s%s" $basename "_"] $STAGE]

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
if {  $write_sdc == 1 } {
      set filename [format "%s%s" $filebase ".sdc"]
          write_sdc $filename
}
set filename [format "%s%s" $filebase ".sbpf"]
write_parasitics -format SBPF -o $filename

set filename [format "%s%s" $filebase ".gds2"]

# Write out the graphic Data Stream Format! YAY!
write_stream $filename

#save_mw_cel
#close_mw_cel
