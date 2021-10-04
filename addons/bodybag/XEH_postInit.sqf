#include "script_component.hpp"

// exit on clients and non-hosts
if (!isServer) exitwith {};

["ace_placedinBodyBag", {
    // move all inventory from body to bodybag
    _this call FUNC(moveinventory);
}] call CBA_fnc_addEventHandler;