#include "script_component.hpp"
/*
* Author: veteran29
* Handle vehicle point keybind.
*
* Arguments:
* None
*
* Return Value:
* Key Handled <BOOL>
*
* Public: No
*/

if (!alive ACE_player) exitwith {
    false
};
// Conditions: caninteract
if !([ACE_player, ACE_player, ["isnotinside", "isnotSwimming"]] call EFUNC(common, caninteractwith)) exitwith {
    false
};

private _vehicle = vehicle ACE_player;
// make sure player is in vehicle and not in a static weapon (inverse of ACE Finger check):
if ((ACE_player == _vehicle) || {
    (_vehicle isKindOf "StaticWeapon")
}) exitwith {
    false
};

// exit if run recently (run every 1 second)
if (diag_ticktime < (GVAR(lastPointtime) + 1)) exitwith {
    true
};

GVAR(lastPointtime) = diag_ticktime;

private _pointPosASL = AGLtoASL positionCameratoWorld [0, 0, POinT_distance];

[QGVAR(pointed), [ACE_player, _pointPosASL], crew _vehicle] call CBA_fnc_targetEvent;

true // return