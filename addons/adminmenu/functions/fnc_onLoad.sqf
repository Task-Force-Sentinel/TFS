#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];
uiNamespace setVariable [QGVAR(display), _display];

{
    (_display displayCtrl _x) ctrlEnable false;
    (_display displayCtrl _x) ctrlShow false;
} forEach IDCS_TFS_adminMENU_UTIL;

if (!isMultiplayer) then {
    (_display displayCtrl IDC_TFS_adminMENU_DASH_CURradmin) ctrlsettext "none (singleplayer)";
};

// Mission Maker's notes
private _ctrlMissionnotes = (_display displayCtrl IDC_TFS_adminMENU_G_DASH_MISSIONnotES) controlsgroupCtrl IDC_TFS_adminMENU_DASH_MISSIONnotES;
if (!isnil QEGVAR(briefing, admin) && {
    EGVAR(briefing, admin) isEqualtype ""
}) then {
    _ctrlMissionnotes ctrlsetstructuredtext parsetext EGVAR(briefing, admin);
} else {
    _ctrlMissionnotes ctrlsetstructuredtext parsetext "No admin notes provided!";
};
private _notesPos = ctrlposition _ctrlMissionnotes;
_notesPos set [3, ctrltextHeight _ctrlMissionnotes];
_ctrlMissionnotes ctrlsetPosition _notesPos;
_ctrlMissionnotes ctrlCommit 0;

// Safestart
private _ctrlCheckSafestart = _display displayCtrl IDC_TFS_adminMENU_DASH_SAFESTART;
_ctrlCheckSafestart cbsetChecked ([] call EFUNC(safestart, isActive));
_ctrlCheckSafestart ctrlAddEventHandler ["CheckedChanged", {
    if ((param [1]) isEqualto 0) then {
        [true] call EFUNC(safestart, end);
        [format ["%1 Ended safestart", profileName], false, "admin Menu"] call FUNC(log);
    } else {
        [-1, true] call EFUNC(safestart, set);
        [format ["%1 Enabled safestart", profileName], false, "admin Menu"] call FUNC(log);
    };
}];

// Talk to spectators
private _ctrlCheckSpectatorTalk = _display displayCtrl IDC_TFS_adminMENU_DASH_SPECTAtorTALK;
_ctrlCheckSpectatorTalk cbsetChecked ([player] call acre_api_fnc_isSpectator);
if (alive player) then {
    _ctrlCheckSpectatorTalk ctrlAddEventHandler ["CheckedChanged", {
        params ["", "_state"];
        [_state isEqualto 1] call acre_api_fnc_setSpectator;
        systemChat format ["[TFS admin Menu] Spectator talk toggled %1", ["off", "on"] select _state];
        if (_state isEqualto 1) then {
            [format ["%1 Started talking to spectators", profileName], false, "admin Menu"] call FUNC(log);
        } else {
            [format ["%1 stopped talking to spectators", profileName], false, "admin Menu"] call FUNC(log);
        };
    }];
} else {
    _ctrlCheckSpectatorTalk ctrlEnable false;
    _ctrlCheckSpectatorTalk ctrlsettooltip "Can't toggle when in spectator yourself.";
};

// player Management tab

private _ctrlFilterside = _display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_side;
{
    _x params ["_icon", "_text"];
    _ctrlFilterside lbAdd _text;
    _ctrlFilterside lbsetpicture [_forEachindex, _icon];
    } forEach [
        ["\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa", "All sides"],
        ["\a3\ui_f\data\Map\Diary\Icons\playerwest_ca.paa", "blufor"], // fetch from profile vars
        ["\a3\ui_f\data\Map\Diary\Icons\playereast_ca.paa", "opfor"],
        ["\a3\ui_f\data\Map\Diary\Icons\playerGuer_ca.paa", "independent"],
        ["\a3\ui_f\data\Map\Diary\Icons\playerCiv_ca.paa", "civilian"]
    ];
    _ctrlFilterside lbsetCurSel 0;
    _ctrlFilterside ctrlAddEventHandler ["LBSelChanged", {
        params ["_ctrlCombo"];
        
        private _display = ctrlParent _ctrlCombo;
        _display call FUNC(playerManagement_updatelist);
    }];
    
    private _ctrlFilterState = _display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_STATE;
    {
        _ctrlFilterState lbAdd _x;
    } forEach ["alive and Dead", "alive", "Dead"];
    _ctrlFilterState lbsetCurSel 0;
    _ctrlFilterState ctrlAddEventHandler ["LBSelChanged", {
        params ["_ctrlCombo"];
        
        private _display = ctrlParent _ctrlCombo;
        _display call FUNC(playerManagement_updatelist);
    }];
    
    private _ctrlReset = _display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_REset;
    _ctrlReset ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrlButton"];
        _ctrlButton call FUNC(debounceButton);
        
        private _display = ctrlParent _ctrlButton;
        (_display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_side) lbsetCurSel 0;
        (_display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_STATE) lbsetCurSel 0;
        _display call FUNC(playerManagement_updatelist);
    }];
    
    private _ctrlRefresh = _display displayCtrl IDC_TFS_adminMENU_PMAN_REFRESH;
    _ctrlRefresh ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrlButton"];
        _ctrlButton call FUNC(debounceButton);
        
        private _display = ctrlParent _ctrlButton;
        _display call FUNC(playerManagement_updatelist);
    }];
    
    private _ctrlselectAll = _display displayCtrl IDC_TFS_adminMENU_PMAN_SEL_ALL;
    _ctrlselectAll ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrlButton"];
        _ctrlButton call FUNC(debounceButton);
        
        private _display = ctrlParent _ctrlButton;
        private _ctrllist = _display displayCtrl IDC_TFS_adminMENU_PMAN_list;
        for "_i" from 0 to ((lbsize _ctrllist) - 1) do {
            _ctrllist lbsetselected [_i, true];
        };
        
        GVAR(playerManagement_selected) = +GVAR(playerManagement_players);
    }];
    
    private _ctrlselectNone = _display displayCtrl IDC_TFS_adminMENU_PMAN_SEL_NONE;
    _ctrlselectNone ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrlButton"];
        _ctrlButton call FUNC(debounceButton);
        
        private _display = ctrlParent _ctrlButton;
        private _ctrllist = _display displayCtrl IDC_TFS_adminMENU_PMAN_list;
        for "_i" from 0 to ((lbsize _ctrllist) - 1) do {
            _ctrllist lbsetselected [_i, false];
        };
        
        GVAR(playerManagement_selected) = [];
    }];
    
    private _ctrlselectinvert = _display displayCtrl IDC_TFS_adminMENU_PMAN_SEL_inVERT;
    _ctrlselectinvert ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrlButton"];
        _ctrlButton call FUNC(debounceButton);
        
        private _display = ctrlParent _ctrlButton;
        private _ctrllist = _display displayCtrl IDC_TFS_adminMENU_PMAN_list;
        for "_i" from 0 to ((lbsize _ctrllist) - 1) do {
            _ctrllist lbsetselected [_i, !(_ctrllist lbIsselected _i)];
        };
        
        GVAR(playerManagement_selected) = GVAR(playerManagement_players) - GVAR(playerManagement_selected);
    }];
    
    // Register client as server FPS receiver
    [true] remoteExec [QFUNC(fpsHandlerServer), 2];
    
    // Show dashboard when opening the admin menu, hide other tabs
    [_display] call FUNC(selectTab);