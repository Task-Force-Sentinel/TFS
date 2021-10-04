#include "\z\tfs\addons\spectator\script_component.hpp"
/* ----------------------------------------------------------------------------
Internal Function: TFS_spectator_fnc_initSpectatorUnit

Description:
    Initializes the virtual spectator unit.

Parameters:
    _unit - Spectator virtual entity [Object]

Examples:
    (begin example)
        [_specEntity] spawn TFS_spectator_fnc_initSpectatorUnit
    (end)

Author:
    Freddo
---------------------------------------------------------------------------- */
params ['_unit'];

if !(hasInterface) exitWith {};
waitUntil {!isNull player};

if (player == _unit) then {
    [_unit,_unit,true] call FUNC(init);
};
