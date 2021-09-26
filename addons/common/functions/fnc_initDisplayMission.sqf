#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineresincl.inc"
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_display"];
if (ctrlIDD _display != IDD_MAIN_MAP) exitWith {};

private _control = _display displayCtrl IDC_MAP;

_control ctrlAddEventHandler ["MouseMoving", {
    params ["_control"];
    GVAR(TFS_customMark) = "customMark" in (ctrlMapMouseOver _control);
}];

_display displayAddEventHandler ["KeyDown", {
    params ["", "_keyCode"];
    if (!isNil QGVAR(TFS_customMark) && {GVAR(TFS_customMark)} && {(_keyCode) == DIK_DELETE}) then {
        TFS_unit setVariable ["TFS_customMarkLocation",nil];
    };
}];
