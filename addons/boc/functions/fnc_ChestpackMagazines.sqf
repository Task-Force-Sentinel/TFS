#include "script_component.hpp"
/*
* Author: DerZade
* Returns array with all magazines from chestpack of the given unit.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* Chestpack magazines <ARRAY> [classname, ammo count, amount of mags]
* (this format does not match the normal loadout format, because this function
* existed before 'getUnitloadout' was a thing and backwards compatibility and shit)
*
* Example:
* [player] call TFS_boc_fnc_chestpackmagazines;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_mags"];

if (isNull _unit) exitwith {
    []
};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    []
};

_mags = [];

{
    if (count _x isEqualto 3) then {
        // sort out magazines
        _x params ["_item", "_amount", "_ammo"];
        
        _mags pushBack [_item, _ammo, _amount];
    }
} forEach ([_unit] call FUNC(chestpackloadout));

// return mags
_mags