// not documented: module called

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

if !(isServer) exitwith {};
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitwith {};

private _objects = synchronizedObjects _logic;
{
    [_x, 50000] call TFAR_antennas_fnc_initradiotower;
} forEach _objects;