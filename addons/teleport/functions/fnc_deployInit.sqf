#include "\z\tfs\addons\teleport\script_component.hpp"
[{
    time > 0
}, {
    params ["_logic", "_units", "_activated"];
    if (_activated) then {
        _units = [_logic] call CFUNC(moduleunits);
        _pos = getPos _logic;
        {
            _uPos = _pos vectorAdd [random 100 - random 100, random 100 - random 100, random 15 - random 15];
            [_x, _uPos] remoteExecCall [QFUNC(paradrop), _x];
        } forEach _units;
    };
}, _this] call CBA_fnc_waitUntilandexecute;