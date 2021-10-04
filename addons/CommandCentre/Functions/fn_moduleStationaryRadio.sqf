// not documented: module called

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

private _radioClass = _logic getVariable ["StationaryradioClass", "TFAR_anarc210"];
private _radioOn = _logic getVariable ["StationaryradioOn", true];
private _radioCh1 = _logic getVariable ["StationaryradioCh1", 30];
private _radioCh2 = _logic getVariable ["StationaryradioCh2", 40];
private _radioVol = _logic getVariable ["StationaryradioVol", 7];
private _radioCode = _logic getVariable ["StationaryradioCode", "_bluefor"];

private _objects = synchronizedObjects _logic;
{
    [_x, _radioClass, _radioOn, _radioCh1, _radioCh2, _radioVol, _radioCode] call TFS_fnc_initradio;
} forEach _objects;