#include "script_component.hpp"
/*
* Author: Jonpas
* sets shooting course duration.
*
* Arguments:
* 0: name <strinG>
* 1: Controllers <ARRAY>
* 2: Duration <NUMBER>
* 3: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", [controller1, controller2], 5, [target1, target2]] call TFS_shootingrange_fnc_setConfigDuration;
*
* Public: No
*/

params ["_name", "_controllers", "_duration", "_targets"];

{
    _x setVariable [QGVAR(duration), _duration, true];
} forEach _controllers;

// notification
[_controllers select 0, _name, _targets] call FUNC(checkConfig);