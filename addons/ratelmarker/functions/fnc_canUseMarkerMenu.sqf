#include "script_component.hpp"
/*
* Author: Jonpas
* Checks if RATEL Marker menu can be used.
*
* Arguments:
* 0: vehicle <OBJECT>
* 1: Unit <OBJECT>
*
* Return Value:
* Can Use RATEL Marker menu <BOOL>
*
* Example:
* [vehicle, player] call tac_ratelmarker_fnc_canUseMarkerMenu;
*
* Public: No
*/

if (!isnil {
    uiNamespace getVariable QGVAR(menuDisplay)
}) exitwith {};

params ["_vehicle"];

private _vehicleRole = assignedvehicleRole ACE_player;

(_vehicle isKindOf "Air") &&
{
    driver _vehicle == ACE_player ||
    {
        (_vehicleRole select 0) isEqualto "Turret" && {
            (_vehicleRole select 1) in (allTurrets _vehicle)
        }
    }
}