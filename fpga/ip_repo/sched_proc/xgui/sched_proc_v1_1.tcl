# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ETH_MTU" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IQ_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ETH_MTU { PARAM_VALUE.ETH_MTU } {
	# Procedure called to update ETH_MTU when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ETH_MTU { PARAM_VALUE.ETH_MTU } {
	# Procedure called to validate ETH_MTU
	return true
}

proc update_PARAM_VALUE.IQ_WIDTH { PARAM_VALUE.IQ_WIDTH } {
	# Procedure called to update IQ_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IQ_WIDTH { PARAM_VALUE.IQ_WIDTH } {
	# Procedure called to validate IQ_WIDTH
	return true
}

proc update_PARAM_VALUE.UDCOMP { PARAM_VALUE.UDCOMP } {
	# Procedure called to update UDCOMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.UDCOMP { PARAM_VALUE.UDCOMP } {
	# Procedure called to validate UDCOMP
	return true
}

proc update_PARAM_VALUE.USE_COMPR { PARAM_VALUE.USE_COMPR } {
	# Procedure called to update USE_COMPR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_COMPR { PARAM_VALUE.USE_COMPR } {
	# Procedure called to validate USE_COMPR
	return true
}


proc update_MODELPARAM_VALUE.ETH_MTU { MODELPARAM_VALUE.ETH_MTU PARAM_VALUE.ETH_MTU } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ETH_MTU}] ${MODELPARAM_VALUE.ETH_MTU}
}

proc update_MODELPARAM_VALUE.IQ_WIDTH { MODELPARAM_VALUE.IQ_WIDTH PARAM_VALUE.IQ_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IQ_WIDTH}] ${MODELPARAM_VALUE.IQ_WIDTH}
}

proc update_MODELPARAM_VALUE.UDCOMP { MODELPARAM_VALUE.UDCOMP PARAM_VALUE.UDCOMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UDCOMP}] ${MODELPARAM_VALUE.UDCOMP}
}

proc update_MODELPARAM_VALUE.USE_COMPR { MODELPARAM_VALUE.USE_COMPR PARAM_VALUE.USE_COMPR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_COMPR}] ${MODELPARAM_VALUE.USE_COMPR}
}

