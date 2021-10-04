#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

// Per-side endings
if (cbChecked (_display displayCtrl IDC_TFS_adminMENU_ENDM_sideSPECifIC)) exitwith {
    private _isDraw = cbChecked (_display displayCtrl IDC_TFS_adminMENU_ENDM_sideDRAW);
    if (_isDraw) then {
        [QGVAR(draw)] remoteExec [QEFUNC(common, endMission)];
    } else {
        private _winners = [];
        if ((missionnamespace getVariable [QGVAR(doUBLES(ending, blufor)), 0]) isEqualto 1) then {
            _winners pushBack blufor;
        };
        if ((missionnamespace getVariable [QGVAR(doUBLES(ending, opfor)), 0]) isEqualto 1) then {
            _winners pushBack opfor;
        };
        if ((missionnamespace getVariable [QGVAR(doUBLES(ending, resistance)), 0]) isEqualto 1) then {
            _winners pushBack resistance;
        };
        if ((missionnamespace getVariable [QGVAR(doUBLES(ending, civilian)), 0]) isEqualto 1) then {
            _winners pushBack civilian;
        };
        
        [_winners] remoteExec [QFUNC(endMission_sideSpecificlocal)];
        [format ["%1 Ended Mission, Winners: %2", profileName, _winners], false, "admin Menu"] call FUNC(log);
    };
};

// Custom text ending
if (cbChecked (_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM)) exitwith {
    private _title = ctrltext (_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_TITLE);
    private _subtext = ctrltext (_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_SUBtext);
    missionnamespace setVariable [QEGVAR(common, endMissiontext), [_title, _subtext], true];
    
    private _isDefeat = cbChecked (_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_ISDEFEAT);
    [[QGVAR(victory), QGVAR(defeat)] select _isDefeat, !_isDefeat] remoteExec [QEFUNC(common, endMission)];
    [format ["%1 Ended Mission, Title: %2, subtext: %3, isDefeat: %4", profileName, _title, _subtext, _isDefeat], false, "admin Menu"] call FUNC(log);
};

// Endings from description.ext CfgDebriefing
private _list = _display displayCtrl IDC_TFS_adminMENU_ENDM_list;
private _ending = _list lbData (lbCurSel _list);
private _isDefeat = cbChecked (_display displayCtrl IDC_TFS_adminMENU_ENDM_fromMISSION_ISDEFEAT);
[_ending, !_isDefeat] remoteExec [QEFUNC(common, endMission)];
[format ["%1 Ended Mission, Endtype: %2, isDefeat: %3", profileName, _ending, _isDefeat], false, "admin Menu"] call FUNC(log);