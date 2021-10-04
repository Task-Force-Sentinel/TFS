#include "script_component.hpp"
/*
* Author: Jonpas
* initializes the Shooting Range module.
*
* Arguments:
* 0: The module logic <logIC>
* 1: units <ARRAY> (unused)
* 2: Activated <BOOL>
*
* Return Value:
* None
*
* Public: No
*/

// exit on Headless Client
if (!hasinterface && !isDedicated) exitwith {};

params ["_logic", "", "_activated"];

if (!_activated) exitwith {};
if (isNull _logic) exitwith {};

// Extract name
private _name = _logic getVariable "name";

// Extract target objects and add synchronized objects
private _targets = [_logic getVariable "targets", true, false] call ACEFUNC(common, parselist);
_targets = _targets apply {
    [missionnamespace getVariable _x, objNull] select (isnil _x)
};
_targets append (synchronizedObjects _logic);

// Extract invalid target objects and manually check nil (use object if exists, otherwise objNull)
private _targetsinvalid = [_logic getVariable "targetsinvalid", true, false] call ACEFUNC(common, parselist);
_targetsinvalid = _targetsinvalid apply {
    [missionnamespace getVariable _x, objNull] select (isnil _x)
};
// TRACE_1("invalid targets", _targetsinvalid);

// Exctract controller objects
private _controllers = [_logic getVariable "Controllers", true, true] call ACEFUNC(common, parselist);

// Exctract sound source objects
private _soundSources = [_logic getVariable "SoundSources", true, true] call ACEFUNC(common, parselist);

// Extract target change event
private _mode = _logic getVariable "mode";

// Extract duration string and convert to numbers
private _durations = ([_logic getVariable "Durations", true, false] call ACEFUNC(common, parselist) apply {
    parseNumber _x
});

// Extract default duration
private _defaultDuration = _logic getVariable "defaultDuration";

// Extract target amounts string and convert to numbers
private _targetAmounts = ([_logic getVariable "TargetAmounts", true, false] call ACEFUNC(common, parselist) apply {
    parseNumber _x
});

// Extract default target amount
private _defaultTargetAmount = _logic getVariable "defaultTargetAmount";

// Extract pause duration string and convert to numbers
private _pauseDurations = ([_logic getVariable "PauseDurations", true, false] call ACEFUNC(common, parselist) apply {
    parseNumber _x
});

// Extract default pause duration
private _defaultPauseDuration = _logic getVariable "defaultPauseDuration";

// Extract countdown times
private _countdowntimes = ([_logic getVariable "countdowntimes", true, false] call ACEFUNC(common, parselist) apply {
    parseNumber _x
});

// Extract default countdown time
private _defaultcountdowntime = _logic getVariable "defaultcountdowntime";

// Exctract triggers
private _triggerMarkers = [_logic getVariable "TriggerMarkers", true, false] call ACEFUNC(common, parselist);

// Extract pop targets down on trigger exit setting
private _popOnTriggerexit = _logic getVariable "PopOnTriggerexit";

// Prepare with actions
[_name, _targets, _controllers, _mode, _durations, _defaultDuration, _targetAmounts, _defaultTargetAmount, _pauseDurations, _defaultPauseDuration, _countdowntimes, _defaultcountdowntime, _triggerMarkers, _popOnTriggerexit, _targetsinvalid, _soundSources] call FUNC(create);

inFO_1("Shooting Range module initialized (%1)", _name);