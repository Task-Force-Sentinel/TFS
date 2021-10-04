#include "script_component.hpp"
/*
* Author: DerZade
* Returns array with all items (of any kind, even weapons) in chestpack of the given unit.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Return magazines aswell <BOOL> (optional | default: true)
*
* Return Value:
* items <ARRAY>
*
* Example:
* [player] call TFS_boc_fnc_chestpackitems;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_returnMags", true, [true]] ];
private ["_items"];

if (isNull _unit) exitwith {
    []
};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    []
};

_items = [];

{
    _x params ["_item", "_amount"];
    
    if (count _x < 3 || _returnMags) then {
        // weapons are [[classname, ...], amount] so we have to extract the classname
        if (_item isEqualtype []) then {
            _item = _item select 0;
        };
        
        if (typeName _amount != "SCALAR") then {
            _amount = 1;
        };
        
        for "_i" from 1 to _amount do {
            _items pushBack _item;
        };
    };
} forEach ([_unit] call FUNC(chestpackloadout));

// return items
_items