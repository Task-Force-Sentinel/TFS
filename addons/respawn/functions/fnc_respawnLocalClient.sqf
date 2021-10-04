params["_groupNum", "_position", "_faction", "_typeOfUnit", "_rank", "_number", "_leader", "_halo", "_side", ["_groupname", ""]];

#include "\z\tfs\addons\respawn\script_component.hpp"

// todo - Make respawned units count towards all players dead ending <- prevent vanilla ending from happening in MP.

private _class = switch (_side) do {
    case 0: {
        "O_Soldier_F"
    };
    case 1: {
        "B_Soldier_F"
    };
    case 2: {
        "I_Soldier_A_F"
    };
    default {
        "C_man_1"
    };
};
private _rankname = switch (_rank) do {
    case 0: {
        "private"
    };
    case 1: {
        "CorPorAL"
    };
    case 2: {
        "SERGEANT"
    };
    case 3: {
        "LIEUTENANT"
    };
    case 4: {
        "CAPTAin"
    };
    case 5: {
        "MAJor"
    };
    case 6: {
        "COLONEL"
    };
    default {
        "private"
    };
};

if (_halo) then {
    _position = _position vectorAdd [0, 0, 500];
    // ["HALO"] call BIS_fnc_startLoadingScreen;
};

// Dummy group is required to
private _dummygroup = creategroup (_side call EFUNC(common, numtoside));
if (_leader && _groupname != "inSERT_group_name") then {
    _dummygroup setgroupIdGlobal [_groupname];
};

tfs_localRespawnedUnit = objNull;
// Create the unit
private _unitname = format["respawnedUnit%1", _number];

private _init = format["if (local this) then {
    [this, '%2', '%3'] call tfs_assignGear_fnc_assignGear;
    tfs_localRespawnedUnit = this;
};
this setName '%4'; this setVariable ['tfs_isRespawnUnit', true]; %1 = this; ", _unitname, _faction, _typeOfUnit, profileName];
private _oldUnit = player;

_class createUnit [_position, _dummygroup, _init, 0.5, _rankname];

// Wait till the unit is created
waitUntil{
    !isNull tfs_localRespawnedUnit
};

private _respawnedUnit = missionnamespace getVariable [_unitname, objNull];

// Close spectator/open dialogs.
while {dialog} do {
    closedialog 0;
};

private _radioChannelindexSpectator = missionnamespace getVariable [QEGVAR(spectator, radioChannel), -1];
if (_radioChannelindexSpectator != -1) then {
    _radioChannelindexSpectator radioChannelRemove [player];
    {
        _x enableChannel true;
    } forEach [1, 2, 3, 4, 5];
};

// addswitchableUnit localRespawnedUnit;
This will create awkard mission ends.
setPlayable tfs_localRespawnedUnit;
// Allow unit to referenced later with player functions (name/getplayerUID) (Verify this works)
selectPlayer tfs_localRespawnedUnit;
// localRespawnedUnit setName _name;

deletevehicle _oldUnit;
// Delete the old spectator module
player setPos (_position);

if (_halo) then {
    [_position] spawn {
        params ["_position"];
        hint "HALO inSERTATION";
        player setPos _position;
        
        // ["HALO"] call BIS_fnc_endloadingScreen;
        private _jumper = player;
        
        while {(getPos _jumper select 2) > 2} do {
            if (getPos _jumper select 2 < 150) exitwith {
                private _chute = createvehicle ["Steerable_Parachute_F", position _jumper, [], direction _jumper, 'FLY'];
                _chute setPos (getPos _jumper);
                _jumper assignAsdriver _chute;
                _jumper moveInDriver _chute;
            };
        };
    };
};

// Put in PFH to avoid blocking
/* if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
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

_groupVarname = format ["GrpRespawn_%1", _groupNum];
if (_leader) then {
    // Broadcast group var to everyone so people can join.
    missionnamespace setVariable[_groupVarname, _dummygroup];
    publicVariable _groupVarname;
    [{
        // Run briefing script for our new unit.
        [player] call EFUNC(briefing, generateBriefing);
        [player] call EFUNC(orbat, createBriefingPage);
    }, [], 4] call CBA_fnc_waitandexecute
} else {
    // Wait for group be created by the group leader before joining it.
    [_groupVarname, _dummygroup] spawn {
        params["_groupVarname", "_dummygroup"];
        // Wait for group exist.
        sleep 1;
        // Ensure that everything is in Sync.
        waitUntil{
            !isnil _groupVarname
        };
        [player] joinSilent (missionnamespace getVariable[_groupVarname, grpNull]);
        deletegroup _dummygroup;
        [{
            // Run briefing script for our new unit.
            [player] call EFUNC(briefing, generateBriefing);
            [player] call EFUNC(orbat, createBriefingPage);
        }, [], 3] call CBA_fnc_waitandexecute
    };
};

// Re-initalize our group markers
[player, true] call EFUNC(orbat, setup);

// Add all the respawned groups to the map markers as well.
[] call FUNC(respawngroupMarkerUpdate);