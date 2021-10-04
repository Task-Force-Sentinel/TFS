if (EGVAR(common, aceFinger)) then {
    private _aceKeybind = ["ACE3 Common", "ace_finger_finger"] call CBA_fnc_getKeybind select 5;
    private _keybind = [_aceKeybind, [41, [true, false, false]]] select isnil "_aceKeybind";
    
    [
        LLstrinG(Displayname),
        QGVAR(pointvehicle),
        [LLstrinG(Key_Pointvehicle), LLstrinG(Key_Pointvehicle_Description)],
        {
            if (!GVAR(vehicleEnabled)) exitwith {
                false
            };
            
            _this call FUNC(keyPressvehicle) // return
        },
        {},
        _keybind
    ] call CBA_fnc_addKeybind;
};