#include "script_component.hpp"
/*
* Author: Jonpas
* Checks if a target is in "down" animation phase.
*
* Arguments:
* 0: Target <OBJECT>
*
* Return Value:
* None
*
* Example:
* _isdown = target call TFS_shootingrange_fnc_isTargetdown;
*
* Public: No
*/

params ["_target"];

private _anims = _target call FUNC(getTargetanimations);

{
    if (_target animationPhase _x > 0) exitwith {
        true
    };
    false
} forEach _anims;