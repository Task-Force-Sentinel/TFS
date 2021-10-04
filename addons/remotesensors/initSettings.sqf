[
    QGVAR(enabled),
    "CHECKBOX",
    [LstrinG(Enabled), LstrinG(Enabled_Description)],
    LstrinG(Displayname),
    true,
    true,
    {
        if (isServer || {
            !hasinterface
        }) exitwith {
            inFO("Server or HC, skipping");
        };
        
        inFO_1("disableRemoteSensors - %1", !GVAR(enabled));
        disableRemoteSensors !GVAR(enabled);
    }
] call CBA_fnc_addsetting;