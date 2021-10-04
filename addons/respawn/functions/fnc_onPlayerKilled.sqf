#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function handles onplayerKilled event.
*
* Arguments:
* 0: Killed player <OBJECT>
* 1: Killer <OBJECT>
*
* Return Value:
* None
*
* Example:
* [bob, ted] call tfs_respawn_fnc_onplayerKilled
*
* Public: No
*/

params ["_oldUnit", "_killer"];

// Respawn is disabled
if (!GVAR(enabled)) exitwith {
    setPlayerRespawntime time_DISABLED
};

setPlayerRespawntime GVAR(time);

nil