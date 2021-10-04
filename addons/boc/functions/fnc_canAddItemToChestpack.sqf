#include "script_component.hpp"
/*
* Author: DerZade
* Checks if given item can be stored into soldier's chestpack.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Item/magazine/weapon classname <strinG>
* 2: Amount <NUMBER> (optional | default: 1)
*
* Return Value:
* Can add item? <BOOL>
*
* Example:
* [player, "FirstAidKit", 2] call TFS_boc_fnc_canAddItemtoChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_item", "", [""]], ["_amount", 1, [0]] ];
private ["_maximumload", "_freeSpace", "_itemMass"];

if (isNull _unit || _item isEqualto "" || _amount < 1) exitwith {
    false
};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    false
};

// calculate space left in chestpack
_maximumload = [configFile >> "Cfgvehicles" >> ([_unit] call FUNC(chestpack)), "maximumload", 0] call BIS_fnc_returnConfigEntry;
_freeSpace = _maximumload - ([_unit] call FUNC(loadChestpack));

if (_freeSpace < 0) exitwith {
    false
};

_itemMass = [_item] call FUNC(itemMass);

if (_itemMass * _amount > _freeSpace) then {
    false
} else {
    true
};