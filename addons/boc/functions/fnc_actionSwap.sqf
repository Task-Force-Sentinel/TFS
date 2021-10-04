#include "script_component.hpp"
/*
* Author: DerZade
* Triggered by the swap-action. Handles removing backpack and adding chestpack with same content.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* [player] call TFS_boc_fnc_actionSwap;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_backpack", "_chestpack", "_backpackloadout", "_chestpackloadout", "_unitloadout"];

if (isNull _unit) exitwith {};

_backpack = backpack _unit;
_chestpack = [_unit] call FUNC(chestpack);
_backpackloadout = +((getUnitloadout _unit) select 5 select 1);
_chestpackloadout = [_unit] call FUNC(chestpackloadout);

// make sure the player has chest- and backpack
if ((_backpack isEqualto "") or (_chestpack isEqualto "")) exitwith {};

removeBackpackGlobal _unit;
_unitloadout = +(getUnitloadout _unit);
_unitloadout set [5, [_chestpack, _chestpackloadout]];
_unit setUnitLoadout _unitloadout;
[_unit, _backpack] call FUNC(addChestpack);
[_unit, _backpackloadout] call FUNC(setChestpackloadout);