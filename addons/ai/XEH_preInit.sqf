#include "script_component.hpp"

#include "XEH_PREP.sqf"

// Reporting AI
[
    "TFS_AI_Reporting",
    "CHECKBOX",
    ["spawn Reporting", "Receive a systemChat message for any groups or vehicles that fail to spawn."],
    "TFS AI",
    false,
    true,
    {}
] call CBA_settings_fnc_init;

// initial AI
[
    "TFS_AI_initialAI",
    "CHECKBOX",
    ["include initial AI", "This will automatically apply to AI spawns and Zeus placed AI. if enabled it will also apply to any Editor placed AI at mission start."],
    "TFS AI",
    true,
    true,
    {
        if (_this && {
            isServer
        }) then {
            call TFS_fnc_setinitialAI
        };
    }
] call CBA_settings_fnc_init;

// AI Aiming Accuracy
[
    "TFS_AI_AimingAccuracy",
    "SLIDER",
    ["min Aiming Accuracy", "Higher value means the AI will be more likely to hit the target."],
    "TFS AI",
    [0, 1, 0.10, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI Aiming Shake
[
    "TFS_AI_AimingShake",
    "SLIDER",
    ["min Aiming Shake", "Higher value means the AI will be more precise."],
    "TFS AI",
    [0, 1, 0.45, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI Aiming speed
[
    "TFS_AI_Aimingspeed",
    "SLIDER",
    ["min Aiming speed", "Higher value means the AI can rotate and stabilize its aim faster."],
    "TFS AI",
    [0, 1, 0.30, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI Commanding
[
    "TFS_AI_Commanding",
    "SLIDER",
    ["Commanding", "Higher value means the AI can report targets faster."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI Courage
[
    "TFS_AI_Courage",
    "SLIDER",
    ["Courage", "Higher value means the AI can report targets faster."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI General
[
    "TFS_AI_General",
    "SLIDER",
    ["General", "Higher value improves the AI's decision making."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI min reload speed
[
    "TFS_AI_reloadspeed",
    "SLIDER",
    ["min reload speed", "Higher value means the AI can switch or reload weapons faster."],
    "TFS AI",
    [0, 1, 0.50, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI min Spot distance
[
    "TFS_AI_Spotdistance",
    "SLIDER",
    ["min Spot distance", "Higher value means the AI is better at spotting targets."],
    "TFS AI",
    [0, 1, 0.40, 2],
    true,
    {}
] call CBA_settings_fnc_init;

// AI min Spot time
[
    "TFS_AI_Spottime",
    "SLIDER",
    ["min Spot time", "Higher value means the AI will react faster to death, damage or enemies."],
    "TFS AI",
    [0, 1, 0.20, 2],
    true,
    {}
] call CBA_settings_fnc_init;