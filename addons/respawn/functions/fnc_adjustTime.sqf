#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function raises adjusttimelocal event on all clients.
*
* Arguments:
* 0: New respawn time delay <NUMBER>
*
* Return Value:
* None
*
* Example:
* [30] call tfs_respawn_fnc_adjusttime
*
* Public: No
*/

params ["_newtime"];

if (!isServer) exitwith {};

[QGVAR(adjusttimelocal), _this] call CBA_fnc_globalEvent;

nil