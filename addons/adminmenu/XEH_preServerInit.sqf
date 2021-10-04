#include "\z\tfs\addons\adminmenu\script_component.hpp"

[ // Emit new log messages to admins
    QGVAR(serverlog),
    {
        private _targets = (allplayers select {
            [_x] call FUNC(isAuthorized)
        });
        if (isServer && !hasinterface) then {
            GVAR(logEntries) pushBack _this;
            GVAR(logEntries) sort true;
            TRACE_1("Received log message", _this);
        };
        
        [QGVAR(log), _this, _targets] call CBA_fnc_targetEvent;
        
        TRACE_2("Broadcasted log message", _this, _targets);
    }
] call CBA_fnc_addEventHandler;

[ // Resync log
    QGVAR(resynclog),
    {
        _this publicVariableClient QGVAR(logEntries);
        
        log_1("Resynchronized server log to client %1", _this);
    }
] call CBA_fnc_addEventHandler;