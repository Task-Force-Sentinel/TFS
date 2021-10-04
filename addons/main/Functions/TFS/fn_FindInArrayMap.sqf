/*
Function: TFS_fnc_findinArrayMap

Description:
find a certain element in a map by ID (the first element of the map entry).

Arguments:
_map - The map to find an entry in
_id - ID of the entry you want to find
_default - default value to return if key not found

Return Values:
The value of the entry or _default if element was not found

Examples:
nothing to see here

Author:
Mokka
*/

params ["_map", "_id", "_default"];

private _value = nil;

{
    if ((_x select 0) isEqualto _id) then {
        _value = (_x select 1);
    };
} forEach _map;

if (isnil "_value") exitwith {
    _default;
};

_value;