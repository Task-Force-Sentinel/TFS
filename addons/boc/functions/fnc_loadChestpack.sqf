#include "script_component.hpp"
/*
* Author: DerZade
* Returns current sum of mass from items stored in a chestpack.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* Mass <NUMBER>
*
* Example:
* [player] call TFS_boc_fnc_loadChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_items", "_mass"];

if (isNull _unit) exitwith {
    0
};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    0
};

_items = [_unit] call FUNC(chestpackitems);
_mass = 0;

{
    private _itemMass = _x call FUNC(itemMass);
    _mass = _mass + _itemMass;
} forEach _items;

_mass