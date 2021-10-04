#include "\z\tfs\addons\adminmenu\script_component.hpp"

private _oldUnit = player;
private _oldUnitdata = _oldUnit getVariable [QEGVAR(spectator, unitData), false];

if (_oldUnitdata isEqualtype []) then {
    _oldUnitdata params ["_group", "_faction", "_role", "_side", "_pos", "_objectParent"];
    
    private _unittype = switch (_side) do {
        case blufor: {
            "B_Soldier_F"
        };
        case opfor: {
            "O_Soldier_F"
        };
        case independent: {
            "I_soldier_F"
        };
        default {
            "C_man_1"
        };
    };
    private _newUnit = _group createUnit [_unittype, _pos, [], 0, "NONE"];
    _newUnit setVariable [QGVARMAin(isRespawnUnit), true];
    
    if (!isNull _objectParent && {
        alive _objectParent
    }) then {
        _newUnit moveInAny _objectParent;
    };
    
    if !(_faction isEqualto "" || _role isEqualto "") then {
        [_newUnit, _faction, _role] call EFUNC(assignGear, assignGear);
    };
    
    setPlayable _newUnit;
    selectPlayer _newUnit;
    deletevehicle _oldUnit;
    
    // Re-enable other text/marker channels
    private _radioChannelindexSpectator = missionnamespace getVariable [QEGVAR(spectator, radioChannel), -1];
    if (_radioChannelindexSpectator != -1) then {
        _radioChannelindexSpectator radioChannelRemove [player];
        {
            _x enableChannel true;
        } forEach [1, 2, 3, 4, 5];
    };
    
    [{
        // Close spectator
        while {dialog} do {
            closedialog 0;
        };
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    }, 0, 0] call CBA_fnc_addPerFrameHandler;
    
    // ACRE setup
    // Put in PFH to avoid blocking
    /*
    if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
        [false] call acre_api_fnc_setSpectator;
        [{
            if (isNull player) exitwith {};
            if (isnil "TFS_acre2_networksCreated") exitwith {};
            // Ensure presets are created
            
            [] call EFUNC(acre2, clientinit);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        }, 0.1] call CBA_fnc_addPerFrameHandler;
    };
    */
    
    // Run Briefing Scripts.
    [{
        // Run briefing script for our new unit.
        [player] call EFUNC(briefing, generateBriefing);
        // [player] call EFUNC(orbat, createBriefingPage);
    }, [], 4] call CBA_fnc_waitandexecute;
    
    // Reset orbat.
    // Re-initalize our group markers
    // [player, true] call EFUNC(orbat, setup);
    
    // Add all the respawned groups to the map markers as well.
    [] call FUNC(respawngroupMarkerUpdate);
} else {
    systemChat "[TFS admin Menu] Quick Respawn failed: old unit data unavailable";
};