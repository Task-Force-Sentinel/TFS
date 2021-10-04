if (EGVAR(common, aceTagging)) then {
    [
        QGVAR(enabled),
        "CHECKBOX",
        [LstrinG(Enabled), LstrinG(Enabled_Description)],
        LstrinG(Displayname),
        false,
        true
    ] call CBA_fnc_addsetting;
};