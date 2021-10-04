// TFS_Weather_Master
[
    "TFS_Weather_Master",
    "CHECKBOX",
    ["Dynamic Weather Enable", "Turn ON/OFF Dynamic Weather. MUST be enabled for any of these settings to work!"],
    "TFS Weather",
    false,
    true,
    {
        if (_this) then {
            call TFS_fnc_RealWeather
        };
    }
] call CBA_settings_fnc_init;

// TFS_Weather_StartWeather
[
    "TFS_Weather_StartWeather",
    "list",
    ["Dynamic Weather - Start", "if Dynamic Weather enabled, what should the starting weather be?"],
    "TFS Weather",
    [[0, 1, 2, 3], [
        ["random", "Start with the Weather on a random setting."],
        ["Clear", "Start with the Weather Clear."],
        ["Cloudy", "Start with the Weather Cloudy."],
        ["rain", "Start with the Weather raining"]
    ], 1],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_StartWeather", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_Realtime
[
    "TFS_Weather_Realtime",
    "CHECKBOX",
    ["Real time", "Real time is more realistic weather changes, disable for more rapid changes."],
    "TFS Weather",
    true,
    true,
    {
        uiNamespace setVariable ["TFS_Weather_Realtime", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_Synctime
[
    "TFS_Weather_Synctime",
    "SLIDER",
    ["Sync time", "How often the server broadcasts weather to clients in seconds. Lower = faster client updates at cost of higher network traffic."],
    "TFS Weather",
    [1, 120, 60, 0],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_Synctime", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_mintime
[
    "TFS_Weather_mintime",
    "SLIDER",
    ["forcast minimum time", "min time mins (real time) before a new weather forecast"],
    "TFS Weather",
    [1, 120, 1, 0],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_mintime", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_maxtime
[
    "TFS_Weather_maxtime",
    "SLIDER",
    ["forcast maximum time", "max time mins (real time) before a new weather forecast - Must be greater than forcast minimum time"],
    "TFS Weather",
    [1, 240, 60, 0],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_maxtime", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_daytimeAcc
[
    "TFS_Weather_daytimeAcc",
    "SLIDER",
    ["Day time Acceleration", "time Acceleration during daylight. 2.00 = 2 game seconds for every 1 real second."],
    "TFS Weather",
    [0, 60, 1, 2],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_daytimeAcc", _this];
    }
] call CBA_settings_fnc_init;

// TFS_Weather_NighttimeAcc
[
    "TFS_Weather_NighttimeAcc",
    "SLIDER",
    ["Night time Acceleration", "time Acceleration during night. 2.00 = 2 game seconds for every 1 real second."],
    "TFS Weather",
    [0, 60, 1, 2],
    true,
    {
        uiNamespace setVariable ["TFS_Weather_NighttimeAcc", _this];
    }
] call CBA_settings_fnc_init;