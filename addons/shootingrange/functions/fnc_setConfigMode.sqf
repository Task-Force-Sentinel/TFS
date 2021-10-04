#include "script_component.hpp"
/*
* Author: Jonpas
* sets shooting course target change event.
*
* Arguments:
* 0: name <strinG>
* 1: Controller <OBJECT>
* 2: Controllers <ARRAY>
* 3: mode (1 = time, 2 = Hit (time Limited), 3 = Hit (Target Limited)) <NUMBER>
* 4: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", controller, [controller1, controller2], 1, [target1, target2]] call TFS_shootingrange_fnc_setConfigmode;
*
* Public: No
*/

params ["_name", "_controller", "_controllers", "_mode", "_targets"];

{
    _x setVariable [QGVAR(mode), _mode, true];
} forEach _controllers;

// notification
[_controller, _name, _targets] call FUNC(checkConfig);