// not documented: module called

params [
    ["_logic", objNull, [objNull]],
    ["_groups", [], [[]]],
    "_localgroups",
    "_logic"
];

if (not isServer) exitwith {};

private _objects = synchronizedObjects _logic;
{
    TFS_CC_vehicleCamlist pushBackUnique _x;
} forEach _objects;

publicVariable "TFS_CC_vehicleCamlist";