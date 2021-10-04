#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

if (isServer || !hasinterface) then {
    ["tank_F", "fired", {
        if !(_this call FUNC(canHeat)) exitwith {};
        TRACE_1("tank shot by AI, heating up", _this);
        params ["_vehicle"];
        _vehicle setVariable [QGVAR(heattime), CBA_missiontime + 30];
        // heat up the vehicle
        [QGVAR(heat), _vehicle] call CBA_fnc_globalEvent;
    }] call CBA_fnc_addClassEventHandler;
};

if (hasinterface) then {
    [QGVAR(heat), {
        private _tiPars = getvehicleTIPars _this vectorAdd [0.2, 0.2, 0.2];
        _this setvehicleTIPars _tiPars;
    }] call CBA_fnc_addEventHandler;
};

ADdoN = true;