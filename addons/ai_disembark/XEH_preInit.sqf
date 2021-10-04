#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

#include "initsettings.sqf"

["CAManBase", "GetoutMan", {
    _this call FUNC(onDisembark);
}] call CBA_fnc_addClassEventHandler;

["landvehicle", "initPost", {
    (_this select 0) allowcrewinImmobile (random 1 < GVAR(stayinImmobileChance))
}] call CBA_fnc_addClassEventHandler;

ADdoN = true;