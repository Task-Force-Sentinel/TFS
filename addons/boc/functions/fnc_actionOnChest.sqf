#include "script_component.hpp"
/*
* Author: DerZade
* Triggered by the onChest-action. Handles removing backpack and adding chestpack with same content.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* [player] call TFS_boc_fnc_actionOnChest;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_backpack", "_backpackloadout", "_weaponHolder"];

if (isNull _unit) exitwith {};

_backpack = backpack _unit;
_backpackloadout = +((getUnitloadout _unit) select 5 select 1);

// make sure the player has no chestpack and a backpack
if ((_backpack isEqualto "") || {
    !(([_unit] call FUNC(chestpack)) isEqualto "")
}) exitwith {};

[_unit, _backpack] call FUNC(addChestpack);
[_unit, _backpackloadout] call FUNC(setChestpackloadout);
_weaponHolder = objectParent ([_unit] call FUNC(chestpackContainer));
clearBackpackCargoGlobal _weaponHolder;
_unit action ["dropBag", _weaponHolder, _backpack];