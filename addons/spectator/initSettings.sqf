[
    QGVAR(isJIPAllowed),
    "list",
    ["JIP allowed", "if disallowed JIP players are placed in spectator. Only affects TFS spectator."],
    ["TFS", "Spectator"],
    [[0, 1, 2], ["Disallow", "Allow", "During Safestart"], 2],
    1
] call CBA_fnc_addsetting;
[
    QGVAR(showgroupMarkers),
    "list",
    ["Show 3D group markers", ""],
    ["TFS", "Spectator"],
    [[0, 1], ["groups with players only", "All"], 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(followCameraEnabled),
    "CHECKBOX",
    ["Follow camera mode enabled", "Allow the usage of the orbiting camera mode"],
    ["TFS", "Spectator"],
    true,
    1
] call CBA_fnc_addsetting;
[
    QGVAR(freeCameraEnabled),
    "CHECKBOX",
    ["Free camera mode enabled", "Allow the usage of the free camera mode"],
    ["TFS", "Spectator"],
    true,
    1
] call CBA_fnc_addsetting;
[
    QGVAR(firstPersonCameraEnabled),
    "CHECKBOX",
    ["Firstperson camera mode enabled", "Allow the usage of the firstperson camera mode"],
    ["TFS", "Spectator"],
    true,
    1
] call CBA_fnc_addsetting;
[
    QGVAR(canSpectateAllsides),
    "CHECKBOX",
    ["Spectate all sides", "Disable to only allow the player to spectate their own side"],
    ["TFS", "Spectator"],
    true,
    1
] call CBA_fnc_addsetting;