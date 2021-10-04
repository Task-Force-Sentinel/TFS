#include "\z\tfs\addons\spectator\script_component.hpp"
/* ----------------------------------------------------------------------------
internal Function: TFS_spectator_fnc_initSpectatorUnit

Description:
initializes the virtual spectator unit.

parameters:
_unit - Spectator virtual entity [Object]

Examples:
(begin example)
[_specEntity] spawn TFS_spectator_fnc_initSpectatorUnit
(end)

Author:
Freddo
---------------------------------------------------------------------------- */
params ['_unit'];

if !(hasinterface) exitwith {};
waitUntil {
    !isNull player
};

if (player == _unit) then {
    [_unit, _unit, true] call FUNC(init);
};