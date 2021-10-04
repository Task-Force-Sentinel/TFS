#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params ["_trigger"];

private _data = _trigger getVariable [QGVAR(serialised_trigger), []];

if (count _data == 0) exitwith {};

_data params [
    ["_statements", ["this", "", ""], [[]], 3],
    ["_delays", [0, 0, 0, false], [[]], 4],
    ["_activation", ["NONE", "PRESENT", false], [[]], 3],
    ["_interval", 0.5, [0]]
];

_trigger settriggerStatements _statements;
_trigger settriggerTimeout _delays;
_trigger settriggerActivation _activation;
_trigger settriggerInterval _interval;

TRACE_5("admin Eye restored trigger", _trigger, _statements, _delays, _activation, _interval);