// AISpawns Modules

[
    "TFS_Zeus_Module_AISpawnsEast",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - East", "Enable the Spawn AI - East Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "AI Spawn - East", {_this call TFS_fnc_moduleAISpawnsEastZeus}, "\z\tfs\addons\media\images\icons\AI EAST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "TFS_Zeus_Module_AISpawnsIndep",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Independent", "Enable the Spawn AI - Independent Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "AI Spawn - Independent", {_this call TFS_fnc_moduleAISpawnsIndepZeus}, "\z\tfs\addons\media\images\icons\AI INDEP.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

[
    "TFS_Zeus_Module_AISpawnsWest",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - West", "Enable the Spawn AI - West Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "AI Spawn - West", {_this call TFS_fnc_moduleAISpawnsWestZeus}, "\z\tfs\addons\media\images\icons\AI WEST.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// CivilianSpawns Module
[
    "TFS_Zeus_Module_CivilianSpawns",
    "CHECKBOX",
    ["Zeus Module - AI Spawn - Civilian", "Enable the Spawn AI Civilians Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "AI Spawn - Civilian", {_this call TFS_fnc_moduleCivilianSpawnsZeus}, "\z\tfs\addons\media\images\Icons\AI CIV.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// SafeZone Module
[
    "TFS_Zeus_Module_SafeZone",
    "CHECKBOX",
    ["Zeus Module - Safe Zone", "Enable the Safe Zone Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "Safe Zone", {_this call TFS_fnc_moduleSafeZoneZeus}, "\z\tfs\addons\media\images\Icons\Safe_Zone.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;

// MedicalDummy Module
[
    "TFS_Zeus_Module_MedicalDummy",
    "CHECKBOX",
    ["Zeus Module - Medical Dummy", "Enable the Medical Dummy Zeus module for use with ZEN"],
    "TFS Zeus",
    false,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitWith {};

        ["TFS Fundamentals", "Medical Dummy", {_this call TFS_fnc_moduleCasualty}, "z\tfs\addons\Media\images\icons\Medical Area.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_Settings_fnc_init;