#include "\z\tfs\addons\spectator\script_component.hpp"

if (!isnil "ace_common_fnc_addCaninteractwithCondition") then {
    [QGVAR(spectatingCondition), {
        isNull (findDisplay IDC_SPECTAtor_TFS_SPECTAtor_dialog)
    }] call ace_common_fnc_addCaninteractwithCondition;
};

if (isServer) then {
    GVAR(radioChannel) = radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "Spectator Chat", "[SPECTAtor] %UNIT_name", []];
    publicVariable QGVAR(radioChannel);
    
    createCenter sideLogic;
    GVAR(group) = creategroup sideLogic;
    
    if (isNull GVAR(group)) then {
        createCenter civilian;
        GVAR(group) = creategroup civilian;
    };
    
    publicVariable QGVAR(group);
    
    // Clean up disconnected spectator units.
    private _spectator_disconnect_eh = addMissionEventHandler ["HandleDisconnect", {
        params ["_unit"];
        if (_unit isKindOf QGVAR(unit)) then {
            deletevehicle _unit;
        };
        false;
    }];
    
    [{
        {
            // Mark player as JIPable on mission start
            // This is kept if the player is DC'd and controlled by AI
            _x setVariable [QGVAR(isJIPable), true, true];
        } forEach playableunits;
    }, [], 0.01] call CBA_fnc_waitandexecute;
};