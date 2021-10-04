[
    QGVAR(enabled),
    "CHECKBOX",
    ["force reload on disembarking AI", "forces AI to play reload animation after disembarking from vehicle. Prevents instant shooting after disembark"],
    "TFS AI Disembark",
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(stayinImmobileChance),
    "SLIDER",
    ["Stay in immobile vehicle chance", "Chance that AI will be told to stay in immobilized vehicles, applied on vehicle init"],
    "TFS AI Disembark",
    [0, 1, 0, 0, true],
    1
] call CBA_fnc_addsetting;