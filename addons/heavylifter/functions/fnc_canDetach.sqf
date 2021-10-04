#include "script_component.hpp"
/*
* Author: Jonpas
* Check if the heavy duty hooks can be detached.
*
* Arguments:
* 0: Helicopter <OBJECT>
*
* Return Value:
* Can detach Hooks <BOOL>
*
* Example:
* [heli, player] call tac_heavylifter_fnc_candetach
*
* Public: No
*/

params ["_vehicle"];

(!isnil {
    _vehicle getVariable QGVAR(prepared)
})