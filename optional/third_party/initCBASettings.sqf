[
    "cbrn_maxOxygenTime",
    "SLIDER",
    ["Oxygen Time", "Value in seconds of how long one oxygen container should last."],
    ["TFS Settings","CBRN Settings"],
    [600, 7200, 1800, 0],
    1
] call CBA_fnc_addSetting;

[
    "cbrn_maxWaterTime",
    "SLIDER",
    ["Oxygen Time", "Value in seconds of how long decon shower water should last."],
    ["TFS Settings","CBRN Settings"],
    [60, 7200, 120, 0],
    1
] call CBA_fnc_addSetting;
