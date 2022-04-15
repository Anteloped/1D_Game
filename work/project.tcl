set projDir "C:/Users/jiahu/Downloads/1D_Game/work/vivado"
set projName "1D_Game"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/jiahu/Downloads/1D_Game/work/verilog/au_top_0.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/button_conditioner_1.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/edge_detector_2.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/counter_3.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/pn_gen_4.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/beta_5.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/pipeline_6.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/alu16_7.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/look_up_table_8.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/fsm_auto_9.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/reg_files_10.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/variable_counter_11.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/counter_12.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/adder_13.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/boolean_14.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/shift_15.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/compare_16.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/multiplier_17.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/multi_seven_seg_18.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/multi_dec_ctr_19.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/decimal_counter_5_20.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/seven_seg_21.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/edge_detector_22.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/counter_23.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/counter_24.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/decoder_25.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/decimal_counter_26.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/decimal_counter_27.v" "C:/Users/jiahu/Downloads/1D_Game/work/verilog/decimal_counter_28.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/jiahu/Downloads/1D_Game/work/constraint/custom_io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
