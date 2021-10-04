// add setting for all gear from settings
{
    private _class = configname _x;
    [
        GEAR_setTinG(_class),
        "CHECKBOX",
        [format [LLstrinG(GearEnabled), _class], LstrinG(GearEnabled_Description)],
        [LstrinG(Displayname), LstrinG(Gear)],
        true,
        1,
        {},
        true
    ] call CBA_fnc_addsetting;
} forEach ("true" configClasses (configFile >> QGVAR(gear)));