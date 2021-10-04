#include "script_component.hpp"
/*
* Author: Jonpas
* Handles target pop-ups.
*
* Arguments:
* 0: Arguments <ARRAY>
* 0: time Start <NUMBER>
* 1: Duration <NUMBER>
* 2: Pause Duration <NUMBER>
* 3: Target Amount <NUMBER>
* 4: targets <ARRAY>
* 5: invalid targets <ARRAY>
* 6: Controller <OBJECT>
* 7: Controllers <ARRAY>
* 8: name <strinG>
* 9: mode (1 = time, 2 = Hit (time Limited), 3 = Hit (Target Limited), 4 = Trigger, 5 = Rampage) <NUMBER>
* 10: Triggers <ARRAY>
* 1: Per-Frame Handler ID <NUMBER>
*
* Return Value:
* None
*
* Example:
* [ [450, 60, 3, [target1, target2], [invalidTarget1, invalidTarget2], controller, [controller1, controller2], "range", 1, [trigger1, trigger2]], idPFH] call TFS_shootingrange_fnc_popupPFH;
*
* Public: No
*/

params ["_args", "_idPFH"];
_args params ["_timeStart", "_duration", "_pauseDuration", "_targetAmount", "_targets", "_targetsinvalid", "_controller", "_controllers", "_name", "_mode", "_triggers"];

// Remove if stopped - fail
if (!(_controller getVariable [QGVAR(running), false]) || {
    GVAR(invalidTargetHit)
}) exitwith {
    [_idPFH, _controller, _controllers, _name, _targets, _targetsinvalid, _mode, false] call FUNC(popupPFHexit);
};

private _currenttime = CBA_missiontime;

// Remove when time limit (duration) reached - success
if (_mode in [1, 2, 5] && {
    _currenttime >= _timeStart + _duration
}) exitwith {
    [_idPFH, _controller, _controllers, _name, _targets, _targetsinvalid, _mode, true, GVAR(currentscore), GVAR(maxscore)] call FUNC(popupPFHexit);
};

// Remove when all targets hit - success
if ((_mode == 3 && {
    GVAR(targetNumber) >= _targetAmount
}) || {
    _mode > 3 && {
        GVAR(targetNumber) >= count _targets
    }
}) exitwith {
    // round time elapsed to decimal places
    private _timeElapsed = _currenttime - _timeStart;
    _timeElapsed = (str _timeElapsed) splitstring ".";
    _timeElapsed = format ["%1.%2", _timeElapsed select 0, (_timeElapsed select 1) select [0, time_round_CHARS]];
    _timeElapsed = parseNumber _timeElapsed;
    
    [_idPFH, _controller, _controllers, _name, _targets, _targetsinvalid, _mode, true, GVAR(currentscore), GVAR(maxscore), _timeElapsed, _triggers] call FUNC(popupPFHexit);
};

// Handle automatic target pop-ups in time-based mode
if (_mode == 1 && {
    GVAR(lastPausetime) + _pauseDuration <= _currenttime
}) exitwith {
    GVAR(lastPausetime) = _currenttime;
    
    if (GVAR(firstrun)) then {
        GVAR(firstrun) = false;
    } else {
        // animate old target
        [GVAR(targetUp), 1] call FUNC(animateTarget);
        // down
    };
    
    // select random index (save for later removal from array) and new target
    GVAR(nextTarget) = selectRandom (_targets - [GVAR(targetUp)]);
    
    // animate new target
    [GVAR(nextTarget), 0] call FUNC(animateTarget);
    // Up
    
    // Mark target as not yet hit
    GVAR(nextTarget) setVariable [QGVAR(hit), false];
    
    TRACE_2("targets", GVAR(targetUp), GVAR(nextTarget));
    
    // Prepare for next loop
    GVAR(targetUp) = GVAR(nextTarget);
    GVAR(maxscore) = GVAR(maxscore) + 1;
};

// Handle duration and first target only when hit-based mode
if (_mode in [2, 3] && {
    GVAR(firstrun)
}) exitwith {
    GVAR(firstrun) = false;
    
    // select random index (save for later removal from array) and new target
    GVAR(targetUp) = selectRandom _targets;
    
    // animate new target
    GVAR(targetUp) setDamage 0;
    [GVAR(targetUp), 0] call FUNC(animateTarget);
    // Up
};