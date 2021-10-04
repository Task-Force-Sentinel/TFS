#include "script_component.hpp"
/*
* Author: DerZade
* Triggered by the onBack-action. Handles removing chestpack and adding backpack with same content.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* [player] call TFS_boc_fnc_actionOnBack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_chestpack", "_chestpackloadout", "_unitloadout"];

if (isNull _unit) exitwith {};

_chestpack = [_unit] call FUNC(chestpack);
_chestpackloadout = [_unit] call FUNC(chestpackloadout);

// make sure the player has a chestpack and no backpack
if ((_chestpack isEqualto "") or !(backpack _unit isEqualto "")) exitwith {};

_unitloadout = +(getUnitloadout _unit);
_unitloadout set [5, [_chestpack, _chestpackloadout]];
_unit setUnitLoadout _unitloadout;
[_unit] call FUNC(removeChestpack);