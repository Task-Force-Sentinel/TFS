// Vehicle Crew List
[
    "TFS_Main_VehicleCrewList",
    "CHECKBOX",
    ["Vehicle Crew List", "Shows a list of players in a vehicle."],
    "TFS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call YAINA_F_fnc_crewNames};
    }
] call CBA_Settings_fnc_init;

// Dynamic Groups
[
    "TFS_Main_DynamicGroups",
    "CHECKBOX",
    ["BIS Dynamic Groups", "Enable Vanilla Dynamic Groups system (U Menu)"],
    "TFS Main",
    false,
    true,
    {
        if (_this) then { call TFS_fnc_DynamicGroups};
    }
] call CBA_Settings_fnc_init;

// YAINA Earplugs
[
    "TFS_Main_Earplugs",
    "CHECKBOX",
    ["YAINA Earplugs", "Enable YAINA Earplugs addactions. Cannot be used with @ACE."],
    "TFS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFS_fnc_Earplugs};
    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "TFS_Main_PilotCheck",
    "CHECKBOX",
    ["Pilot Restrictions", "Restrict aircraft so only those with 'Pilot' Trait can fly."],
    "TFS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFS_fnc_PilotCheck};
    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "TFS_Main_MaydayAccess",
    "LIST",
    ["Aircraft Emergency Access", "Restrict access to the emergency pilot takeover for helicopters (requires Pilot Check Enabled)"],
    "TFS Main",
    [[0,1,2],["No One", "909 Only", "Everyone"], 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Voyager Compass
[
    "TFS_Main_VoyagerCompass",
    "CHECKBOX",
    ["Voyager Compass HUD", "Enable Voyager Compass HUD. Players can still disable locally."],
    "TFS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFS_fnc_VoyagerCompass};
    }
] call CBA_Settings_fnc_init;

// QS Mag Repack
[
    "TFS_Main_QSMagRepack",
    "CHECKBOX",
    ["QS Repack Magazines", "Allows players to repack magazines through an add action. Not used with ACE."],
    "TFS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFS_fnc_QSRepackMags};        
    }
] call CBA_Settings_fnc_init;

// CH View Distance
[
    "TFS_Main_CHViewDistance",
    "CHECKBOX",
    ["CH View Distance", "Enable CHVD within TFS Fundamentals"],
    "TFS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call CHVD_fnc_init};
    }
] call CBA_Settings_fnc_init;

// CHVD - Max View Distance
[
    "TFS_Main_ViewDistanceMaxDistance",
    "SLIDER",
    ["CHVD - Max View Distance", "Max distance a player can set CHVD View Distance to."],
    "TFS Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Max Object View Distance
[
    "TFS_Main_ViewDistanceMaxObjectDistance",
    "SLIDER",
    ["CHVD - Max Object View Distance", "Max distance a player can set CHVD Object View Distance to."],
    "TFS Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Allow No Grass
[
    "TFS_Main_ViewDistanceNoGrass",
    "CHECKBOX",
    ["CHVD - Allow No Grass", "Should players be allowed to turn grass off?"],
    "TFS Main",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Arsenal - Save/Load
[
    "TFS_Main_ArsenalSaveLoad",
    "CHECKBOX",
    ["Arsenal - Save/Load", "Should a player be allowed to Save/Load Loadouts in the Arsenal?"],
    "TFS Main",
    true,
    true,
    {
        if (!_this && { hasinterface }) then  { call TFS_fnc_ArsenalLoadSave};
    }
] call CBA_Settings_fnc_init;

// Flip Vehicle
[
    "TFS_Main_FlipVehicle",
    "CHECKBOX",
    ["Flip Vehicle", "Add an action to players to allow them to flip land vehicles."],
    "TFS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call TFS_fnc_FlipVehicle};
    }
] call CBA_Settings_fnc_init;

// TFAR - Range Multiplyer
[
    "TFS_Main_TFARTransmitRange",
    "SLIDER",
    ["TFAR - Range Multiplyer", "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis"],
    "TFS Main",
    [0, 10, 2.5, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// TFAR - Terrain Interference
[
    "TFS_Main_TFARTerrainInterference",
    "SLIDER",
    ["TFAR - Terrain Interference", "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact."],
    "TFS Main",
    [0, 5, 1, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Cue Cards
[
    "TFS_Main_CueCards",
    "CHECKBOX",
    ["Cue Cards", "Show/Hide Cue Cards in ACE Self Interaction Menu."],
    "TFS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFS_fnc_AddCueCards};
    }
] call CBA_Settings_fnc_init;

// Diary Defaults
[
    "TFS_Main_Diary",
    "CHECKBOX",
    ["Diary Defaults", "Show/Hide Default TFS Diary Entries."],
    "TFS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFS_fnc_Diary};
    }
] call CBA_Settings_fnc_init;

// MapIcons
[
    "TFS_Main_MapIcons",
    "CHECKBOX",
    ["Enable Save/Load Markers", "Enable the MapIcons system to save/load markers"],
    "TFS Main",
    true,
    true,
    {
  ["tfs-saveMarkers",{
            [] call TFS_MI_fnc_openDialog;
        },"all"] call CBA_fnc_registerChatCommand;

        [] call TFS_MI_fnc_loadNotification;
    }
] call CBA_Settings_fnc_init;

// Fatigue (Vanilla ONLY)
[
    "TFS_Main_FatigueVanilla",
    "CHECKBOX",
    ["Fatigue (Vanilla ONLY)", "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE."],
    "TFS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFS_fnc_VanillaFatigue};
    }
] call CBA_Settings_fnc_init;

// FPS Counter
[
    "TFS_Main_FPSCounter",
    "CHECKBOX",
    ["FPS Counter", "Show FPS counter of Player, Server & Headless Client on the map."],
    "TFS Main",
    false,
    true,
    {
        if (_this) then { call YAINA_F_fnc_showFPS};
    }
] call CBA_Settings_fnc_init;

// TFS Logging
[
    "TFS_Main_Logging",
    "CHECKBOX",
    ["TFS Logging", "Log connected players, their roles and if they go unconcious with ACE. Requires @A3Log"],
    "TFS Main",
    false,
    true,
    {
        if (_this) then { call TFS_fnc_Logs};
    }
] call CBA_Settings_fnc_init;

// TFS_Main_DynamicSim
[
    "TFS_Main_DynamicSim",
    "CHECKBOX",
    ["TFS Dynamic Sim", "Simple check for Dynamic Sim enabled. If not enabled it will enable it to default TFS Values. "],
    "TFS Main",
    false,
    true,
    {
        if (_this && { isserver }) then  { call TFS_fnc_DynamicSim};
    }
] call CBA_Settings_fnc_init;

// TFS_Main_DynamicSim
[
    "TFS_Main_LockCamVehicle",
    "CHECKBOX",
    ["TFS Lock Camera in Vehicle", "Locks the camera to first-person inside vehicles. If not enabled it will enable it to default TFS Values. "],
    "TFS Main",
    false,
    true,
    {
        if (_this && {hasInterface}) then  { call TFS_fnc_LockCamVehicle};
    }
] call CBA_Settings_fnc_init;