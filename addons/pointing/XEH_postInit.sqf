#include "script_component.hpp"

#include "initKeybinds.sqf"

if (IS_mod_loadED(diwako_dui_radar)) then {
    [QGVAR(pointed), {
        _this call diwako_dui_radar_fnc_incomingFinger;
    }] call CBA_fnc_addEventHandler;
};