// vehicle crew list
[
    "TFS_Main_vehiclecrewlist",
    "CHECKBOX",
    ["vehicle crew list", "Shows a list of players in a vehicle."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call YAinA_F_fnc_crewnames
        };
    }
] call CBA_settings_fnc_init;

// Dynamic groups
[
    "TFS_Main_Dynamicgroups",
    "CHECKBOX",
    ["BIS Dynamic groups", "Enable Vanilla Dynamic groups system (U Menu)"],
    "TFS Main",
    false,
    true,
    {
        if (_this) then {
            call TFS_fnc_Dynamicgroups
        };
    }
] call CBA_settings_fnc_init;

// YAinA Earplugs
[
    "TFS_Main_Earplugs",
    "CHECKBOX",
    ["YAinA Earplugs", "Enable YAinA Earplugs addActions. Cannot be used with @ACE."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_Earplugs
        };
    }
] call CBA_settings_fnc_init;

// pilotCheck
[
    "TFS_Main_pilotCheck",
    "CHECKBOX",
    ["pilot Restrictions", "Restrict aircraft so only those with 'pilot' Trait can fly."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_pilotCheck
        };
    }
] call CBA_settings_fnc_init;

// pilotCheck
[
    "TFS_Main_MaydayAccess",
    "list",
    ["Aircraft Emergency Access", "Restrict access to the emergency pilot takeover for helicopters (requires pilot Check Enabled)"],
    "TFS Main",
    [[0, 1, 2], ["No One", "909 Only", "Everyone"], 2],
    true,
    {}
] call CBA_settings_fnc_init;

// Voyager Compass
[
    "TFS_Main_VoyagerCompass",
    "CHECKBOX",
    ["Voyager Compass HUD", "Enable Voyager Compass HUD. players can still disable locally."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_VoyagerCompass
        };
    }
] call CBA_settings_fnc_init;

// QS Mag Repack
[
    "TFS_Main_QSMagRepack",
    "CHECKBOX",
    ["QS Repack magazines", "Allows players to repack magazines through an add action. not used with ACE."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_QSRepackMags
        };
    }
] call CBA_settings_fnc_init;

// CH View distance
[
    "TFS_Main_CHviewDistance",
    "CHECKBOX",
    ["CH View distance", "Enable CHVD within TFS Fundamentals"],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call CHVD_fnc_init
        };
    }
] call CBA_settings_fnc_init;

// CHVD - max View distance
[
    "TFS_Main_viewDistancemaxdistance",
    "SLIDER",
    ["CHVD - max View distance", "max distance a player can set CHVD View distance to."],
    "TFS Main",
    [5000, 15000, 10000, 0],
    true,
    {}
] call CBA_settings_fnc_init;

// CHVD - max Object View distance
[
    "TFS_Main_viewDistancemaxObjectdistance",
    "SLIDER",
    ["CHVD - max Object View distance", "max distance a player can set CHVD Object View distance to."],
    "TFS Main",
    [5000, 15000, 10000, 0],
    true,
    {}
] call CBA_settings_fnc_init;

// CHVD - Allow No Grass
[
    "TFS_Main_viewDistanceNoGrass",
    "CHECKBOX",
    ["CHVD - Allow No Grass", "Should players be allowed to turn grass off?"],
    "TFS Main",
    false,
    true,
    {}
] call CBA_settings_fnc_init;

// Arsenal - Save/load
[
    "TFS_Main_ArsenalSaveload",
    "CHECKBOX",
    ["Arsenal - Save/load", "Should a player be allowed to Save/load loadouts in the Arsenal?"],
    "TFS Main",
    true,
    true,
    {
        if (!_this && {
            hasinterface
        }) then {
            call TFS_fnc_ArsenalloadSave
        };
    }
] call CBA_settings_fnc_init;

// Flip vehicle
[
    "TFS_Main_Flipvehicle",
    "CHECKBOX",
    ["Flip vehicle", "Add an action to players to allow them to flip land vehicles."],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_Flipvehicle
        };
    }
] call CBA_settings_fnc_init;

// TFAR - Range Multiplyer
[
    "TFS_Main_TFARTransmitRange",
    "SLIDER",
    ["TFAR - Range Multiplyer", "increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis"],
    "TFS Main",
    [0, 10, 2.5, 1],
    true,
    {}
] call CBA_settings_fnc_init;

// TFAR - Terrain interference
[
    "TFS_Main_TFARTerraininterference",
    "SLIDER",
    ["TFAR - Terrain interference", "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact."],
    "TFS Main",
    [0, 5, 1, 1],
    true,
    {}
] call CBA_settings_fnc_init;

// Cue Cards
[
    "TFS_Main_CueCards",
    "CHECKBOX",
    ["Cue Cards", "Show/Hide Cue Cards in ACE Self interaction Menu."],
    "TFS Main",
    true,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_AddCueCards
        };
    }
] call CBA_settings_fnc_init;

// Diary defaults
[
    "TFS_Main_Diary",
    "CHECKBOX",
    ["Diary defaults", "Show/Hide default TFS Diary Entries."],
    "TFS Main",
    true,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_Diary
        };
    }
] call CBA_settings_fnc_init;

// Mapicons
[
    "TFS_Main_Mapicons",
    "CHECKBOX",
    ["Enable Save/load Markers", "Enable the Mapicons system to save/load markers"],
    "TFS Main",
    true,
    true,
    {
        ["tfs-saveMarkers", {
            [] call TFS_MI_fnc_opendialog;
        }, "all"] call CBA_fnc_registerChatCommand;
        
        [] call TFS_MI_fnc_loadnotification;
    }
] call CBA_settings_fnc_init;

// Fatigue (Vanilla ONLY)
[
    "TFS_Main_FatigueVanilla",
    "CHECKBOX",
    ["Fatigue (Vanilla ONLY)", "Enable/Disable Vanilla Fatigue System. does not apply with @ACE."],
    "TFS Main",
    true,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_VanillaFatigue
        };
    }
] call CBA_settings_fnc_init;

// FPS counter
[
    "TFS_Main_FPScounter",
    "CHECKBOX",
    ["FPS counter", "Show FPS counter of player, Server & Headless Client on the map."],
    "TFS Main",
    false,
    true,
    {
        if (_this) then {
            call YAinA_F_fnc_showFPS
        };
    }
] call CBA_settings_fnc_init;

// TFS logging
[
    "TFS_Main_logging",
    "CHECKBOX",
    ["TFS logging", "log connected players, their roles and if they go unconcious with ACE. Requires @A3log"],
    "TFS Main",
    false,
    true,
    {
        if (_this) then {
            call TFS_fnc_logs
        };
    }
] call CBA_settings_fnc_init;

// TFS_Main_DynamicSim
[
    "TFS_Main_DynamicSim",
    "CHECKBOX",
    ["TFS Dynamic Sim", "Simple check for Dynamic Sim enabled. if not enabled it will enable it to default TFS Values. "],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            isServer
        }) then {
            call TFS_fnc_DynamicSim
        };
    }
] call CBA_settings_fnc_init;

// TFS_Main_DynamicSim
[
    "TFS_Main_lockCamvehicle",
    "CHECKBOX",
    ["TFS lock Camera in vehicle", "locks the camera to first-person inside vehicles. if not enabled it will enable it to default TFS Values. "],
    "TFS Main",
    false,
    true,
    {
        if (_this && {
            hasinterface
        }) then {
            call TFS_fnc_lockCamvehicle
        };
    }
] call CBA_settings_fnc_init;