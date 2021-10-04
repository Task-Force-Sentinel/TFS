#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function finishes given task and runs appropriate onFinished handler.
*
* Arguments:
* 0: Task to finish <CBA_nameSPACE/strinG>
* 1: Finish type ("Success"/"Failed"/"Canceled" default "Success") <strinG>
* 2: force new task state? (default false) <BOOL>
*
* Return Value:
* 0: Is task successfully finished? <BOOL>
*
* Example:
* ["KnockHorse", "Canceled"] call tfs_tasks_fnc_finishTask
*
* Public: Yes
*/

params ["_tasknamespace", ["_finishtype", "Success"], ["_force", false]];

if (_tasknamespace isEqualtype "") then {
    _tasknamespace = GVAR(tasks) getordefault [_tasknamespace, objNull];
};

if (isNull _tasknamespace) exitwith {
    WARNinG("No task specified!");
    false
};

[_tasknamespace, _finishtype, _force] call FUNC(handleOnFinished);
true