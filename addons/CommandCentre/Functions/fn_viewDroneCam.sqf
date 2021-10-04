params ["_seat"];
// 0 - pilot, 1 - gunner

private _object = TFS_CC_currentScreenObject;
private _selection = TFS_CC_currentScreenselection;

if ((_object isEqualto objNull)) exitwith {
    systemChat "Couldn't init Drone Cam: object."
};
if ((_selection < 0)) exitwith {
    systemChat "Couldn't init Drone Cam: selection."
};

private _idx = lbCurSel 2101;
private _name = lbtext [2101, _idx];
private _data = lbData [2101, _idx];

// set the mode
_object setVariable [format ["TFS_CC_screen_%1_mode", _selection], "DCAM", true];
_object setVariable [format ["TFS_CC_screen_%1_target", _selection], _name, true];

// obtain render target
private _screen_id = _object getVariable [format ["TFS_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

private _screen_JIP_ID = format ["TFS_CC_screen%1_JIP", _object getVariable [format ["TFS_CC_screen_%1_ID", _selection], -1]];

[_object, _selection, _rendertarget, _data, _seat] remoteExec ["TFS_fnc_viewDCamGlobal", 0, _screen_JIP_ID];

TFS_CC_currentScreenObject = nil;
TFS_CC_currentScreenselection = nil;

_object setVariable [format ["TFS_CC_screen_%1_on", _selection], true, true];

closedialog 1;