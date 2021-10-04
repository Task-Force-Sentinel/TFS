#include "script_component.hpp"
/*
* Author: Jonpas
* Check if the heavy duty hooks can be Attached.
*
* Arguments:
* 0: Helicopter <OBJECT>
*
* Return Value:
* Can Attach Hooks <BOOL>
*
* Example:
* [heli, player] call tac_heavylifter_fnc_canAttach
*
* Public: No
*/

params ["_vehicle"];

(isnil {
    _vehicle getVariable QGVAR(prepared)
}) &&
{
    (crew _vehicle) isEqualto []
} &&
{
    count (getArray (configFile >> "Cfgvehicles" >> typeOf _vehicle >> QGVAR(AttachPos))) == 3
}