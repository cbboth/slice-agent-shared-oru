# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_CLK_MHZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI_CLK_MHZ { PARAM_VALUE.AXI_CLK_MHZ } {
	# Procedure called to update AXI_CLK_MHZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_CLK_MHZ { PARAM_VALUE.AXI_CLK_MHZ } {
	# Procedure called to validate AXI_CLK_MHZ
	return true
}

proc update_PARAM_VALUE.AXI_WIDTH { PARAM_VALUE.AXI_WIDTH } {
	# Procedure called to update AXI_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_WIDTH { PARAM_VALUE.AXI_WIDTH } {
	# Procedure called to validate AXI_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.AXI_WIDTH { MODELPARAM_VALUE.AXI_WIDTH PARAM_VALUE.AXI_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_WIDTH}] ${MODELPARAM_VALUE.AXI_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_CLK_MHZ { MODELPARAM_VALUE.AXI_CLK_MHZ PARAM_VALUE.AXI_CLK_MHZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_CLK_MHZ}] ${MODELPARAM_VALUE.AXI_CLK_MHZ}
}

