/*
Function: TFS_fnc_infantryGarrison

Description:
Garrison buildings in given radius around given position, using
units of the passed faction.

Arguments:
_pos - position around which to garrison buildings <position 3D>
_radius - radius around the position in which to garrison buildings, in min-max <ARRAY OF SCALARS>
_side - side of the units to garrison <side>
_factionside - side string of the faction to use in populating the garrisons <strinG>
_faction - The faction which we want to use to populate the garrisons <strinG>
_infantrytype - Class name of the infantry group type to use in populating <strinG>
_inflist - Array of groups to use in populating <ARRAY OF strinGS>
_groupcount - The amount of groups we want to create <SCALAR>
_AIOB_positioning - The positioning directive to use <SCALAR, defaults to: 2>
_skill - The skill level of the garrisoned units <strinG>
_maxFill - The maximum amount of units in one building <SCALAR, defaults to: 4>
_excludes - Exclude buildings in this array from being garrisoned <ARRAY OF strinG>
_units - Array of units already in existence which we want to garrison as well <ARRAY OF units>

Return Values:
Array containing the garrisoned units <ARRAY OF units>

Examples:
nothing to see here

Author:
MartinCo & MitchJC
*/
if (!isServer) exitwith {};

params [
    "_pos",
    ["_radius", [0, 500]],
    ["_side", east],
    ["_factionside", "east"],
    ["_faction", "OPF_F"],
    ["_infantrytype", "Uinfantry"],
    ["_inflist", ["OIA_GuardSquad"]],
    ["_groupcount", 1],
    ["_AIOB_positioning", 2],
    ["_skill", "TFS default"],
    ["_maxFill", 4],
    ["_excludes", []],
    ["_units", []]
];

if (_units isEqualto []) then {
    for "_x" from 1 to _groupcount do {
        private _grouptype = (configFile >> "Cfggroups" >> _factionside >> _faction >> _infantrytype >> (selectRandom _inflist));
        private _g = [_pos, _side, _grouptype] call BIS_fnc_spawngroup;
        _units append (units _g);
    };
};

if (_units isEqualto []) exitwith {
    []
};

private _failed = [_pos, nil, _units, _radius, _AIOB_positioning, true, _maxFill, _excludes] call DERP_fnc_AIOccupyBuilding;

// Remove any non-garrisoned units
{
    deletevehicle _x;
} forEach _failed;
_allunits = _units - _failed;

// set skill
[_allunits, _skill] call TFS_fnc_setunitskill;

// Add units to zeus
{
    _x addcuratorEditableObjects [_allunits, false];
} forEach allCurators;

_allunits;