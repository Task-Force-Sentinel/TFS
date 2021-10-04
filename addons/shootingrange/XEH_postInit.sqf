#include "script_component.hpp"

[QGVAR(logResult), {
    inFO_1("%1", _this call FUNC(textsintolocalizedstring));
}] call CBA_fnc_addEventHandler;

// exit on Server and Headless Client
if (!hasinterface) exitwith {};

[QGVAR(playSignal), {
    (_this select 0) say3D [_this select 1, _this select 2];
}] call CBA_fnc_addEventHandler;

[QGVAR(notifyplayer), {
    params ["_texts", "_size"];
    [[_texts] call FUNC(textsintolocalizedstring), _size] call ACEFUNC(common, displaytextstructured);
}] call CBA_fnc_addEventHandler;