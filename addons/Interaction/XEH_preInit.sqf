// Creator actions
[
    "TFS_Creatoractions_Master",
    "CHECKBOX",
    ["Enable Creator actions", "Show/Hide Creator actions in ACE Self interaction Menu"],
    "TFS Creator actions",
    true,
    true,
    {
        if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_initCreatoractions
        };
    }
] call CBA_settings_fnc_init;

[
    "TFS_Creatoractions_Channels",
    "CHECKBOX",
    ["Enable Channel actions", "Add Creator actions to enable/disable channels"],
    "TFS Creator actions",
    true,
    true,
    {
        if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_initChannelactions
        };
    }
] call CBA_settings_fnc_init;

/*
[
    "TFS_Creatoractions_MarkerSaving",
    "CHECKBOX",
    ["Enable SaveMarkers", "Add Creator actions to save/load markers"],
    "TFS Creator actions",
    true,
    true,
    {
        if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};
        if (_this && {
            hasinterface
        }) then {
            [
                "SaveMarkers",
                "Save/load Markers",
                "",
                {
                    [] call TFS_MI_fnc_opendialog;
                },
                {
                    TFS_Main_Mapicons
                }
            ] call TFS_fnc_addCreatoraction;
        };
    }
] call CBA_settings_fnc_init;
*/ // broken as fuck, crashes the game...

[
    "TFS_Creatoractions_endMission",
    "CHECKBOX",
    ["Enable endMission", "Add Creator actions to end the mission and return players to the lobby"],
    "TFS Creator actions",
    true,
    true,
    {
        if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};
        if (_this && {
            hasinterface
        }) then {
            [
                "endMissionSuccess",
                "<t color='#00ff00'>Mission Success</t>",
                "",
                {
                    ["EveryoneWins"] remoteExec ["BIS_fnc_endMissionServer", 2]
                },
                {
                    true
                }
            ] call TFS_fnc_addCreatoraction;
            
            [
                "endMissionFail",
                "<t color='#ff0000'>Mission Failure</t>",
                "",
                {
                    ["EveryoneLost"] remoteExec ["BIS_fnc_endMissionServer", 2]
                },
                {
                    true
                }
            ] call TFS_fnc_addCreatoraction;
        };
    }
] call CBA_settings_fnc_init;