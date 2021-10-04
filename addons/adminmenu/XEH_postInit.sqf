#include "\z\tfs\addons\adminmenu\script_component.hpp"

#include "initKeybinds.sqf"

GVAR(tabPFHHandles) = [];
GVAR(playerManagement_listControls) = [];
GVAR(playerManagement_players) = [];
GVAR(playerManagement_selected) = [];

if (isTFS) then {
    [
        {
            time > 5 && [] call FUNC(isAuthorized)
        },
        {
            _this call FUNC(resynclog);
            
            GVAR(endedEH) = addMissionEventHandler ["Ended", {
                params ["_endtype"];
                
                GVAR(logEntries) pushBack [CBA_missiontime, format ["Mission Ended, endtype: %1", _endtype], false];
                
                if GVAR(endlogtorPT) then {
                    [] call FUNC(printlogtorPT);
                };
                
                // Print to debriefing
                private _strArr = GVAR(logEntries) apply {
                    _x params [
                        ["_time", CBA_missiontime, [-1]],
                        ["_text", "", [""]],
                        ["_isWarning", false, [false]]
                    ];
                    
                    private _text = format ["[%1]: %2", [_time, "MM:SS"] call BIS_fnc_secondstoString, _text];
                    private _warning = if (_isWarning) then [{
                        "[WARNinG] "
                    }, {
                        ""
                    }];
                    (_warning + _text)
                };
                GVAR(debrief) = _strArr joinstring "<br/>";
            }];
        },
        clientowner,
        30, // timeout after 30 seconds
        {}
    ] call CBA_fnc_waitUntilandexecute;
};

if (isMultiplayer && hasinterface) then {
    QGVAR(fps) addpublicVariableEventHandler {
        disableSerialization;
        
        private _ctrl = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_TFS_adminMENU_FPS;
        if (isNull _ctrl) exitwith {};
        
        _ctrl ctrlsettext format ["%1 SFPS", _this select 1];
    };
    QGVAR(headlessinfo) addpublicVariableEventHandler {
        disableSerialization;
        
        private _ctrl = ((uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_TFS_adminMENU_G_DASH) controlsgroupCtrl IDC_TFS_adminMENU_DASH_HEADLESS;
        if (isNull _ctrl) exitwith {};
        
        _ctrl ctrlsettext (_this select 1);
        _ctrl ctrlsettooltip (_this select 1);
    };
    
    QGVAR(currentadmin) addpublicVariableEventHandler {
        disableSerialization;
        
        private _ctrl = ((uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_TFS_adminMENU_G_DASH) controlsgroupCtrl IDC_TFS_adminMENU_DASH_CURradmin;
        if (isNull _ctrl) exitwith {};
        
        _ctrl ctrlsettext (_this select 1);
    };
    
    [QGVAR(quickRespawn), {
        call FUNC(utility_quickRespawn_local);
    }] call CBA_fnc_addEventHandler;
};