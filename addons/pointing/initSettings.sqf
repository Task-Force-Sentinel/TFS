if (EGVAR(common, aceFinger)) then {
    [
        QGVAR(vehicleEnabled),
        "CHECKBOX",
        [LstrinG(vehicle_Enabled), LstrinG(vehicle_Enabled_Description)],
        LstrinG(Displayname),
        true,
        true
    ] call CBA_fnc_addsetting;
};