#include "script_component.hpp"
/*
* Author: Jonpas
* Adds shooting range durations configuration child interactions to a controller.
*
* Arguments:
* 0: name <strinG>
* 1: Controller <OBJECT>
* 2: Controllers <ARRAY>
* 3: Durations <ARRAY>
* 4: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", controller, [controller1, controller2], [5, 10, 20], [target1, target2]] call TFS_shootingrange_fnc_addConfigDurations;
*
* Public: No
*/

params ["_name", "_controller", "_controllers", "_durations", "_targets"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigDuration%1), _forEachindex + 1],
            [
                localize LstrinG(infinite),
                format ["%1 %2", _x, localize LstrinG(Seconds)]
            ] select (_x > 0),
            "",
            {
                (_this select 2) call FUNC(setConfigDuration)
            },
            {
                true
            },
            {},
            [_name, _controllers, _x, _targets]
        ] call ACEFUNC(interact_menu, createaction),
        [],
        _controller // IGNorE_private_WARNinG(_controller)
    ];
} forEach _durations;

// TRACE_1("Children actions", _actions);

_actions