/*
Function: TFS_fnc_civilianGarrison

Description:
Garrison buildings in given radius around given position, using
units of the passed faction.

Arguments:
_pos - position around which to garrison buildings <position 3D>
_radius - radius around the position in which to garrison buildings, in min-max <ARRAY OF SCALARS>
_faction - The faction which we want to use to populate the garrisons <strinG>
_side - The side of the civilians to spawn <side>
_pedlist - Array of units to use in populating <ARRAY OF strinGS>
_unitcount - The amount of units we want to create <SCALAR>
_AIOB_positioning - The positioning directive to use <SCALAR, defaults to: 2>
_maxFill - The maximum amount of units in one building <SCALAR, defaults to: 1>
_excludes - Exclude buildings in this array from being garrisoned <ARRAY OF strinG>

Return Values:
Array containing the garrisoned units <ARRAY OF units>

Examples:
nothing to see here

Author:
Mokka
*/

if (!isServer) exitwith {};

params [
    "_pos", "_Garrradius",
    ["_faction", "CIV_F"],
    ["_side", civilian],
    "_pedlist",
    ["_unitcount", 0],
    ["_AIOB_positioning", 2],
    ["_maxFill", 1],
    ["_excludes", []]
];

_units = [];
_group = creategroup [_side, true];

for "_x" from 0 to _unitcount do {
    private _u = _group createUnit [(selectRandom _pedlist), _pos, [], 0, "CAN_COLLIDE"];
    _units append [_u];
};

if (_units isEqualto []) exitwith {};

private _failed = [_pos, nil, _units, _Garrradius, _AIOB_positioning, true, _maxFill, _excludes] call DERP_fnc_AIOccupyBuilding;

// Remove any non-garrisoned units
{
    deletevehicle _x;
} forEach _failed;
_allunits = _units - _failed;

// Add units to zeus
{
    _x addcuratorEditableObjects [_allunits, false];
} forEach allCurators;

_allunits;