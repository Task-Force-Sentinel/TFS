[
    QGVAR(disabled),
    "CHECKBOX",
    "Disable backpack on Chest",
    ["TFS BoC", "Main"],
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(forceWalk),
    "CHECKBOX",
    "Enable force walk while backpack on Chest",
    ["TFS BoC", "Main"],
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(removeKilledplayerChestpack),
    "CHECKBOX",
    "Remove chestpack of dead players",
    ["TFS BoC", "Main"],
    true,
    1
] call CBA_fnc_addsetting;