#include "\z\tfs\addons\spectator\script_component.hpp"
params ["_unit"];
disableSerialization;
private _color = (side group _unit) call CFUNC(sidetoColor);

private _control = (uiNamespace getVariable [QGVAR(display), displayNull]) ctrlCreate [QGVAR(EntityTag), -1];

_control ctrlShow false;

[_control, "\A3\ui_f\data\map\markers\military\triangle_CA.paa", _color] call FUNC(controlsetpicture);
[_control, name _unit] call FUNC(controlsettext);
[_control, "", [], true] call FUNC(controlsettext);
_unit setVariable [QGVAR(tagControl), [_control]];
_control setVariable [QGVAR(attached), _unit];
GVAR(controls) pushBack _control;