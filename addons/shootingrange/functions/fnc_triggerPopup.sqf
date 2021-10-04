#include "script_component.hpp"
/*
* Author: Jonpas
* Pops targets on trigger.
*
* Arguments:
* 0: Target <OBJECT>
* 1: State (Up = 0, down = 1) <BOOL>
*
* Return Value:
* None
*
* Example:
* [target, 0] call TFS_shootingrange_fnc_triggerPopup;
*
* Public: No
*/

params ["_target", "_state"];

private _targetgroup = _target getVariable [QGVAR(targetgroup), []];

if (_targetgroup isEqualto []) exitwith {
    ERRor("Target group empty!");
};

{
    // animate only targets that haven't been cleared yet
    if !(_x getVariable [QGVAR(hit), false]) then {
        [_x, _state] call FUNC(animateTarget);
    };
} forEach _targetgroup;

private _targetinvalidgroup = _target getVariable [QGVAR(targetinvalidgroup), []];
{
    [_x, _state] call FUNC(animateTarget);
} forEach _targetinvalidgroup;