#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function enables respawn for local player.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* call tfs_respawn_fnc_enable
*
* Public: No
*/

// Restart counter where it stopped
setPlayerRespawntime (GVAR(time) - GVAR(timeElapsed) max time_minIMUM);

nil