# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# Block Designs: bd/system_top/system_top.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top || ORIG_REF_NAME==system_top} -quiet] -quiet

# IP: bd/system_top/ip/system_top_axi_cpu_interconnect_0/system_top_axi_cpu_interconnect_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_axi_cpu_interconnect_0 || ORIG_REF_NAME==system_top_axi_cpu_interconnect_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_const_intr_concat_gnd_0/system_top_const_intr_concat_gnd_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_const_intr_concat_gnd_0 || ORIG_REF_NAME==system_top_const_intr_concat_gnd_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_core_clkwiz_0/system_top_core_clkwiz_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_core_clkwiz_0 || ORIG_REF_NAME==system_top_core_clkwiz_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_intr_concat_0/system_top_intr_concat_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_intr_concat_0 || ORIG_REF_NAME==system_top_intr_concat_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_sys_100m_rstgen_0/system_top_sys_100m_rstgen_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_sys_100m_rstgen_0 || ORIG_REF_NAME==system_top_sys_100m_rstgen_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_sys_core_rstgen_0/system_top_sys_core_rstgen_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_sys_core_rstgen_0 || ORIG_REF_NAME==system_top_sys_core_rstgen_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_sys_cpu_0/system_top_sys_cpu_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_sys_cpu_0 || ORIG_REF_NAME==system_top_sys_cpu_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_s00_regslice_0/system_top_s00_regslice_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_s00_regslice_0 || ORIG_REF_NAME==system_top_s00_regslice_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_auto_cc_0/system_top_auto_cc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_auto_cc_0 || ORIG_REF_NAME==system_top_auto_cc_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_auto_pc_0/system_top_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_auto_pc_0 || ORIG_REF_NAME==system_top_auto_pc_0} -quiet] -quiet

# IP: bd/system_top/ip/system_top_Subsystem_ip_0_0/system_top_Subsystem_ip_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==system_top_Subsystem_ip_0_0 || ORIG_REF_NAME==system_top_Subsystem_ip_0_0} -quiet] -quiet

# XDC: bd/system_top/ip/system_top_core_clkwiz_0/system_top_core_clkwiz_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_core_clkwiz_0 || ORIG_REF_NAME==system_top_core_clkwiz_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_core_clkwiz_0/system_top_core_clkwiz_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_core_clkwiz_0 || ORIG_REF_NAME==system_top_core_clkwiz_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_core_clkwiz_0/system_top_core_clkwiz_0_ooc.xdc

# XDC: bd/system_top/ip/system_top_sys_100m_rstgen_0/system_top_sys_100m_rstgen_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_sys_100m_rstgen_0 || ORIG_REF_NAME==system_top_sys_100m_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_sys_100m_rstgen_0/system_top_sys_100m_rstgen_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_sys_100m_rstgen_0 || ORIG_REF_NAME==system_top_sys_100m_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_sys_core_rstgen_0/system_top_sys_core_rstgen_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_sys_core_rstgen_0 || ORIG_REF_NAME==system_top_sys_core_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_sys_core_rstgen_0/system_top_sys_core_rstgen_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_sys_core_rstgen_0 || ORIG_REF_NAME==system_top_sys_core_rstgen_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_sys_cpu_0/system_top_sys_cpu_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_sys_cpu_0 || ORIG_REF_NAME==system_top_sys_cpu_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_s00_regslice_0/system_top_s00_regslice_0_clocks.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_s00_regslice_0 || ORIG_REF_NAME==system_top_s00_regslice_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_s00_regslice_0/system_top_s00_regslice_0_ooc.xdc

# XDC: bd/system_top/ip/system_top_auto_cc_0/system_top_auto_cc_0_clocks.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==system_top_auto_cc_0 || ORIG_REF_NAME==system_top_auto_cc_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: bd/system_top/ip/system_top_auto_cc_0/system_top_auto_cc_0_ooc.xdc

# XDC: bd/system_top/ip/system_top_auto_pc_0/system_top_auto_pc_0_ooc.xdc

# XDC: bd/system_top/system_top_ooc.xdc
