#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function handles executing onShowCode and raising onShowEvents for given task
*
* Arguments:
* 0: Task namespace <CBA_nameSPACE>
*
* Return Value:
* None
*
* Public: No
*/

params ["_tasknamespace"];

// Check if task was shown already
if (_tasknamespace getVariable ["shown", false]) exitwith {};
_tasknamespace setVariable ["shown", true];

private _taskconfigname = _tasknamespace getVariable "taskconfigname";
private _taskCreateArray = _tasknamespace getVariable "taskCreateArray";

// Get scripted owners
private _scriptedowners = call compile (_tasknamespace getVariable ["ownersCode", ""]);
if (!isnil "_scriptedowners") then {
    inFO_2("Scripted owners '%1' for task '%2'", _scriptedowners, _taskconfigname);
    _taskCreateArray set [0, _scriptedowners];
};

// Create task
_taskCreateArray call BIS_fnc_taskCreate;

[QGVAR(taskCreated), [_taskconfigname]] call CBA_fnc_globalEvent;

// call onShowCode
call compile (_tasknamespace getVariable ["onShowCode", ""]);

// Raise onShowEvents
{
    [_x] call CBA_fnc_serverEvent;
} forEach (_tasknamespace getVariable ["onShowEvents", []]);

// Prepare Success and Failed handling
[_tasknamespace, "Success", FUNC(handleOnFinished)] call FUNC(handleFinish);
[_tasknamespace, "Failed", FUNC(handleOnFinished)] call FUNC(handleFinish);
[_tasknamespace, "Canceled", FUNC(handleOnFinished)] call FUNC(handleFinish);