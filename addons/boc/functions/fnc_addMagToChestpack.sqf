#include "script_component.hpp"
/*
* Author: DerZade
* Creates new magazine and stores it in the soldier's chestpack. Only magazines are supported.
* The purpose of this function is to ensure that magazines with a specified ammo count can be added.
* if you want to add a/multiple full magazine(s) you may want to use 'TFS_boc_fnc_addItemtoChestpack' instead.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: classname <strinG>
* 2: ammo count <NUMBER>
* 3: Amount <NUMBER> (optional | default: 1)
*
* Return Value:
* nothing
*
* Example:
* [player, "30Rnd_556x45_Stanag", 25, 2] call TFS_boc_fnc_addMagtoChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_item", "", [""]], ["_ammo", -1, [0]], ["_amount", 1, [0]] ];

if (isNull _unit || _item isEqualto "" || _ammo isEqualto -1 || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

// exit if there is not enough space left
if !([_unit, _item, _amount] call FUNC(canAddItemtoChestpack)) exitwith {};

[_unit, [_item, _amount, _ammo]] call FUNC(modifyItemAmount);