#include "script_component.hpp"
/*
* Author: DerZade
* Removes item from unit's chestpack.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Item/magazine/weapon classname <strinG>
*
* Return Value:
* nothing
*
* Example:
* [player, "FirstAidKit", 3] call TFS_boc_fnc_removeItemfromChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_item", "", [""]], ["_amount", 1, [0]] ];

if (isNull _unit || _item isEqualto "" || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

// exit if there is no such item in chestpack
if ([_unit] call FUNC(chestpackitems) find _item isEqualto -1) exitwith {};

[_unit, [_item, (-1)*_amount]] call FUNC(modifyItemAmount);