#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function handles completing task.
* Prepares conditions/events required to complete task.
*
* Arguments:
* 0: Task namespace <CBA_nameSPACE>
* 1: Task finish type "Success"/"Failed"/"Canceled" <strinG>
* 2: callback function "handleOnXXX" <CODE>
*
* Return Value:
* None
*
* Public: No
*/

params ["_tasknamespace", "_finishtype", "_callbackFunction"];

// load code condition
private _conditionCodeFinishValue = _tasknamespace getVariable [format ["conditionCode%1", _finishtype], "true"];
private _conditionCodeFinish = compile _conditionCodeFinishValue;
private _conditionCodeEmpty = (_conditionCodeFinishValue isEqualto "true" || {
    _conditionCodeFinishValue isEqualto ""
});

// load event condition
private _conditionEventsFinish = _tasknamespace getVariable [format ["conditionEvents%1", _finishtype], []];
private _conditionEventsEmpty = _conditionEventsFinish isEqualto [];

if (!_conditionEventsEmpty) then {
    // Create EventHandler for all events
    {
        [_x, {
            _thisArgs params ["_tasknamespace", "_finishtype", "_callbackFunction"];
            // Remove EH so it can be triggered only once for given task.
            [_thistype, _thisId] call CBA_fnc_removeEventHandler;
            // increase counter how many events already fired
            private _counterVariable = format ["condition%1Eventsfired", _finishtype];
            private _currentEventsfired = _tasknamespace getVariable [_counterVariable, 0];
            inC(_currentEventsfired);
            _tasknamespace setVariable [_counterVariable, _currentEventsfired];
            // Check if events requirements are met
            if (_currentEventsfired < (_tasknamespace getVariable [format ["conditionEvents%1Required", _finishtype], 1])) exitwith {};
            // Run callback
            [_tasknamespace, _finishtype] call _callbackFunction;
        }, [_tasknamespace, _finishtype, _callbackFunction]] call CBA_fnc_addEventHandlerArgs;
    } forEach _conditionEventsFinish;
};

if (!_conditionCodeEmpty) then {
    // Wait until code condition is true
    [_conditionCodeFinish, {
        params ["_tasknamespace", "_finishtype", "_callbackFunction"];
        [_tasknamespace, _finishtype] call _callbackFunction;
    }, [_tasknamespace, _finishtype, _callbackFunction]] call CBA_fnc_waitUntilandexecute;
};

nil