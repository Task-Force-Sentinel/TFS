#include "script_component.hpp"
/*
* Author: veteran29
* Checks if tank weapon shot can heat up the vehicle
*
* Arguments:
* 0: vehicle <OBJECT>
* 1: Weapon <strinG>
* 7: gunner <OBJECT>
*
* Return Value:
* 0: Can vehicle heat up <BOOL>
*
* Public: No
*/
params ["_vehicle", "_weapon", "", "", "", "", "", "_gunner"];

local _vehicle && {
    (CBA_missiontime > _vehicle getVariable [QGVAR(heattime), 0])
    && {
        (_weapon isKindOf ["CannonCore", configFile >> "Cfgweapons"])
        && {
            !isplayer _gunner
        }
    }
}