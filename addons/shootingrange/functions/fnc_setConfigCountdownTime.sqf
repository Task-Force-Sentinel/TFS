#include "script_component.hpp"
/*
* Author: Jonpas
* sets shooting course pause duration.
*
* Arguments:
* 0: name <strinG>
* 1: Controllers <ARRAY>
* 2: countdown time <NUMBER>
* 3: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", [controller1, controller2], 9, [target1, target2]] call TFS_shootingrange_fnc_setConfigcountdowntime;
*
* Public: No
*/

params ["_name", "_controllers", "_countdowntime", "_targets"];

{
    _x setVariable [QGVAR(countdowntime), _countdowntime, true];
} forEach _controllers;

// notification
[_controllers select 0, _name, _targets] call FUNC(checkConfig);