#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_faction);
/* faction Control */
private _faction = _control lbData (lbCurSel _control);
GVAR(lastfactionselection) set [1, lbCurSel _control];
private _classes = [];

// missionConfigFile overrides.
call {
    if (isClass (missionConfigFile >> "Cfgloadouts" >> _faction)) exitwith {
        _classes = configProperties [missionConfigFile >> "Cfgloadouts" >> _faction, "isClass _x"];
    };
    if (isClass (configFile >> "Cfgloadouts" >> _faction) && count _classes <= 0) exitwith {
        _classes = configProperties [configFile >> "Cfgloadouts" >> _faction, "isClass _x"];
    };
};

private _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_ROLECOMBO);
/* Role control */
lbClear _control;
respawnMenuRoles = [];
{
    private _displayname = gettext(_x >> "displayname");
    private _index = _control lbAdd _displayname;
    private _configname = (configname _x);
    respawnMenuRoles pushBack [_configname, _displayname];
    _control lbsetData [_index, _configname];
} forEach _classes;
if (count _classes > 0) then {
    _control lbsetCurSel 0;
};

GVAR(selectedRespawngroup) = [];
[_display] call FUNC(respawn_refreshSpectatorlist);
[_display] call FUNC(respawn_refreshgroupBox);