#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function handles showing task.
* Prepares conditions/events required to show task.
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

// load show code condition
private _conditionCodeShowValue = _tasknamespace getVariable ["conditionCodeShow", "true"];
private _conditionCodeShow = compile _conditionCodeShowValue;
private _conditionCodeEmpty = (_conditionCodeShowValue isEqualto "true" || {
    _conditionCodeShowValue isEqualto ""
});

// load show event condition
private _conditionEventsShow = _tasknamespace getVariable ["conditionEventsShow", []];
private _conditionEventsEmpty = _conditionEventsShow isEqualto [];

if (_conditionEventsEmpty && {
    _conditionCodeEmpty
}) exitwith {
    // Show task
    [{
        private _tasknamespace = _this;
        [_tasknamespace] call FUNC(handleOnShow);
    }, _tasknamespace] call CBA_fnc_execNextFrame;
};

if (!_conditionCodeEmpty) then {
    // Wait until code condition is true
    [_conditionCodeShow, {
        private _tasknamespace = _this;
        [_tasknamespace] call FUNC(handleOnShow);
    }, _tasknamespace] call CBA_fnc_waitUntilandexecute;
};

if (!_conditionEventsEmpty) then {
    // Create EventHandler for all events
    {
        [_x, {
            private _tasknamespace = _thisArgs;
            // Remove EH so it can be triggered only once for given task.
            [_thistype, _thisId] call CBA_fnc_removeEventHandler;
            // increase counter how many events already fired
            private _currentEventsfired = _tasknamespace getVariable ["conditionShowEventsfired", 0];
            inC(_currentEventsfired);
            _tasknamespace setVariable ["conditionShowEventsfired", _currentEventsfired];
            // Check if events requirements are met
            if (_currentEventsfired < (_tasknamespace getVariable ["conditionEventsShowRequired", 1])) exitwith {};
            // Run onShow
            [_tasknamespace] call FUNC(handleOnShow);
        }, _tasknamespace] call CBA_fnc_addEventHandlerArgs;
    } forEach _conditionEventsShow;
};

nil