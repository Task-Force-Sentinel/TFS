#include "script_component.hpp"
/*
* Author: Jonpas
* sets shooting course duration.
*
* Arguments:
* 0: name <strinG>
* 1: Controllers <ARRAY>
* 2: Target Amount <NUMBER>
* 3: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", [controller1, controller2], 15, [target1, target2]] call TFS_shootingrange_fnc_setConfigTargetAmount;
*
* Public: No
*/

params ["_name", "_controllers", "_targetAmount", "_targets"];

{
    _x setVariable [QGVAR(targetAmount), _targetAmount, true];
} forEach _controllers;

// notification
[_controllers select 0, _name, _targets] call FUNC(checkConfig);