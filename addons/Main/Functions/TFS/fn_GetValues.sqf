/*
Function: TFS_fnc_GetValues

Description:
Get all the values in a map as an array

Arguments:
_map - The map to get the values from

Return Values:
list of all the values stored in the map

Examples:
nothing to see here

Author:
Mokka
*/
params ["_map"];

private _values = [];

{
    _values pushBack (_x select 1);
} forEach _map;

_values;