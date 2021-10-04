// not documented: module called

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

private _objects = synchronizedObjects _logic;
{
    [_x] call TFS_fnc_setMedicalFacility;
} forEach _objects;