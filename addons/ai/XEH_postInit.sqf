#include "\z\tfs\addons\ai\script_component.hpp"
// intended for Server and HCs.

if (hasinterface) exitwith {};

// Hotfix for: disableAI not being populated everywhere.
["CAManBase", "init", {
    (_this select 0) addEventHandler ["local", {
        params ["_entity", "_islocal"];
        if (_islocal && {
            (group _entity) getVariable [QGVAR(garrisongroup), false]
        }) then {
            _entity disableAI "Path";
            _entity setunitPos "UP";
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;