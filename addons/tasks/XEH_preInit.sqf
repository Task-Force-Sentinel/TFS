#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

if (isServer) then {
    GVAR(tasks) = createHashMap;
    GVAR(tasksArray) = [];
    
    // load tasks from config
    {
        private _taskconfigname = configname _x;
        private _tasknamespace = [_x] call EFUNC(common, readConfigtonamespace);
        _tasknamespace setVariable ["taskconfigname", _taskconfigname];
        
        GVAR(tasks) set [_taskconfigname, _tasknamespace];
        GVAR(tasksArray) pushBack _tasknamespace;
    } forEach ("true" configClasses (missionConfigFile >> "CfgTasks"));
};

ADdoN = true;