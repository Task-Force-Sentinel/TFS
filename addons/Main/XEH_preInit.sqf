// Vehicle Crew List
[
    "TFSRHS_Main_VehicleCrewList",
    "CHECKBOX",
    ["Vehicle Crew List", "Shows a list of players in a vehicle."],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call YAINA_F_fnc_crewNames};
    }
] call CBA_Settings_fnc_init;

// Dynamic Groups
[
    "TFSRHS_Main_DynamicGroups",
    "CHECKBOX",
    ["BIS Dynamic Groups", "Enable Vanilla Dynamic Groups system (U Menu)"],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this) then { call TFSRHS_fnc_DynamicGroups};
    }
] call CBA_Settings_fnc_init;

// YAINA Earplugs
[
    "TFSRHS_Main_Earplugs",
    "CHECKBOX",
    ["YAINA Earplugs", "Enable YAINA Earplugs addactions. Cannot be used with @ACE."],
    "TFSRHS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFSRHS_fnc_Earplugs};
    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "TFSRHS_Main_PilotCheck",
    "CHECKBOX",
    ["Pilot Restrictions", "Restrict aircraft so only those with 'Pilot' Trait can fly."],
    "TFSRHS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFSRHS_fnc_PilotCheck};
    }
] call CBA_Settings_fnc_init;

// PilotCheck
[
    "TFSRHS_Main_MaydayAccess",
    "LIST",
    ["Aircraft Emergency Access", "Restrict access to the emergency pilot takeover for helicopters (requires Pilot Check Enabled)"],
    "TFSRHS Main",
    [[0,1,2],["No One", "909 Only", "Everyone"], 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Voyager Compass
[
    "TFSRHS_Main_VoyagerCompass",
    "CHECKBOX",
    ["Voyager Compass HUD", "Enable Voyager Compass HUD. Players can still disable locally."],
    "TFSRHS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFSRHS_fnc_VoyagerCompass};
    }
] call CBA_Settings_fnc_init;

// QS Mag Repack
[
    "TFSRHS_Main_QSMagRepack",
    "CHECKBOX",
    ["QS Repack Magazines", "Allows players to repack magazines through an add action. Not used with ACE."],
    "TFSRHS Main",
    false,
    true,
    {
         if (_this && { hasinterface }) then  { call TFSRHS_fnc_QSRepackMags};        
    }
] call CBA_Settings_fnc_init;

// CH View Distance
[
    "TFSRHS_Main_CHViewDistance",
    "CHECKBOX",
    ["CH View Distance", "Enable CHVD within TFSRHS Fundamentals"],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call CHVD_fnc_init};
    }
] call CBA_Settings_fnc_init;

// CHVD - Max View Distance
[
    "TFSRHS_Main_ViewDistanceMaxDistance",
    "SLIDER",
    ["CHVD - Max View Distance", "Max distance a player can set CHVD View Distance to."],
    "TFSRHS Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Max Object View Distance
[
    "TFSRHS_Main_ViewDistanceMaxObjectDistance",
    "SLIDER",
    ["CHVD - Max Object View Distance", "Max distance a player can set CHVD Object View Distance to."],
    "TFSRHS Main",
    [5000, 15000, 10000, 0],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// CHVD - Allow No Grass
[
    "TFSRHS_Main_ViewDistanceNoGrass",
    "CHECKBOX",
    ["CHVD - Allow No Grass", "Should players be allowed to turn grass off?"],
    "TFSRHS Main",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Arsenal - Save/Load
[
    "TFSRHS_Main_ArsenalSaveLoad",
    "CHECKBOX",
    ["Arsenal - Save/Load", "Should a player be allowed to Save/Load Loadouts in the Arsenal?"],
    "TFSRHS Main",
    true,
    true,
    {
        if (!_this && { hasinterface }) then  { call TFSRHS_fnc_ArsenalLoadSave};
    }
] call CBA_Settings_fnc_init;

// Flip Vehicle
[
    "TFSRHS_Main_FlipVehicle",
    "CHECKBOX",
    ["Flip Vehicle", "Add an action to players to allow them to flip land vehicles."],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this && { hasinterface }) then  { call TFSRHS_fnc_FlipVehicle};
    }
] call CBA_Settings_fnc_init;

// TFAR - Range Multiplyer
[
    "TFSRHS_Main_TFARTransmitRange",
    "SLIDER",
    ["TFAR - Range Multiplyer", "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis"],
    "TFSRHS Main",
    [0, 10, 2.5, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// TFAR - Terrain Interference
[
    "TFSRHS_Main_TFARTerrainInterference",
    "SLIDER",
    ["TFAR - Terrain Interference", "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact."],
    "TFSRHS Main",
    [0, 5, 1, 1],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Cue Cards
[
    "TFSRHS_Main_CueCards",
    "CHECKBOX",
    ["Cue Cards", "Show/Hide Cue Cards in ACE Self Interaction Menu."],
    "TFSRHS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFSRHS_fnc_AddCueCards};
    }
] call CBA_Settings_fnc_init;

// Diary Defaults
[
    "TFSRHS_Main_Diary",
    "CHECKBOX",
    ["Diary Defaults", "Show/Hide Default TFSRHS Diary Entries."],
    "TFSRHS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFSRHS_fnc_Diary};
    }
] call CBA_Settings_fnc_init;

// MapIcons
[
    "TFSRHS_Main_MapIcons",
    "CHECKBOX",
    ["Enable Save/Load Markers", "Enable the MapIcons system to save/load markers"],
    "TFSRHS Main",
    true,
    true,
    {
		["tfsrhs-saveMarkers",{
            [] call TFSRHS_MI_fnc_openDialog;
        },"all"] call CBA_fnc_registerChatCommand;

        [] call TFSRHS_MI_fnc_loadNotification;
    }
] call CBA_Settings_fnc_init;

// Fatigue (Vanilla ONLY)
[
    "TFSRHS_Main_FatigueVanilla",
    "CHECKBOX",
    ["Fatigue (Vanilla ONLY)", "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE."],
    "TFSRHS Main",
    true,
    true,
    {
        if (_this && { hasinterface }) then  { call TFSRHS_fnc_VanillaFatigue};
    }
] call CBA_Settings_fnc_init;

// FPS Counter
[
    "TFSRHS_Main_FPSCounter",
    "CHECKBOX",
    ["FPS Counter", "Show FPS counter of Player, Server & Headless Client on the map."],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this) then { call YAINA_F_fnc_showFPS};
    }
] call CBA_Settings_fnc_init;

// TFSRHS Logging
[
    "TFSRHS_Main_Logging",
    "CHECKBOX",
    ["TFSRHS Logging", "Log connected players, their roles and if they go unconcious with ACE. Requires @A3Log"],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this) then { call TFSRHS_fnc_Logs};
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Main_DynamicSim
[
    "TFSRHS_Main_DynamicSim",
    "CHECKBOX",
    ["TFSRHS Dynamic Sim", "Simple check for Dynamic Sim enabled. If not enabled it will enable it to default TFSRHS Values. "],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this && { isserver }) then  { call TFSRHS_fnc_DynamicSim};
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Main_DynamicSim
[
    "TFSRHS_Main_LockCamVehicle",
    "CHECKBOX",
    ["TFSRHS Lock Camera in Vehicle", "Locks the camera to first-person inside vehicles. If not enabled it will enable it to default TFSRHS Values. "],
    "TFSRHS Main",
    false,
    true,
    {
        if (_this && {hasInterface}) then  { call TFSRHS_fnc_LockCamVehicle};
    }
] call CBA_Settings_fnc_init;