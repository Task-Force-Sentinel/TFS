#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineresincl.inc"
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_display"];
if (ctrlIDD _display != IDD_MAin_MAP) exitwith {};

private _control = _display displayCtrl IDC_MAP;

_control ctrlAddEventHandler ["MouseMoving", {
    params ["_control"];
    GVAR(TFS_customMark) = "customMark" in (ctrlMapMouseOver _control);
}];

_display displayAddEventHandler ["Keydown", {
    params ["", "_keyCode"];
    if (!isnil QGVAR(TFS_customMark) && {
        GVAR(TFS_customMark)
    } && {
        (_keyCode) == DIK_DELETE
    }) then {
        TFS_unit setVariable ["TFS_customMarkLocation", nil];
    };
}];