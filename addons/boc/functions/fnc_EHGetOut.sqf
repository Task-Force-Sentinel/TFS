#include "script_component.hpp"
/*
* Author: DerZade
* Triggerd by GetoutMan-Eventhandler
*
* Arguments:
* 0: unit <OBJECT>
* 1: position <strinG>
* 2: vehicle <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* _this call TFS_boc_fnc_EHGetout;
*
* Public: No
*/
params ["_unit", "", "_veh"];
private ["_weaponHolder"];

if (isnil "_unit" or isnil "_veh") exitwith {
    ["No proper argument(s) given."] call BIS_fnc_error
};

_weaponHolder = objectParent ([_unit] call FUNC(chestpackContainer));
[_weaponHolder, [_unit, [0.04, 0.12, -0.5], "pelvis"]] remoteExec ["attachto", 0];
[_weaponHolder, [[0, 0, -1], [0.6, 1, 0]]] remoteExec ["setvectorDirAndUp", 0];
[_weaponHolder, false] remoteExec ["hideObjectglobal", 0];

if (GVAR(forceWalk)) then {
    [_unit, "forceWalk", QGVAR(forcemovementspeed), true] call ace_common_fnc_statusEffect_set;
} else {
    [_unit, "blockSprint", QGVAR(forcemovementspeed), true] call ace_common_fnc_statusEffect_set;
};

_unit setVariable [QGVAR(preventProne), true, true];