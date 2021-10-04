#include "script_component.hpp"
/*
* Author: Jonpas
* animates a target.
*
* Arguments:
* 0: Target <OBJECT>
* 1: State (Up = 0, down = 1) <BOOL>
*
* Return Value:
* None
*
* Example:
* [target, 0] call TFS_shootingrange_fnc_animateTarget;
*
* Public: No
*/

params ["_target", "_state"];

private _anims = _target call FUNC(getTargetanimations);
// TRACE_3("animate", _target, _state, _anims);
{
    _target animate [_x, _state];
} forEach _anims;