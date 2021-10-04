// not documented: module called

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

private _allowCam = _logic getVariable ["singleScreenCam", true];
private _allowDrone = _logic getVariable ["singleScreenDrone", true];
private _allowSat = _logic getVariable ["singleScreenSat", true];
private _allowMap = _logic getVariable ["singleScreenMap", true];
private _screenselection = _logic getVariable ["singleScreenselection", 0];

private _objects = synchronizedObjects _logic;
{
    [_x, "Screen", _allowCam, _allowDrone, _allowSat, _allowMap, _screenselection] call TFS_fnc_initScreen;
} forEach _objects;