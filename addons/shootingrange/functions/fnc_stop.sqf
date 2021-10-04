#include "script_component.hpp"
/*
* Author: Jonpas
* stops shooting range.
*
* Arguments:
* 0: Controller <OBJECT>
* 1: Controllers <ARRAY>
* 2: name <strinG>
* 3: targets <ARRAY>
* 4: invalid targets <ARRAY>
* 5: Success <BOOL> (default: false)
* 6: score <NUMBER> (default: 0)
* 7: maximum score <NUMBER> (default: 0)
* 8: time Elapsed <NUMBER> (default: 0)
*
* Return Value:
* None
*
* Example:
* [controller, [controller1, controller2], "range", [target1, target2], [invalidTarget1, invalidTarget2]] call TFS_shootingrange_fnc_stop;
*
* Public: No
*/

params ["_controller", "_controllers", "_name", "_targets", "_targetsinvalid", ["_success", false], ["_score", 0], ["_maxscore", 0], ["_timeElapsed", 0]];

// set targets to original
{
    _x setDamage 0;
    [_x, 0] call FUNC(animateTarget);
    // Up
    _x setVariable [QGVAR(hit), nil];
    _x setVariable [QGVAR(staydown), false, true];
    // Enable automatic pop-ups
} forEach (_targets + _targetsinvalid);

// set variables
{
    _x setVariable [QGVAR(running), false, true];
    _x setVariable [QGVAR(starter), nil, true];
} forEach _controllers;

// notification
private _playername = [ACE_player, true] call ACEFUNC(common, getname);
[_controller, "FD_Finish_F"] call FUNC(playSoundSignal);

private _scorePercentage = 0;
private _mode = _controller getVariable [QGVAR(mode), modE_default];

if (_success) then {
    // Check for zero divisor
    if (_maxscore > 0) then {
        _scorePercentage = round (_score / _maxscore * 100);
    };
    
    private _ratingtype = [LstrinG(Accuracy), LstrinG(targetsHit)] select (_mode == 5);
    private _texts = [LstrinG(Range), _name, " ", LstrinG(Finished), "<br/><br/>", _ratingtype, ": ", str _scorePercentage, "% (", str _score, "/", str _maxscore, ")"];
    private _size = 4;
    
    if (_timeElapsed > 0) then {
        _texts append ["<br/>", LstrinG(timeElapsed), ": ", str _timeElapsed, "s"];
        _size = _size + 0.5;
    };
    
    _texts append ["<br/><br/>", LstrinG(By), ": ", _playername];
    _size = [_size, _size - 0.5] select (_name isEqualto "");
    [_texts, _size, true] call FUNC(notifyVicinity);
    
    // Print result to server and client RPT
    _texts = _texts apply {
        [_x, "<br/><br/>", ". "] call CBA_fnc_replace
    };
    // Remove double newlines first
    _texts = _texts apply {
        [_x, "<br/>", ". "] call CBA_fnc_replace
    };
    [QGVAR(logResult), [_texts]] call CBA_fnc_serverEvent;
    if (!isServer) then {
        [QGVAR(logResult), [_texts]] call CBA_fnc_localEvent;
    };
} else {
    private _texts = [LstrinG(Range), "<br/>", _name, "<br/><br/>"];
    private _size = 4;
    if (GVAR(invalidTargetHit)) then {
        _texts append [LstrinG(Failed), "<br/>", LstrinG(invalidTargetHit)];
        _size = _size + 0.5;
    } else {
        _texts append [LstrinG(stopped)];
    };
    _texts append ["<br/><br/>", LstrinG(By), ": ", _playername];
    [_texts, _size, true] call FUNC(notifyVicinity);
    GVAR(invalidTargetHit) = nil;
};

// Public Api event
[QGVAR(stopped), [_controller, _name, _mode, _success, _scorePercentage, _timeElapsed]] call CBA_fnc_localEvent;