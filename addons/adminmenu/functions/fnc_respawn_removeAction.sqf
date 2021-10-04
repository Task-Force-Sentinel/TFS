#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _ctrlgrouplistBox = (_display displayCtrl IDC_TFS_adminMENU_RESP_grouplist);

GVAR(selectedRespawngroup) deleteAt (lbCurSel _ctrlgrouplistBox);

[_display] call FUNC(respawn_refreshSpectatorlist);
[_display] call FUNC(respawn_refreshgroupBox);