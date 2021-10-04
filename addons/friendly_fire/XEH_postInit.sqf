#include "script_component.hpp"

[{
    if (!GVAR(loggingEnabled)) exitwith {};
    
    inFO("Friendly fire logging enabled");
    
    if (hasinterface) then {
        [{
            !isNull player
        }, {
            inFO("Adding friendly fire EH");
            GVAR(ehId) = player addEventHandler ["Hit", {
                params ["_target", "_shooter"];
                
                if (
                !isplayer _shooter
                || {
                    side group _target != side group _shooter
                    || {
                        _target isEqualto _shooter
                    }
                }
                ) exitwith {};
                
                [QGVAR(friendlyfire), [_target, _shooter, vehicle _shooter]] call CBA_fnc_globalEvent;
            }];
        }] call CBA_fnc_waitUntilandexecute;
    };
    
    [QGVAR(friendlyfire), {
        params ["_victim", "_origin", "_originvehicle"];
        private _nl = toString [13, 10] + " ";
        
        private _msg = if (_originvehicle isKindOf "CAManBase") then {
            [
                _nl,
                name _origin, " shot at ", name _victim, _nl,
                "Victim-origin distance: ", _victim distance _origin
            ] joinstring ""
        } else {
            private _displayname = gettext (configOf _origin >> "displayname");
            [
                _nl,
                _displayname, " shot at ", name _victim, _nl,
                "gunner: ", name gunner _originvehicle, _nl,
                "commander: ", name commander _originvehicle, _nl,
                "driver: ", name driver _originvehicle, _nl,
                "Shooter: ", name _origin, _nl,
                "Victim-origin distance: ", _victim distance _originvehicle
            ] joinstring ""
        };
        
        WARNinG(_msg);
    }] call CBA_fnc_addEventHandler;
}] call EFUNC(common, runAftersettingsinit);