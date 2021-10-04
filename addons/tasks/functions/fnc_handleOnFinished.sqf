#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function changes task state to SUCCEEDED
* and handles raising onSuccessEvents for given task.
*
* Arguments:
* 0: Task namespace <CBA_nameSPACE>
* 1: Finish type "Success"/"Failed"/"Canceled" <strinG>
* 2: force new task state? <BOOL>
*
* Return Value:
* None
*
* Public: No
*/

params ["_tasknamespace", "_finishtype", ["_force", false]];

private _taskconfigname = _tasknamespace getVariable "taskconfigname";

// Check if task was finished already or we force state change
if (!_force && {
    (_taskconfigname call BIS_fnc_taskState) in FinISHED_TASK_STATES
}) exitwith {
    nil
};

private _newtaskState = switch (_finishtype) do {
    case "Success": {
        "SUCCEEDED"
    };
    case "Failed": {
        "FAILED"
    };
    case "Canceled": {
        "CANCELED"
    };
};

// set task state
[_taskconfigname, _newtaskState] call BIS_fnc_tasksetState;

[QGVAR(taskStateChanged), [_taskconfigname, _newtaskState]] call CBA_fnc_globalEvent;

// call code
call compile (_tasknamespace getVariable [format ["on%1Code", _finishtype], ""]);

// Raise events
{
    [_x] call CBA_fnc_serverEvent;
} forEach (_tasknamespace getVariable [format ["on%1Events", _finishtype], []]);