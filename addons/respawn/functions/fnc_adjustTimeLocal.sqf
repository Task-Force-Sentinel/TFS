#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function adjusts new remaining respawn time with respect to current elapsed time.
*
* Arguments:
* 0: New respawn time delay <NUMBER>
*
* Return Value:
* None
*
* Example:
* [30] call tfs_respawn_fnc_adjusttimelocal
*
* Public: No
*/

params ["_newtime"];

if (playerRespawntime isEqualto -1) exitwith {
    GVAR(oldtime) = _newtime;
    nil
};

// Calculate current elapsed time and adjust new respawn time
private _elapsedtime = GVAR(oldtime) - playerRespawntime;
setPlayerRespawntime (_newtime - _elapsedtime max time_minIMUM);

// Save for further adjustments
GVAR(oldtime) = _newtime;

nil