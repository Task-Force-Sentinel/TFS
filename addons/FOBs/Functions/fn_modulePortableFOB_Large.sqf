// not documented: called by module
if !(isserver) exitwith {};

params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;

private _type = _logic getVariable ["Type", "ANY"];

{
    [_x, _type, 3] call TFS_fnc_createPortableFOB;
} forEach _objects;