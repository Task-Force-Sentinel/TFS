#include "script_component.hpp"
/*
* Author: Jonpas
* Adds shooting range countdown times configuration child interactions to a controller.
*
* Arguments:
* 0: name <strinG>
* 1: Controller <OBJECT>
* 2: Controllers <ARRAY>
* 3: countdown times <ARRAY>
* 4: targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* ["range", controller, [controller1, controller2], [6, 9], [target1, target2]] call TFS_shootingrange_fnc_addConfigcountdowntimes;
*
* Public: No
*/

params ["_name", "_controller", "_controllers", "_countdowntimes", "_targets"];

private _actions = [];
{
    _actions pushBack [
        [
            format [QGVAR(RangeConfigcountdowntime%1), _forEachindex + 1],
            format ["%1 %2", _x, localize LstrinG(Seconds)],
            "",
            {
                (_this select 2) call FUNC(setConfigcountdowntime)
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
} forEach _countdowntimes;

_actions