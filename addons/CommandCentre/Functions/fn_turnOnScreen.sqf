params ["_object", "_selection", "_turnOn", "_args"];

if (_turnOn) then {
	[_object, _selection, _args] call TFSRHS_fnc_configureScreen;
} else {
	_object setVariable [format ["TFSRHS_CC_screen_%1_on", _selection], false, true];
	_object setObjectTextureGlobal [_selection, "z\tfsrhs\addons\media\images\cc_screen_standby.paa"];

	[_object, _selection] remoteExec ["TFSRHS_fnc_deleteCamera", 0];
};