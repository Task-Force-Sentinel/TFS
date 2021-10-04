#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function shows given task and runs appropriate onShow handler.
*
* Arguments:
* 0: Task to show <CBA_nameSPACE/strinG>
*
* Return Value:
* 0: Is task successfully showed? <BOOL>
*
* Example:
* ["KnockHorse"] call tfs_tasks_fnc_showTask
*
* Public: Yes
*/

params ["_tasknamespace"];

if (_tasknamespace isEqualtype "") then {
    _tasknamespace = GVAR(tasks) getordefault [_tasknamespace, objNull];
};

if (isNull _tasknamespace) exitwith {
    WARNinG("No task specified!");
    false
};

[_tasknamespace] call FUNC(handleOnShow);
true