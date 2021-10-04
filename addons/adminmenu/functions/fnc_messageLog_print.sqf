#include "\z\tfs\addons\adminmenu\script_component.hpp"
/* ----------------------------------------------------------------------------
internal Function: TFS_adminmenu_fnc_messagelog_print

Description:
Prints current selected log entry to RPT

parameters:
_ctrl - Print button control

Examples:
(begin example)
[_ctrl] call TFS_adminmenu_fnc_messagelog_print;
(end)

Author:
Freddo
---------------------------------------------------------------------------- */
disableSerialization;
params ["_ctrl"];

private _display = ctrlParent _ctrl;
private _lbCtrl = _display displayCtrl IDC_TFS_adminMENU_MSGS_list;
private _curSel = lbCurSel _lbCtrl;
TRACE_3("messagelog print", _display, _lbCtrl, _curSel);

private _imgPath = toLower (_lbCtrl lbpictureRight _curSel);
private _return = format [
    "[TFS adminmenu] Printed entry: %1%2",
    ["", "[WARNinG] "] select (_imgPath find "warning.paa" != -1),
    (_lbCtrl lbtext _curSel)
];

log_1("Printed logged message to RPT: ""%1""", _return);
diag_log _return;
_return