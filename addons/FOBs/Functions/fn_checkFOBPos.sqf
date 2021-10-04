/*
Function: TFS_fnc_checkFOBPos

Description:
Allows players to see how and where the FOB would be deployed, so they can
make some adjustments before placing in the FOB.

Arguments:
_object - Object to turn into a portable FOB

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params ["_object"];

_type = _object getVariable ["TFS_PortableFOB_type", "NULL"];

if (_type isEqualto "NULL") exitwith {
    systemChat "invalid FOB type set!";
};

// don't want to have our FOB controller destroyed when everything is being spawned in...
// _object allowdamage false;

_pos = getPos _object;
_dir = getDir _object;

// Get composition array and spawn it using the BIS_fnc_ObjectsMapper
_compArray = call (compile format ["call TFS_fnc_%1", _type]);

_objects = [_pos, _dir, _compArray, 0, true] call TFS_fnc_objectsMapper;

// Properly align the objects with the ground etc, only works with ACE for now...
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    {
        _x call ace_common_fnc_fixposition;
    } forEach _objects;
};

// Delete the preview objects after some time
[
    {
        {
            deletevehicle _x;
        } forEach _this;
    },
    _objects,
    15
] call CBA_fnc_waitandexecute;