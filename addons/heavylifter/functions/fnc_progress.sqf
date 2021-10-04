#include "script_component.hpp"
/*
* Author: Jonpas
* Starts Attach or detach process.
*
* Arguments:
* 0: Helicopter <OBJECT>
*
* Return Value:
* None
*
* Example:
* [heli] call tac_heavylifter_fnc_progress
*
* Public: No
*/

params ["_vehicle"];

if (isnil {
    _vehicle getVariable QGVAR(prepared)
}) then {
    [HEAVYLifTER_PREP_time, [_vehicle], {
        (_this select 0) call FUNC(prepare)
    }, {}, localize LstrinG(Attaching)] call ACEFUNC(common, progressBar);
} else {
    [HEAVYLifTER_PREP_time, [_vehicle], {
        (_this select 0) call FUNC(unprepare)
    }, {}, localize LstrinG(detaching)] call ACEFUNC(common, progressBar);
};