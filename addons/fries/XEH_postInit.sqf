#include "script_component.hpp"

if (is3DEN || !(EGVAR(common, aceFastroping))) exitwith {};

if (isServer) then {
    ["Helicopter", "init", {
        if (!GVAR(autoAdd)) exitwith {};
        _this call ACEFUNC(fastroping, equipFRIES);
    }, true, ["ACE_friesBase"], true] call CBA_fnc_addClassEventHandler;
};