#include "script_component.hpp"
/*
* Author: DerZade
* Removes unit's chestpack.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* [player] call TFS_boc_fnc_removeChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_var"];

if (isNull _unit) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

_var = (_unit getVariable [QGVAR(chestpack), nil]);

// delete weaponHolder holding chestpack
deletevehicle objectParent ([_unit] call FUNC(chestpackContainer));

// remove all EHs
_unit removeEventHandler ["GetinMan", (_var select 1) select 0];
_unit removeEventHandler ["GetoutMan", (_var select 1) select 1];
_unit removeEventHandler ["Animdone", (_var select 1) select 2];
_unit removeEventHandler ["Killed", (_var select 1) select 3];

if (GVAR(forceWalk)) then {
    [_unit, "forceWalk", QGVAR(forcemovementspeed), false] call ace_common_fnc_statusEffect_set;
} else {
    [_unit, "blockSprint", QGVAR(forcemovementspeed), false] call ace_common_fnc_statusEffect_set;
};

_unit setVariable [QGVAR(preventProne), false, true];

[_unit, false] call FUNC(manageWeight);

// reset variable
_unit setVariable [QGVAR(chestpack), nil, true];