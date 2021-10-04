#include "script_component.hpp"
/*
* Author: PabstMirror
* executes the given code after settings are initialized.
*
* Arguments:
* 0: Function <CODE>
* 1: Arguments <ANY> (default: [])
*
* Return Value:
* None
*
* Example:
* [_function, _args] call afm_common_fnc_runAftersettingsinit
*
* Public: No
*/

params [
    ["_function", {}, [{}]],
    ["_args", []]
];

if (GVAR(settingsinitialized)) then {
    // settings already initialized, directly run the code
    [_function, _args] call CBA_fnc_directcall;
} else {
    // Waiting for settings to be initialized, add to delayed code array
    GVAR(runAftersettingsinit) pushBack [_function, _args];
};

nil