# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.runs/synth_1/mb_usb_hdmi_top.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 6
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.cache/wt [current_project]
set_property parent.project_path C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths c:/Users/Yuqi/KOF-94/lab6_1/hdmi_tx_1.0 [current_project]
update_ip_catalog
set_property ip_output_repo c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files C:/Users/Yuqi/KOF-94/lab6_1/scene/scene.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_stand/mai_stand.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_forward/mai_forward.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_back/mai_back.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_punch/mai_punch.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_squat/mai_squat.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/mai_kick/mai_kick.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/kyo_stand/kyo_stand.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/scene1/scene1.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/bg1/bg1.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/bg2/bg2.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/bg3/bg3.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/kyo_forward/kyo_forward.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/kyo_punch/kyo_punch.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/kyo_squat/kyo_squat.COE
add_files C:/Users/Yuqi/KOF-94/lab6_1/kyo_kick/kyo_kick.COE
read_verilog -library xil_defaultlib -sv {
  C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/design_source/Color_Mapper.sv
  C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/design_source/VGA_controller.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg1/bg1.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg1/bg1_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg2/bg2.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg2/bg2_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg3/bg3.sv
  C:/Users/Yuqi/KOF-94/lab6_1/bg3/bg3_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/new/char1.sv
  C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/design_source/hex.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_forward/kyo_forward.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_forward/kyo_forward_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_punch/kyo_punch.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_punch/kyo_punch_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_squat/kyo_squat.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_squat/kyo_squat_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_stand/kyo_stand.sv
  C:/Users/Yuqi/KOF-94/lab6_1/kyo_stand/kyo_stand_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_back/mai_back.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_back/mai_back_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_forward/mai_forward.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_forward/mai_forward_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_kick/mai_kick.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_kick/mai_kick_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_punch/mai_punch.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_punch/mai_punch_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_squat/mai_squat.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_squat/mai_squat_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_stand/mai_stand.sv
  C:/Users/Yuqi/KOF-94/lab6_1/mai_stand/mai_stand_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/scene1/scene1.sv
  C:/Users/Yuqi/KOF-94/lab6_1/scene1/scene1_palette.sv
  C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/design_source/mb_usb_hdmi_top.sv
}
add_files C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/bd/mb_block/mb_block.bd
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_0/mb_block_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_0/mb_block_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_0/mb_block_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_dlmb_v10_0/mb_block_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_ilmb_v10_0/mb_block_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_dlmb_bram_if_cntlr_0/mb_block_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_ilmb_bram_if_cntlr_0/mb_block_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_lmb_bram_0/mb_block_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_xbar_0/mb_block_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_axi_intc_0/mb_block_microblaze_0_axi_intc_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_axi_intc_0/mb_block_microblaze_0_axi_intc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_axi_intc_0/mb_block_microblaze_0_axi_intc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_mdm_1_0/mb_block_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_mdm_1_0/mb_block_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_clk_wiz_1_0/mb_block_clk_wiz_1_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_clk_wiz_1_0/mb_block_clk_wiz_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_clk_wiz_1_0/mb_block_clk_wiz_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_rst_clk_wiz_1_100M_0/mb_block_rst_clk_wiz_1_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_rst_clk_wiz_1_100M_0/mb_block_rst_clk_wiz_1_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_rst_clk_wiz_1_100M_0/mb_block_rst_clk_wiz_1_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_uartlite_0_0/mb_block_axi_uartlite_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_uartlite_0_0/mb_block_axi_uartlite_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_uartlite_0_0/mb_block_axi_uartlite_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_1/mb_block_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_1/mb_block_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_1/mb_block_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_2/mb_block_axi_gpio_0_2_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_2/mb_block_axi_gpio_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_2/mb_block_axi_gpio_0_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_3/mb_block_axi_gpio_0_3_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_3/mb_block_axi_gpio_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_gpio_0_3/mb_block_axi_gpio_0_3.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_timer_0_0/mb_block_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_timer_0_0/mb_block_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_quad_spi_0_0/mb_block_axi_quad_spi_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_quad_spi_0_0/mb_block_axi_quad_spi_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_quad_spi_0_0/mb_block_axi_quad_spi_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_axi_quad_spi_0_0/mb_block_axi_quad_spi_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/mb_block_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/bd/mb_block/ip/mb_block_microblaze_0_0/data/mb_bootloop_le.elf]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/hdmi_tx_0/hdmi_tx_0.xci

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/scene1_rom/scene1_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/scene1_rom/scene1_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/bg1_rom_1/bg1_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/bg1_rom_1/bg1_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/bg2_rom/bg2_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/bg2_rom/bg2_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/bg3_rom/bg3_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/bg3_rom/bg3_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_stand_rom/mai_stand_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_stand_rom/mai_stand_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_forward_rom/mai_forward_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_forward_rom/mai_forward_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_back_rom/mai_back_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_back_rom/mai_back_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_punch_rom/mai_punch_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_punch_rom/mai_punch_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_squat_rom/mai_squat_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_squat_rom/mai_squat_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/mai_kick_rom/mai_kick_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/mai_kick_rom/mai_kick_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/kyo_stand_rom/kyo_stand_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/kyo_stand_rom/kyo_stand_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/kyo_forward_rom/kyo_forward_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/kyo_forward_rom/kyo_forward_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/kyo_punch_rom/kyo_punch_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/kyo_punch_rom/kyo_punch_rom_ooc.xdc]

read_ip -quiet C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/sources_1/ip/kyo_squat_rom/kyo_squat_rom.xci
set_property used_in_implementation false [get_files -all c:/Users/Yuqi/KOF-94/lab6_1/lab6_1.gen/sources_1/ip/kyo_squat_rom/kyo_squat_rom_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Yuqi/KOF-94/lab6_1/lab6_1_provided/mb_intro_top.xdc
set_property used_in_implementation false [get_files C:/Users/Yuqi/KOF-94/lab6_1/lab6_1_provided/mb_intro_top.xdc]

read_xdc C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/pin_assignment/mb_usb_hdmi_top.xdc
set_property used_in_implementation false [get_files C:/Users/Yuqi/KOF-94/lab6_1/lab6.2_provided/pin_assignment/mb_usb_hdmi_top.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental C:/Users/Yuqi/KOF-94/lab6_1/lab6_1.srcs/utils_1/imports/synth_1/mb_intro_top.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top mb_usb_hdmi_top -part xc7s50csga324-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mb_usb_hdmi_top.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mb_usb_hdmi_top_utilization_synth.rpt -pb mb_usb_hdmi_top_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
