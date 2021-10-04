#include "script_component.hpp"
/*
* Author: DerZade
* Triggerd by Animdone-Eventhandler
*
* Arguments:
* 0: unit <OBJECT>
* 1: animtaion <strinG>
*
* Return Value:
* nothing
*
* Example:
* _this call TFS_boc_fnc_EHAnimdone;
*
* Public: No
*/
params ["_unit", ""];
private ["_weaponHolder"];

if (isnil "_unit") exitwith {
    ["No proper argument(s) given."] call BIS_fnc_error
};

_weaponHolder = objectParent ([_unit] call FUNC(chestpackContainer));

// freefall
if ((animationState _unit) find "halofreefall_" isEqualto 0) then {
    [_weaponHolder, [_unit, [0, -0.5, -0.12], "pelvis"]] remoteExec ["attachto", 0];
    [_weaponHolder, [[0, -1, 0], [0, 0, -1]]] remoteExec ["setvectorDirAndUp", 0];
};