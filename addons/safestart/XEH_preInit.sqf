#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

#include "initsettings.sqf"

[QGVAR(enableSafety), {
    params ["_player"];
    
    [_player] call FUNC(lowerWeapon);
    
    if (EGVAR(common, aceSafemode) && {
        GVAR(startlocked)
    }) then {
        [_player, currentWeapon _player, true] call ACEFUNC(safemode, setweaponsafety);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(lowerWeapon), {
    params ["_unit"];
    
    _unit action ["WeaponOnBack", _unit];
}] call CBA_fnc_addEventHandler;

ADdoN = true;