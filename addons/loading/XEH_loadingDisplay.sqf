#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResinclDesign.inc"
/*
* Author: veteran29
* initializes loading screen display and adds TFS branding.
*
* Arguments:
* 0: loading display <DISPLAY>
*
* Return Value:
* None
*
* Public: No
*/

params ["_display"];

TRACE_1("loading screen", _display);

private _size = 0.1;
private _width = _size * safeZoneW;
private _height = _size * safeZoneH * (getResolution select 4);

private _picture = _display ctrlCreate ["Rscpicture", -1];
_picture ctrlsetPosition [
    safeZoneX,
    safeZoneY + safeZoneH - _height,
    _width, _height
];

switch (systemtime select 1) do {
    case 10: {
        _picture ctrlsettext QPATHtoF(ui\TFSlogO-1hal@0.5x.paa);
    };
    case 12: {
        _picture ctrlsettext QPATHtoF(ui\TFSlogO-1xmas@0.5x.paa);
    };
    case ([] call EFUNC(common, easterdate) select 1): {
        _picture ctrlsettext QPATHtoF(ui\TFSlogOcolor2@.5.paa);
    };
    default {
        _picture ctrlsettext QPATHtoF(ui\TFSlogOcolor2@.5.paa);
    };
};
_picture ctrlCommit 0;

private _ctrlBg = _display displayCtrl IDC_loadinGSTART_CUStoM_BG;
private _backgroundCfg = uiNamespace getVariable [QGVAR(backgroundCfg), configNull];
if (isNull _backgroundCfg) then {
    _backgroundCfg = selectRandom ("true" configClasses (CFG_loadinG_SCREEN >> "Backgrounds"));
    uiNamespace setVariable [QGVAR(backgroundCfg), _backgroundCfg];
    TRACE_1("loading background", _backgroundCfg);
};

_ctrlBg ctrlsettext gettext (_backgroundCfg >> "path");
_ctrlBg ctrlCommit 0;

private _ctrlGrploadingStart = _display displayCtrl IDC_loadinGSTART_loadinGSTART;
private _loadingLabel = _display ctrlCreate ["Rscstructuredtext", -1, _ctrlGrploadingStart];
_loadingLabel ctrlsetPosition [0, 0, 1, 1];
_loadingLabel ctrlsetstructuredtext parsetext ([
    '<t size="1.17" shadow="2">',
    format [LLstrinG(Author), gettext (_backgroundCfg >> "author")],
    '</t>'
] joinstring "");
_loadingLabel ctrlCommit 0;

_loadingLabel ctrlsetPosition [
    safeZoneW - ctrltextWidth _loadingLabel,
    0,
    ctrltextWidth _loadingLabel, ctrltextHeight _loadingLabel
];
_loadingLabel ctrlCommit 0;

nil