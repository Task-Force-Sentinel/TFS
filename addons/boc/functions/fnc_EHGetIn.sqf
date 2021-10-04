#include "script_component.hpp"
/*
* Author: DerZade
* Triggerd by GetinMan-Eventhandler
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
* _this call TFS_boc_fnc_EHGetin;
*
* Public: No
*/
params ["_unit", "", "_veh"];
private ["_weaponHolder"];

if (isnil "_unit" or isnil "_veh") exitwith {
    ["No proper argument(s) given."] call BIS_fnc_error
};

_weaponHolder = objectParent ([_unit] call FUNC(chestpackContainer));
_weaponHolder remoteExec ["detach", 0];
_weaponHolder remoteExec ["hideObjectglobal", 0];
[_weaponHolder, [-10000, -10000, -100]] remoteExec ["setPos", 0];

if (GVAR(forceWalk)) then {
    [_unit, "forceWalk", QGVAR(forcemovementspeed), false] call ace_common_fnc_statusEffect_set;
} else {
    [_unit, "blockSprint", QGVAR(forcemovementspeed), false] call ace_common_fnc_statusEffect_set;
};

_unit setVariable [QGVAR(preventProne), false, true];