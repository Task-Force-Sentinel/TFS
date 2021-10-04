// not documented: called by module
if !(isServer) exitwith {};

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;

private _dettime = _logic getVariable ["Dettime", 120];
private _proxradius = _logic getVariable ["Proxradius", 20];
private _secondaries = _logic getVariable ["Secondaries", true];
private _announce = _logic getVariable ["Announce", false];
private _anninterval = _logic getVariable ["Anninterval", 30];
private _reqDefKit = _logic getVariable ["ReqDefKit", true];

{
    [
        _x,
        _dettime,
        _proxradius,
        _secondaries,
        _announce,
        _anninterval,
        _reqDefKit
    ] call TFS_fnc_makeIED;
} forEach _objects;