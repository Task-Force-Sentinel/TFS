// not documented: called by module
if !(isServer) exitwith {};

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;

private _type = _logic getVariable ["type", "ANY"];

{
    [_x, _type, 1] call TFS_fnc_createPortableFOB;
} forEach _objects;