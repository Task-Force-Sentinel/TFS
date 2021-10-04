#include "script_component.hpp"
/*
* Author: DerZade
* Removes all items (includes weapons and magazines) from a unit's chestpack.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* [player] call TFS_boc_fnc_clearAllitemsfromChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];

if (isNull _unit) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

[_unit, []] call FUNC(setChestpackloadout);