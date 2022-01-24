# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "GNT1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GNT2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GNT3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}


}

proc update_PARAM_VALUE.GNT1 { PARAM_VALUE.GNT1 } {
	# Procedure called to update GNT1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GNT1 { PARAM_VALUE.GNT1 } {
	# Procedure called to validate GNT1
	return true
}

proc update_PARAM_VALUE.GNT2 { PARAM_VALUE.GNT2 } {
	# Procedure called to update GNT2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GNT2 { PARAM_VALUE.GNT2 } {
	# Procedure called to validate GNT2
	return true
}

proc update_PARAM_VALUE.GNT3 { PARAM_VALUE.GNT3 } {
	# Procedure called to update GNT3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GNT3 { PARAM_VALUE.GNT3 } {
	# Procedure called to validate GNT3
	return true
}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}


proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.GNT1 { MODELPARAM_VALUE.GNT1 PARAM_VALUE.GNT1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GNT1}] ${MODELPARAM_VALUE.GNT1}
}

proc update_MODELPARAM_VALUE.GNT2 { MODELPARAM_VALUE.GNT2 PARAM_VALUE.GNT2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GNT2}] ${MODELPARAM_VALUE.GNT2}
}

proc update_MODELPARAM_VALUE.GNT3 { MODELPARAM_VALUE.GNT3 PARAM_VALUE.GNT3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GNT3}] ${MODELPARAM_VALUE.GNT3}
}

