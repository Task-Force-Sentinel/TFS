#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function disables respawn for local player.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call tfs_respawn_fnc_disable
*
* Public: No
*/

// Save current elapsed time for possible further respawn restart
GVAR(timeElapsed) = GVAR(time) - playerRespawntime;

setPlayerRespawntime time_DISABLED;

nil