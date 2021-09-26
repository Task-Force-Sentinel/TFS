params ["_object", "_selection", "_turnOn", "_args"];

if (_turnOn) then {
	[_object, _selection, _args] call TFS_fnc_configureScreen;
} else {
	_object setVariable [format ["TFS_CC_screen_%1_on", _selection], false, true];
	_object setObjectTextureGlobal [_selection, "z\tfs\addons\media\images\cc_screen_standby.paa"];

	[_object, _selection] remoteExec ["TFS_fnc_deleteCamera", 0];
};