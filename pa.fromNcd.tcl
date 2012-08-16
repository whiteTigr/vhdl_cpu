
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name vhdl_cpu -dir "D:/XProjects/vhdl_cpu/planAhead_run_1" -part xc3s400tq144-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/XProjects/vhdl_cpu/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/XProjects/vhdl_cpu} }
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/XProjects/vhdl_cpu/top.ncd"
if {[catch {read_twx -name results_1 -file "D:/XProjects/vhdl_cpu/top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/XProjects/vhdl_cpu/top.twx\": $eInfo"
}
