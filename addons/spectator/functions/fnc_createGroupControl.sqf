#include "\z\tfs\addons\spectator\script_component.hpp"
params ["_grp"];
disableSerialization;

private _control = (uiNamespace getVariable [QGVAR(display), displayNull]) ctrlCreate [QGVAR(groupTag), -1];
_control ctrlShow false;

private _twGrpMkr = [_x] call EFUNC(orbat, getgroupMarkerData);
if (count _twGrpMkr == 3) then {
    _twGrpMkr params ["_grptexture", "_gname"];
    [_control, _grptexture, [1, 1, 1, 1]] call FUNC(controlsetpicture);
    [_control, _gname] call FUNC(controlsettext);
} else {
    private _grpCache = _x getVariable [QGVAR(grpCache), [[], [1, 1, 1, 1], true]];
    private _grpPos = _grpCache # 0;
    if (count _grpPos <= 0) then {
        _grpCache = ([_x] call FUNC(updategroupCache));
    };
    [_control, "\A3\ui_f\data\map\markers\nato\b_unknown.paa", _grpCache # 1] call FUNC(controlsetpicture);
    [_control, groupid _grp] call FUNC(controlsettext);
};
[_control, "", [], true] call FUNC(controlsettext);
_grp setVariable [QGVAR(tagControl), [_control]];
_control setVariable [QGVAR(attached), _grp];
GVAR(controls) pushBack _control;