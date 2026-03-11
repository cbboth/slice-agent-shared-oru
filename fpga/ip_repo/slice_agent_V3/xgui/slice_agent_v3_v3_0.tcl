# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CAP_AXI_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MED_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "REC_AXI_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SCHED_WIDTH" -parent ${Page_0}

  ipgui::add_param $IPINST -name "MEM_SIZE"

}

proc update_PARAM_VALUE.CAP_AXI_WIDTH { PARAM_VALUE.CAP_AXI_WIDTH } {
	# Procedure called to update CAP_AXI_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CAP_AXI_WIDTH { PARAM_VALUE.CAP_AXI_WIDTH } {
	# Procedure called to validate CAP_AXI_WIDTH
	return true
}

proc update_PARAM_VALUE.MED_WIDTH { PARAM_VALUE.MED_WIDTH } {
	# Procedure called to update MED_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MED_WIDTH { PARAM_VALUE.MED_WIDTH } {
	# Procedure called to validate MED_WIDTH
	return true
}

proc update_PARAM_VALUE.MEM_SIZE { PARAM_VALUE.MEM_SIZE } {
	# Procedure called to update MEM_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_SIZE { PARAM_VALUE.MEM_SIZE } {
	# Procedure called to validate MEM_SIZE
	return true
}

proc update_PARAM_VALUE.REC_AXI_WIDTH { PARAM_VALUE.REC_AXI_WIDTH } {
	# Procedure called to update REC_AXI_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REC_AXI_WIDTH { PARAM_VALUE.REC_AXI_WIDTH } {
	# Procedure called to validate REC_AXI_WIDTH
	return true
}

proc update_PARAM_VALUE.SCHED_WIDTH { PARAM_VALUE.SCHED_WIDTH } {
	# Procedure called to update SCHED_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SCHED_WIDTH { PARAM_VALUE.SCHED_WIDTH } {
	# Procedure called to validate SCHED_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.MED_WIDTH { MODELPARAM_VALUE.MED_WIDTH PARAM_VALUE.MED_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MED_WIDTH}] ${MODELPARAM_VALUE.MED_WIDTH}
}

proc update_MODELPARAM_VALUE.SCHED_WIDTH { MODELPARAM_VALUE.SCHED_WIDTH PARAM_VALUE.SCHED_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SCHED_WIDTH}] ${MODELPARAM_VALUE.SCHED_WIDTH}
}

proc update_MODELPARAM_VALUE.REC_AXI_WIDTH { MODELPARAM_VALUE.REC_AXI_WIDTH PARAM_VALUE.REC_AXI_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REC_AXI_WIDTH}] ${MODELPARAM_VALUE.REC_AXI_WIDTH}
}

proc update_MODELPARAM_VALUE.CAP_AXI_WIDTH { MODELPARAM_VALUE.CAP_AXI_WIDTH PARAM_VALUE.CAP_AXI_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CAP_AXI_WIDTH}] ${MODELPARAM_VALUE.CAP_AXI_WIDTH}
}

proc update_MODELPARAM_VALUE.MEM_SIZE { MODELPARAM_VALUE.MEM_SIZE PARAM_VALUE.MEM_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_SIZE}] ${MODELPARAM_VALUE.MEM_SIZE}
}

