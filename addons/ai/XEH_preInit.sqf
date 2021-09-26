#include "script_component.hpp"

#include "XEH_PREP.sqf"


// Reporting AI
[
    "TFS_AI_Reporting",
    "CHECKBOX",
    ["Spawn Reporting", "Receive a systemchat message for any groups or vehicles that fail to spawn."],
    "TFS AI",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Initial AI
[
    "TFS_AI_InitialAI",
    "CHECKBOX",
    ["Include Initial AI", "This will automatically apply to AI Spawns and Zeus placed AI. If enabled it will also apply to any Editor placed AI at mission start."],
    "TFS AI",
    true,
    true,
    {
        if (_this && { isserver }) then  { call TFS_fnc_SetInitialAI};
    }
] call CBA_Settings_fnc_init;

// AI Aiming Accuracy
[
    "TFS_AI_AimingAccuracy",
    "SLIDER",
    ["Min Aiming Accuracy", "Higher value means the AI will be more likely to hit the target."],
    "TFS AI",
    [0, 1, 0.10, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Shake
[
    "TFS_AI_AimingShake",
    "SLIDER",
    ["Min Aiming Shake", "Higher value means the AI will be more precise."],
    "TFS AI",
    [0, 1, 0.45, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Speed
[
    "TFS_AI_AimingSpeed",
    "SLIDER",
    ["Min Aiming Speed", "Higher value means the AI can rotate and stabilize its aim faster."],
    "TFS AI",
    [0, 1, 0.30, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Commanding
[
    "TFS_AI_Commanding",
    "SLIDER",
    ["Commanding", "Higher value means the AI can report targets faster."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Courage
[
    "TFS_AI_Courage",
    "SLIDER",
    ["Courage", "Higher value means the AI can report targets faster."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI General
[
    "TFS_AI_General",
    "SLIDER",
    ["General", "Higher value improves the AI's decision making."],
    "TFS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Reload Speed
[
    "TFS_AI_ReloadSpeed",
    "SLIDER",
    ["Min Reload Speed", "Higher value means the AI can switch or reload weapons faster."],
    "TFS AI",
    [0, 1, 0.50, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Distance
[
    "TFS_AI_SpotDistance",
    "SLIDER",
    ["Min Spot Distance", "Higher value means the AI is better at spotting targets."],
    "TFS AI",
    [0, 1, 0.40, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Time
[
    "TFS_AI_SpotTime",
    "SLIDER",
    ["Min Spot Time", "Higher value means the AI will react faster to death, damage or enemies."],
    "TFS AI",
    [0, 1, 0.20, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;
