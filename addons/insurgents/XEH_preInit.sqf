#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

#include "initsettings.sqf"

GVAR(randomGear) = createHashMap;

// init random gear from config
private _configFile = configFile >> QGVAR(gear);
{
    private _rootConfig = _x;
    {
        if ((_rootConfig isnotEqualto _configFile) || {
            GEAR_ENABLED(configname _x)
        }) then {
            log_1("Parsing random gear - %1", _x);
            {
                private _key = configname _x;
                private _items = GVAR(randomGear) get _key;
                if (isnil "_items") then {
                    log_1("Creating new gear category - %1", _key);
                    _items = [];
                    GVAR(randomGear) set [_key, _items];
                };
                
                // add and filter unavilable classes
                {
                    if (!isNull (_x call CBA_fnc_getItemConfig)) then {
                        log_1("Adding '%1' to random gear pool", _x);
                        // we allow duplicates so chance of certain item can be increased by having them more times in arrays
                        _items pushBack _x;
                    };
                } forEach getArray _x;
            } forEach configProperties [_x, "isArray _x"];
        } else {
            inFO_1("Gear disabled - %1", _x);
        };
    } forEach ("true" configClasses _x);
} forEach [_configFile, missionConfigFile >> QGVAR(gear)];

ADdoN = true;