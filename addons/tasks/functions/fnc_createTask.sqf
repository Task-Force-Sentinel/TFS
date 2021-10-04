#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function creates task from given task namespace.
*
* Arguments:
* 0: Task namespace <CBA_nameSPACE>
*
* Return Value:
* None
*
* Example:
* None
*
* Public: No
*/

params ["_taskconfigname", "_tasknamespace"];

inFO_1("Creating '%1'", _taskconfigname);

private _title = _tasknamespace getVariable ["title", ""];
private _description = _tasknamespace getVariable ["description", ""];
private _marker = _tasknamespace getVariable ["marker", ""];
private _object = _tasknamespace getVariable ["object", ""];
private _position = _tasknamespace getVariable ["position", []];
private _destination = [_position, _object, _marker] call FUNC(readDestination);
private _icon = _tasknamespace getVariable ["icon", ""];
private _parentTask = _tasknamespace getVariable ["parentTask", ""];
private _owners = _tasknamespace getVariable ["owners", ["true"]];
private _ownersProcessed = [_owners] call FUNC(readowners);
private _initialState = _tasknamespace getVariable ["initialState", "CREATED"];
private _priority = _tasknamespace getVariable ["priority", -1];
private _createdShownotification = _tasknamespace getVariable ["createdShownotification", ""] == "true";

TRACE_5("Creating", _taskconfigname, _parentTask, _owners, _ownersProcessed, _initialState);

private _taskID = if (_parentTask isEqualto "") then {
    _taskconfigname
} else {
    [_taskconfigname, _parentTask];
};

// Array used for BIS_fnc_taskCreate
private _taskCreateArray = [_ownersProcessed, _taskID, [_description, _title, _marker], _destination, _initialState, _priority, _createdShownotification, _icon];
_tasknamespace setVariable ["taskCreateArray", _taskCreateArray];

// Handle task showing (and creation)
[_tasknamespace] call FUNC(handleShow);