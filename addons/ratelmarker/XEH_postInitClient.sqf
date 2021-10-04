#include "script_component.hpp"

// exit on Headless
if (!hasinterface) exitwith {};

// Add Keybind
["TFS", QGVAR(OpenRatelMarker), localize LstrinG(Open), {
    if ([vehicle ACE_player] call FUNC(canUseMarkerMenu)) then {
        call FUNC(createMarkerMenu);
    };
    false
}, {
    false
}, [19, [true, true, true]], false] call CBA_fnc_addKeybind;
// Ctrl+Alt+Shift+R

// Client EH
[QGVAR(created), FUNC(createMarker)] call CBA_fnc_addEventHandler;