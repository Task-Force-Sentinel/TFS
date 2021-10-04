if (EGVAR(common, aceSafemode)) then {
    [
        QGVAR(startlocked),
        "CHECKBOX",
        [LstrinG(Startlocked), LstrinG(Startlocked_Description)],
        LstrinG(Displayname),
        true,
        2
    ] call CBA_fnc_addsetting;
};