[
    QGVAR(enabled),
    "CHECKBOX",
    [LstrinG(forced), LstrinG(forced_Description)],
    LstrinG(Displayname),
    false,
    1,
    {
        [_this] call FUNC(toggle)
    }
] call CBA_fnc_addsetting;