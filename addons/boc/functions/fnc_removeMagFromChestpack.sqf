#include "script_component.hpp"
/*
* Author: DerZade
* Removes magazine from unit's chestpack. The purpose of this function is to ensure that magazines with a specified ammo count can be removed.
* if you want to remove a magazine with just any amount of ammo you may want to use 'FUNC(removeItemfromChestpack)' instead.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: classname <strinG>
* 2: ammo count <NUMBER>
*
* Return Value:
* nothing
*
* Example:
* [player, "30Rnd_556x45_Stanag", 25, 2] call TFS_boc_fnc_removeMagfromChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_item", "", [""]], ["_ammo", -1, [0]], ["_amount", 1, [0]] ];

if (isNull _unit || _item isEqualto "" || _ammo isEqualto -1 || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    0
};

// exit if there is no such item in chestpack
if ((compile format ["(_x select 0) isEqualto '%1' and (_x select 1) isEqualto %2", _item, _ammo]) count ([_unit] call FUNC(chestpackmagazines)) isEqualto 0) exitwith {};

[_unit, [_item, (-1)*_amount, _ammo]] call FUNC(modifyItemAmount);