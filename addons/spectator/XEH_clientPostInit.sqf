#include "script_component.hpp"

log("Client Postinit started");

["CBA_settingsinitialized", {
    [{
        if (player isKindOf QGVAR(unit)) exitwith {};
        
        // Check if JIP is allowed, if not then kill the JIP player.
        private _isAIunit = player getVariable [QGVAR(isJIPable), false];
        private _isJIPAllowed = switch (GVAR(isJIPAllowed)) do {
            case 0: {
                false
            };
            case 1: {
                true
            };
            case 2: {
                [] call EFUNC(safestart, isActive)
            };
        };
        private _templateActive = (
        "TFS_Spectator" in getMissionConfigValue ["respawnTemplates", []] &&
        1 isEqualto getMissionConfigValue ["Respawn", -1]
        );
        
        TRACE_5("Check JIP conditions", _templateActive, _isJIPAllowed, _isAIunit, CBA_missiontime, didJIP);
        TRACE_1("Check JIP conditions 2", (_templateActive && !(_isJIPAllowed || _isAIunit) && CBA_missiontime > 5 && didJIP));
        
        if (_templateActive && !(_isJIPAllowed || _isAIunit) && CBA_missiontime > 5 && didJIP) then {
            log("JIP: true");
            
            [{
                !isNull player && {
                    !([] call BIS_fnc_isloading)
                }
            }, {
                log_1("JIP: killing %1", player);
                [player, objNull, true] spawn {
                    private _oldobject = _this # 0;
                    _this call FUNC(init);
                    systemChat "You joined the mission in progress. Entering spectator.";
                    [format ["player JIP to spectator: %1", profileName], true, "Spectator"] call EFUNC(adminmenu, log);
                    deletevehicle _oldobject;
                };
            }] call CBA_fnc_waitUntilandexecute;
        };
        
        // Add a small delay for things to synchronize
    }, [], 0.1] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;

// Hide ST HUD if spectator is OPEN
if (isClass (configFile >> "CfgPatches" >> "STUI_groupHUD")) then {
    [{
        !isnil "STUI_Canvas_shownHUD"
    }, {
        STUI_Canvas_shownHUD_old = STUI_Canvas_shownHUD;
        STUI_Canvas_shownHUD = {
            if !(call STUI_Canvas_shownHUD_old) exitwith {
                false
            };
            !(call FUNC(isOpen));
        };
    }, []] call CBA_fnc_waitUntilandexecute;
};