if (isClass (configFile >> "CfgPatches" >> "ace_safemode")) then {
    [
        QGVAR(weaponsafety),
        "CHECKBOX",
        "Enable ACE Weapon Safety on mission start",
        ["TFS Common"],
        true,
        0,
        {},
        true
    ] call CBA_fnc_addsetting;
};