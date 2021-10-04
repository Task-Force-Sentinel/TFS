#include "script_component.hpp"
/*
* Author: Jonpas
* Returns applicable animations of a target.
*
* Arguments:
* 0: Target <OBJECT>
*
* Return Value:
* None
*
* Example:
* _anims = target call TFS_shootingrange_fnc_getTargetanimations;
*
* Public: No
*/

params ["_target"];

// find oval target
private _index = OVAL_targets find (toLower (typeOf _target));

if (_index != -1) then {
    // Oval target
    OVAL_TARGET_ANIMS select _index
} else {
    // Normal target
    ["Terc"]
};