[
    QGVAR(healUsage),
    "list",
    "#heal available",
    ["TFS Chat Commands"],
    [
        [0, 1, 3 ],
        ["Never", "During safestart", "Always"],
        0
    ], // default value
    1 // isGlobal
] call CBA_fnc_addsetting;

[
    QGVAR(rpUsage),
    "list",
    "#rp available",
    ["TFS Chat Commands"],
    [
        [0, 1, 3 ],
        ["Never", "During safestart", "Always"],
        0
    ], // default value
    1 // isGlobal
] call CBA_fnc_addsetting;

[
    QGVAR(tpUsage),
    "list",
    "#tp available",
    ["TFS Chat Commands"],
    [
        [0, 1, 2, 3 ],
        ["Never", "During safestart", "During safestart & after respawn", "Always"],
        0
    ], // default value
    1 // isGlobal
] call CBA_fnc_addsetting;

[
    QGVAR(whisperUsage),
    "list",
    "#whisper available",
    ["TFS Chat Commands"],
    [
        [0, 3 ],
        ["Never", "Always"],
        0
    ], // default value
    1 // isGlobal
] call CBA_fnc_addsetting;

[
    QGVAR(specUsage),
    "list",
    "#spec available",
    ["TFS Chat Commands"],
    [
        [0, 1, 2, 3 ],
        ["Never", "During safestart", "During safestart & after respawn", "Always"],
        0
    ], // default value
    1 // isGlobal
] call CBA_fnc_addsetting;

if (isClass (configFile >> "CfgPatches" >> QUOTE(doUBLES(PREFIX, assignGear)))) then {
    [
        QGVAR(loadoutUsage),
        "list",
        "#loadout available",
        ["TFS Chat Commands"],
        [
            [0, 1, 2, 3 ],
            ["Never", "During safestart", "During safestart & after respawn", "Always"],
            0
        ], // default value
        1 // isGlobal
    ] call CBA_fnc_addsetting;
};

/* if (isClass (configFile >> "CfgPatches" >> QUOTE(doUBLES(PREFIX, acre2)))) then {
    [
        QGVAR(radioUsage),
        "list",
        "#radio available",
        ["TFS Chat Commands"],
        [
            [0, 1, 2, 3 ],
            ["Never", "During safestart", "During safestart & after respawn", "Always"],
            0
        ], // default value
        1 // isGlobal
    ] call CBA_fnc_addsetting;
};
*/