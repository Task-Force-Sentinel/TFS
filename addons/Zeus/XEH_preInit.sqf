#include "script_component.hpp"

#include "XEH_PREP.sqf"

// AISpawns Modules

[
    "TFSRHS_Zeus_Module_AISpawnsEast",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - East", "Enable the Spawn AI - East Zeus module for use with ZEN"],
    "TFSRHS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFSRHS Fundamentals", "AI Spawn - East", {_this call TFSRHS_fnc_moduleAISpawnsEastZeus}, "\z\tfsrhs\addons\media\images\icons\AI EAST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "TFSRHS_Zeus_Module_AISpawnsIndep",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Independent", "Enable the Spawn AI - Independent Zeus module for use with ZEN"],
    "TFSRHS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFSRHS Fundamentals", "AI Spawn - Independent", {_this call TFSRHS_fnc_moduleAISpawnsIndepZeus}, "\z\tfsrhs\addons\media\images\icons\AI INDEP.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "TFSRHS_Zeus_Module_AISpawnsWest",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - West", "Enable the Spawn AI - West Zeus module for use with ZEN"],
    "TFSRHS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFSRHS Fundamentals", "AI Spawn - West", {_this call TFSRHS_fnc_moduleAISpawnsWestZeus}, "\z\tfsrhs\addons\media\images\icons\AI WEST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// CivilianSpawns Module
[
    "TFSRHS_Zeus_Module_CivilianSpawns",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Civilian", "Enable the Spawn AI Civilians Zeus module for use with ZEN"],
    "TFSRHS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFSRHS Fundamentals", "AI Spawn - Civilian", {_this call TFSRHS_fnc_moduleCivilianSpawnsZeus}, "\z\tfsrhs\addons\media\images\Icons\AI CIV.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// SafeZone Module
[
    "TFSRHS_Zeus_Module_SafeZone",
    "CHECKBOX",
    ["Zeus Module - Safe Zone", "Enable the Safe Zone Zeus module for use with ZEN"],
    "TFSRHS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFSRHS Fundamentals", "Safe Zone", {_this call TFSRHS_fnc_moduleSafeZoneZeus}, "\z\tfsrhs\addons\media\images\Icons\Safe_Zone.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

