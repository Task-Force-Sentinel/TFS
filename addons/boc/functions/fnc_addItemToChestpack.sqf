#include "script_component.hpp"
/*
* Author: DerZade
* Creates a new item and stores it in the soldier's chestpack. The item can also be a weapon or a magazine.
* The item(s) won't be added, if adding them would cause an overflow of the backpack.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Item/magazine/weapon classname <strinG>
* 2: Amount <NUMBER> (optional | default: 1)
*
* Return Value:
* nothing
*
* Example:
* [player, "FirstAidKit", 3] call TFS_boc_fnc_addItemtoChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_item", "", [""]], ["_amount", 1, [0]] ];
private ["_type"];

if (isNull _unit || _item isEqualto "" || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

// exit if there is not enough space left
if !([_unit, _item, _amount] call FUNC(canAddItemtoChestpack)) exitwith {};

_type = ([_item] call BIS_fnc_itemtype) select 0;

if (_type isEqualto "Magazine") exitwith {
    [_unit, _item, ([configFile >> "Cfgmagazines" >> _item, "count"] call BIS_fnc_returnConfigEntry), _amount] call FUNC(addMagtoChestpack);
};

if (_type isEqualto "Weapon") exitwith {
    [_unit, [_item, "", "", "", [], [], ""], _amount] call FUNC(addWeapontoChestpack);
};

[_unit, [_item, _amount]] call FUNC(modifyItemAmount);