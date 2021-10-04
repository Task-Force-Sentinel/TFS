#include "\z\tfs\addons\adminmenu\script_component.hpp"

#include "XEH_PREP.sqf"

#include "initsettings.sqf"

GVAR(logEntries) = [];

[ // Handle new log messages
    QGVAR(log),
    {
        params [
            ["_time", CBA_missiontime, [-1]],
            ["_text", "", [""]],
            ["_isWarning", false, [false]]
        ];
        GVAR(logEntries) pushBack _this;
        GVAR(logEntries) sort true;
        TRACE_3("Received log message", _time, _text, _isWarning);
        
        // See settings
        if (GVAR(printtoChat) isEqualto 2 || {
            GVAR(printtoChat) == 1 && {
                _isWarning
            }
        }) then {
            private _warning = if (_isWarning) then [{
                "[WARNinG] "
            }, {
                ""
            }];
            systemChat (_warning + _text);
        };
    }
] call CBA_fnc_addEventHandler;

if isServer then {
    call compile_FILE(XEH_preServerinit)
};