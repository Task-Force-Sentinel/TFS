#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_factionCATEGorY);
private _newIdx = (lbCurSel _control);
GVAR(currentfactionCategory) = _control lbData _newIdx;
GVAR(lastfactionselection) set [0, _newIdx];

[_display] call FUNC(respawn_refreshfactionCategory);