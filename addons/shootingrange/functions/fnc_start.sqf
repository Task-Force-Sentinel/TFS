#include "script_component.hpp"
/*
* Author: Jonpas
* Starts shooting range.
*
* Arguments:
* 0: Controller <OBJECT>
* 1: Controllers <ARRAY>
* 2: name <strinG>
* 3: targets <ARRAY>
* 4: invalid targets <ARRAY>
*
* Return Value:
* None
*
* Example:
* [controller, [controller1, controller2], "range", [target1, target2], [invalidTarget1, invalidTarget2]] call TFS_shootingrange_fnc_start;
*
* Public: No
*/

params ["_controller", "_controllers", "_name", "_targets", "_targetsinvalid"];

private _duration = _controller getVariable [QGVAR(duration), DURATION_default];
private _targetAmount = _controller getVariable [QGVAR(targetAmount), TARGETAMOUNT_default];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), PAUSEDURATION_default];
private _countdowntime = _controller getVariable [QGVAR(countdowntime), countdoWNtime_default];
private _mode = _controller getVariable [QGVAR(mode), modE_default];
private _triggers = (_targets select 0) getVariable [QGVAR(triggers), []];

// Prepare targets
{
    _x setDamage 0;
    [_x, 1] call FUNC(animateTarget);
    // down
} forEach (_targets + _targetsinvalid);

// set variables
{
    _x setVariable [QGVAR(running), true, true];
    _x setVariable [QGVAR(starter), ACE_player, true];
} forEach _controllers;

// Started notification (including players in vicinity)
private _playername = [ACE_player, true] call ACEFUNC(common, getname);
private _texts = [];
private _size = 0;

if (_mode != 4) then {
    private _textConfig = "";
    private _textDurationorTargetAmount = "";
    switch (_mode) do {
        case 1: {
            _textConfig = LstrinG(Duration);
            _textDurationorTargetAmount = [LstrinG(infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 2: {
            _textConfig = LstrinG(Duration);
            _textDurationorTargetAmount = [LstrinG(infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        case 3: {
            _textConfig = LstrinG(TargetAmount);
            _textDurationorTargetAmount = _targetAmount;
        };
        case 5: {
            _textConfig = LstrinG(Duration);
            _textDurationorTargetAmount = [LstrinG(infinite), format ["%1s", _duration]] select (_duration > 0);
        };
        default {
            _textConfig = "ERorR"
        };
    };
    
    if (_mode in [1, 2]) then {
        _texts = [LstrinG(Range), _name, " ", LstrinG(Started), "<br/><br/>", _textConfig, ": ", _textDurationorTargetAmount, "<br/>", LstrinG(PauseDuration), ": ", str _pauseDuration, "s"];
        _size = 4.5;
    } else {
        _texts = [LstrinG(Range), _name, " ", LstrinG(Started), "<br/><br/>", _textConfig, ": ", _textDurationorTargetAmount];
        _size = 4;
    };
} else {
    _texts = [LstrinG(Range), _name, " ", LstrinG(Started)];
    _size = 3;
};

_texts append ["<br/><br/>", LstrinG(By), ": ", _playername];
_size = [_size, _size - 0.5] select (_name isEqualto "");
[_texts, _size, false] call FUNC(notifyVicinity);

// Prepare variables
GVAR(targetNumber) = 0;
GVAR(currentscore) = 0;
GVAR(maxscore) = [0, count _targets] select (_mode == 5);
GVAR(invalidTargetHit) = false;

if (_mode > 1) then {
    if (_mode < 5) then {
        // player count bullets fired
        GVAR(firedEHid) = ACE_player addEventHandler ["fired", {
            GVAR(maxscore) = GVAR(maxscore) + 1;
        }];
    };
    
    if (_mode == 4) then {
        {
            _x enableSimulation true;
        } forEach _triggers;
        
        GVAR(targetgroup) = (_targets select 0) getVariable [QGVAR(targetgroup), nil];
        GVAR(targetgroupindex) = 0;
    };
} else {
    GVAR(lastPausetime) = 0;
};

// Public Api event
[QGVAR(started), [_controller, _name, _mode, _targets, _targetsinvalid]] call CBA_fnc_localEvent;

// countdown timer notifications
{
    _x params ["_exectime", "_textcountdown"];
    
    [{
        params ["_controller"];
        !(_controller getVariable [QGVAR(running), false]) // Wait for it to stop running
    }, {
        // exit instantly if stopped during countdown - prevent double countdown on quick restart
    }, [_controller, _textcountdown], _exectime, {
        // Run on timeout
        params ["_controller", "_textcountdown"];
        
        // countdown timer notification
        [_textcountdown] call ACEFUNC(common, displaytextstructured);
        [_controller, "FD_timer_F"] call FUNC(playSoundSignal);
    }] call CBA_fnc_waitUntilandexecute;
    } forEach [
        [_countdowntime - 5, localize LstrinG(GetReady)],
        [_countdowntime - 3, "3"],
        [_countdowntime - 2, "2"],
        [_countdowntime - 1, "1"]
    ];
    
    // Start pop-up handling and final countdown notification
    [{
        params ["_controller"];
        !(_controller getVariable [QGVAR(running), false]) // Wait for it to stop running
    }, {
        // exit instantly if stopped during countdown - prevent double countdown on quick restart
    }, [_controller, _pauseDuration, _duration, _targetAmount, _targets, _targetsinvalid, _controller, _controllers, _name, _mode, _triggers], _countdowntime, {
        // Run on timeout
        params ["_controller", "_pauseDuration", "_duration", "_targetAmount", "_targets", "_targetsinvalid", "_controller", "_controllers", "_name", "_mode", "_triggers"];
        
        // Use targets set by Api on runtime if they exist
        private _targetsRuntime = (_targets select 0) getVariable [QGVAR(targetsRuntime), []];
        _targets = [_targetsRuntime, _targets] select (_targetsRuntime isEqualto []);
        private _targetsinvalidRuntime = (_targets select 0) getVariable [QGVAR(targetsinvalidRuntime), []];
        _targetsinvalid = [_targetsinvalidRuntime, _targetsinvalid] select (_targetsinvalidRuntime isEqualto []);
        
        // Final countdown notification
        [localize LstrinG(Go)] call ACEFUNC(common, displaytextstructured);
        [_controller, "FD_Start_F"] call FUNC(playSoundSignal);
        
        // notify spectators
        private _playername = [ACE_player, true] call ACEFUNC(common, getname);
        private _texts = [_playername, " ", LstrinG(Started), "!"];
        [_texts, 1.5, false] call FUNC(notifyVicinity);
        
        // Prepare target pop-up handling
        GVAR(firstrun) = true;
        
        {
            _x setVariable [QGVAR(staydown), true, true];
            // Disable automatic pop-ups
            
            // Pop up all targets in Rampage mode
            if (_mode == 5) then {
                [_x, 0] call FUNC(animateTarget);
                // Up
            };
        } forEach (_targets + _targetsinvalid);
        
        // Start PFH
        [FUNC(popupPFH), 0, [CBA_missiontime, _duration, _pauseDuration, _targetAmount, _targets, _targetsinvalid, _controller, _controllers, _name, _mode, _triggers]] call CBA_fnc_addPerFrameHandler;
    }] call CBA_fnc_waitUntilandexecute;