// AIspawns modules

[
    "TFS_Zeus_module_AIspawnseast",
    "CHECKBOX",
    ["Zeus module - AI spawn - east", "Enable the spawn AI - east Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "AI spawn - east", {
            _this call TFS_fnc_moduleAIspawnseastZeus
        }, "\z\tfs\addons\media\images\icons\AI east.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;

[
    "TFS_Zeus_module_AIspawnsindep",
    "CHECKBOX",
    ["Zeus module - AI spawn - independent", "Enable the spawn AI - independent Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "AI spawn - independent", {
            _this call TFS_fnc_moduleAIspawnsindepZeus
        }, "\z\tfs\addons\media\images\icons\AI inDEP.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;

[
    "TFS_Zeus_module_AIspawnswest",
    "CHECKBOX",
    ["Zeus module - AI spawn - west", "Enable the spawn AI - west Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "AI spawn - west", {
            _this call TFS_fnc_moduleAIspawnswestZeus
        }, "\z\tfs\addons\media\images\icons\AI west.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;

// civilianspawns module
[
    "TFS_Zeus_module_civilianspawns",
    "CHECKBOX",
    ["Zeus module - AI spawn - civilian", "Enable the spawn AI civilians Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "AI spawn - civilian", {
            _this call TFS_fnc_modulecivilianspawnsZeus
        }, "\z\tfs\addons\media\images\Icons\AI CIV.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;

// SafeZone module
[
    "TFS_Zeus_module_SafeZone",
    "CHECKBOX",
    ["Zeus module - Safe Zone", "Enable the Safe Zone Zeus module for use with ZEN"],
    "TFS Zeus",
    true,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "Safe Zone", {
            _this call TFS_fnc_moduleSafeZoneZeus
        }, "\z\tfs\addons\media\images\Icons\Safe_Zone.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;

// MedicalDummy module
[
    "TFS_Zeus_module_MedicalDummy",
    "CHECKBOX",
    ["Zeus module - Medical Dummy", "Enable the Medical Dummy Zeus module for use with ZEN"],
    "TFS Zeus",
    false,
    true,
    {
        params ["_value"];
        if ((!isClass (configFile >> "CfgPatches" >> "zen_main")) || (!_value)) exitwith {};
        
        ["TFS Fundamentals", "Medical Dummy", {
            _this call TFS_fnc_moduleCasualty
        }, "z\tfs\addons\Media\images\icons\Medical Area.paa"] call zen_custom_modules_fnc_register;
    }
] call CBA_settings_fnc_init;