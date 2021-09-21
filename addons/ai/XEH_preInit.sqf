#include "script_component.hpp"

#include "XEH_PREP.sqf"


// Reporting AI
[
    "TFSRHS_AI_Reporting",
    "CHECKBOX",
    ["Spawn Reporting", "Receive a systemchat message for any groups or vehicles that fail to spawn."],
    "TFSRHS AI",
    false,
    true,
    {

    }
] call CBA_Settings_fnc_init;

// Initial AI
[
    "TFSRHS_AI_InitialAI",
    "CHECKBOX",
    ["Include Initial AI", "This will automatically apply to AI Spawns and Zeus placed AI. If enabled it will also apply to any Editor placed AI at mission start."],
    "TFSRHS AI",
    true,
    true,
    {
        if (_this && { isserver }) then  { call TFSRHS_fnc_SetInitialAI};
    }
] call CBA_Settings_fnc_init;

// AI Aiming Accuracy
[
    "TFSRHS_AI_AimingAccuracy",
    "SLIDER",
    ["Min Aiming Accuracy", "Higher value means the AI will be more likely to hit the target."],
    "TFSRHS AI",
    [0, 1, 0.10, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Shake
[
    "TFSRHS_AI_AimingShake",
    "SLIDER",
    ["Min Aiming Shake", "Higher value means the AI will be more precise."],
    "TFSRHS AI",
    [0, 1, 0.45, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Aiming Speed
[
    "TFSRHS_AI_AimingSpeed",
    "SLIDER",
    ["Min Aiming Speed", "Higher value means the AI can rotate and stabilize its aim faster."],
    "TFSRHS AI",
    [0, 1, 0.30, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Commanding
[
    "TFSRHS_AI_Commanding",
    "SLIDER",
    ["Commanding", "Higher value means the AI can report targets faster."],
    "TFSRHS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Courage
[
    "TFSRHS_AI_Courage",
    "SLIDER",
    ["Courage", "Higher value means the AI can report targets faster."],
    "TFSRHS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI General
[
    "TFSRHS_AI_General",
    "SLIDER",
    ["General", "Higher value improves the AI's decision making."],
    "TFSRHS AI",
    [0, 1, 1.00, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Reload Speed
[
    "TFSRHS_AI_ReloadSpeed",
    "SLIDER",
    ["Min Reload Speed", "Higher value means the AI can switch or reload weapons faster."],
    "TFSRHS AI",
    [0, 1, 0.50, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Distance
[
    "TFSRHS_AI_SpotDistance",
    "SLIDER",
    ["Min Spot Distance", "Higher value means the AI is better at spotting targets."],
    "TFSRHS AI",
    [0, 1, 0.40, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;

// AI Min Spot Time
[
    "TFSRHS_AI_SpotTime",
    "SLIDER",
    ["Min Spot Time", "Higher value means the AI will react faster to death, damage or enemies."],
    "TFSRHS AI",
    [0, 1, 0.20, 2],
    true,
    {

    }
] call CBA_Settings_fnc_init;
