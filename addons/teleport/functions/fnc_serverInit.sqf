#include "\z\tfs\addons\teleport\script_component.hpp"
params ["_logic", "_units", "_activated"];
_units = [_logic] call CFUNC(moduleunits);
if (_activated) then {
    _duration = _logic getVariable ["timeLimit", 120];
    _alt = _logic getVariable ["Altitude", 0];
    _parachute = _logic getVariable ["Parachute", false];
    _leadersOnly = _logic getVariable ["leadersOnly", true];
    if (_leadersOnly) then {
        _units = _units select {
            leader _x == _x
        }
    };
    _units = _units select {
        isplayer _x
    };
    if (count _units > 0) then {
        [_duration, _alt, _parachute, _leadersOnly] remoteExec [QFUNC(playerinit), _units];
    };
};