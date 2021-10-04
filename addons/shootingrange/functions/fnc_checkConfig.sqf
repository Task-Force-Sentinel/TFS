#include "script_component.hpp"
/*
* Author: Jonpas
* Checks current shooting range configuration
*
* Arguments:
* 0: Controller <OBJECT>
* 1: name <strinG>
* 2: targets <ARRAY> (unused)
*
* Return Value:
* None
*
* Example:
* [controller, "range", [target1, target2]] call TFS_shootingrange_fnc_checkConfig;
*
* Public: No
*/

params ["_controller", "_name", ""];

private _duration = _controller getVariable [QGVAR(duration), DURATION_default];
private _targetAmount = _controller getVariable [QGVAR(targetAmount), TARGETAMOUNT_default];
private _pauseDuration = _controller getVariable [QGVAR(pauseDuration), PAUSEDURATION_default];
private _countdowntime = _controller getVariable [QGVAR(countdowntime), countdoWNtime_default];
private _mode = _controller getVariable [QGVAR(mode), modE_default];

private _textmode = "";
private _textConfig = localize LstrinG(Duration);
private _textDurationorTargetAmount = [localize LstrinG(infinite), format ["%1s", _duration]] select (_duration > 0);

switch (_mode) do {
    case 1: {
        _textmode = localize LstrinG(timed);
    };
    case 2: {
        _textmode = localize LstrinG(HittimeLimit);
    };
    case 3: {
        _textmode = localize LstrinG(HitTargetLimit);
        _textConfig = localize LstrinG(TargetAmount);
        _textDurationorTargetAmount = _targetAmount;
    };
    case 4: {
        _textmode = localize LstrinG(Trigger);
        _textConfig = localize LstrinG(TargetAmount);
        _textDurationorTargetAmount = _targetAmount;
    };
    case 5: {
        _textmode = localize LstrinG(Rampage);
    };
    default {
        _textmode = "ERorR";
        _textConfig = "ERRor",
        _textDurationorTargetAmount = "ERRor"
    };
};

private _text = "";
private _size = 4;

if (_mode == 1) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7<br/>%8: %9s<br/>%10: %11s", localize LstrinG(Range), _name, localize LstrinG(Configuration), localize LstrinG(mode), _textmode, _textConfig, _textDurationorTargetAmount, localize LstrinG(PauseDuration), _pauseDuration, localize LstrinG(countdowntime), _countdowntime];
    _size = _size + 0.5;
};

if (_mode in [2, 3, 5]) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7<br/>%8: %9s", localize LstrinG(Range), _name, localize LstrinG(Configuration), localize LstrinG(mode), _textmode, _textConfig, _textDurationorTargetAmount, localize LstrinG(countdowntime), _countdowntime];
};

if (_mode == 4) then {
    _text = format ["%1 %2 %3<br/><br/>%4: %5<br/>%6: %7s", localize LstrinG(Range), _name, localize LstrinG(Configuration), localize LstrinG(mode), _textmode, localize LstrinG(countdowntime), _countdowntime];
    _size = _size - 0.5;
};

[_text, _size] call ACEFUNC(common, displaytextstructured);