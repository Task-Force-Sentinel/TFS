#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _ctrlSpectatorlistBox = (_display displayCtrl IDC_TFS_adminMENU_RESP_SPECTAtorlist);

private _selection = _ctrlSpectatorlistBox lbtext (lbCurSel _ctrlSpectatorlistBox);
private _obj = objNull;
{
    private _name = _x getVariable ["TFS_spectator_name", name _x];
    if (_selection == _name) exitwith {
        _obj = _x;
    };
} forEach GVAR(spectatorlist);

if (!(isNull _obj)) then {
    private _role = lbCurSel (_display displayCtrl IDC_TFS_adminMENU_RESP_ROLECOMBO);
    // Role
    private _rank = GVAR(respawn_rank);
    // rank
    
    GVAR(selectedRespawngroup) pushBack [_rank, _obj, _role];
};

[_display] call FUNC(respawn_refreshSpectatorlist);
[_display] call FUNC(respawn_refreshgroupBox);