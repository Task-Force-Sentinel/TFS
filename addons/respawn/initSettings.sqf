[
    QGVAR(enabled),
    "CHECKBOX",
    [LstrinG(Enabled), LstrinG(Enabled_Description)],
    LstrinG(Displayname),
    false,
    1,
    {
        [_this] call FUNC(toggle)
    }
] call CBA_fnc_addsetting;

[
    QGVAR(time),
    "SLIDER",
    [LstrinG(time), LstrinG(time_Description)],
    LstrinG(Displayname),
    [1, 900, getNumber (configFile >> "CfgRespawnTemplates" >> QGVAR(default) >> "respawnDelay"), 0],
    1,
    {
        [_this] call FUNC(adjusttime)
    }
] call CBA_fnc_addsetting;