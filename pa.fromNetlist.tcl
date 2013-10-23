
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name CPU -dir "H:/CPE_233/CPE233_Exp_8/CPU_12.4/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "H:/CPE_233/CPE233_Exp_8/CPU_12.4/WRAPPER.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {H:/CPE_233/CPE233_Exp_8/CPU_12.4} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "WRAPPER_CONS.ucf"
add_files "WRAPPER_CONS.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
