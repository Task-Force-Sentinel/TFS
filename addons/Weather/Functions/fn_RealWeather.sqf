/*
TFS MISSION TEMPLATE
fn_RealWeather.sqf
Author: Code34
MitchJC - Conversion to PFH & Function
Description: randomizes Weather
*/
// not documented: postinit
private _TFS_Weather_StartWeather = uiNamespace getVariable ["TFS_Weather_StartWeather", 1];
private _TFS_Weather_Realtime = uiNamespace getVariable ["TFS_Weather_Realtime", true];
private _TFS_Weather_Synctime = uiNamespace getVariable ["TFS_Weather_Synctime", 60];
private _TFS_Weather_mintime = uiNamespace getVariable ["TFS_Weather_mintime", 1];
private _TFS_Weather_maxtime = uiNamespace getVariable ["TFS_Weather_maxtime", 60];
private _TFS_Weather_daytimeAcc = uiNamespace getVariable ["TFS_Weather_daytimeAcc", 1];
private _TFS_Weather_NighttimeAcc = uiNamespace getVariable ["TFS_Weather_NighttimeAcc", 1];

// Convert to minutes
_TFS_Weather_mintime = _TFS_Weather_mintime * 60;
_TFS_Weather_maxtime = _TFS_Weather_maxtime * 60;

private _StartingWeather = call {
    if (_TFS_Weather_StartWeather isEqualto 0) exitwith {
        selectRandom ["CLEAR", "CLEAR", "CLOUDY", "CLOUDY", "rain"]
    };
    if (_TFS_Weather_StartWeather isEqualto 1) exitwith {
        "CLEAR"
    };
    if (_TFS_Weather_StartWeather isEqualto 2) exitwith {
        "CLOUDY"
    };
    if (_TFS_Weather_StartWeather isEqualto 3) exitwith {
        "rain"
    };
    "CLEAR";
};

// do not edit below

if (_TFS_Weather_mintime > _TFS_Weather_maxtime) then {
    hint format["min time cannot be highter than max time. min time set to %1 ", _TFS_Weather_maxtime, _TFS_Weather_mintime];
    _TFS_Weather_mintime = _TFS_Weather_maxtime;
};

// setDate startingdate;

wcweather = call {
    if (_StartingWeather isEqualto "CLEAR") exitwith {
        [0, 0, 0, [random 3, random 3, true], date];
    };
    if (_StartingWeather isEqualto "CLOUDY") exitwith {
        [0, 0, 0.6, [random 3, random 3, true], date];
    };
    if (_StartingWeather isEqualto "rain") exitwith {
        [1, 0, 1, [random 3, random 3, true], date];
    };
    [0, 0, 0, [random 3, random 3, true], date];
};

// add handler
if (local player) then {
    wcweatherstart = true;
    "wcweather" addpublicVariableEventHandler {
        // first JIP synchronization
        if (wcweatherstart) then {
            wcweatherstart = false;
            skiptime -24;
            86400 setRain (wcweather select 0);
            86400 setFog (wcweather select 1);
            86400 setovercast (wcweather select 2);
            skiptime 24;
            simulWeatherSync;
            setwind (wcweather select 3);
            setDate (wcweather select 4);
        } else {
            wcweather = _this select 1;
            60 setRain (wcweather select 0);
            60 setFog (wcweather select 1);
            60 setovercast (wcweather select 2);
            setwind (wcweather select 3);
            setDate (wcweather select 4);
        };
    };
};

// SERVER side SCRIPT
if (!isServer) exitwith {};

// apply weather
skiptime -24;
86400 setRain (wcweather select 0);
86400 setFog (wcweather select 1);
86400 setovercast (wcweather select 2);
skiptime 24;
simulWeatherSync;
setwind (wcweather select 3);
setDate (wcweather select 4);

// sync server & client weather & time
[
    {
        params ["_args", "_pfhID"];
        _args params ["_TFS_Weather_Realtime", "_TFS_Weather_NighttimeAcc", "_TFS_Weather_daytimeAcc"];
        
        wcweather set [4, date];
        publicVariable "wcweather";
        if (!_TFS_Weather_Realtime) then {
            if ((date select 3 > 16) or (date select 3 <6)) then {
                settimeMultiplier _TFS_Weather_NighttimeAcc;
            } else {
                settimeMultiplier _TFS_Weather_daytimeAcc;
            };
        };
    }, _TFS_Weather_Synctime, [_TFS_Weather_Realtime, _TFS_Weather_NighttimeAcc, _TFS_Weather_daytimeAcc]
] call CBA_fnc_addPerFrameHandler;

private _lastrain = 0;
private _rain = 0;
private _overcast = 0;

[
    {
        params ["_args", "_pfhID"];
        _args params ["_lastrain", "_rain", "_overcast"];
        
        _overcast = random 1;
        if (_overcast > 0.70) then {
            _rain = random 1;
        } else {
            _rain = 0;
        };
        if ((date select 3 > 2) and (date select 3 <6)) then {
            if (random 1 > 0.9) then {
                _fog = 0.1 + (random 0.4);
            } else {
                _fog = 0.1 + (random 0.2);
            };
        } else {
            if ((_lastrain > 0.6) and (_rain < 0.2)) then {
                _fog = random 0.2;
            } else {
                _fog = 0;
            };
        };
        if (random 1 > 0.95) then {
            _wind = [random 7, random 7, true];
        } else {
            _wind = [random 3, random 3, true];
        };
        _lastrain = _rain;
        
        wcweather = [_rain, _fog, _overcast, _wind, date];
        
        60 setRain (wcweather select 0);
        60 setFog (wcweather select 1);
        60 setovercast (wcweather select 2);
        setwind (wcweather select 3);
    }, floor random [_TFS_Weather_mintime, ((_TFS_Weather_mintime + _TFS_Weather_maxtime)/2), _TFS_Weather_maxtime], [_lastrain, _rain, _overcast]
] call CBA_fnc_addPerFrameHandler;