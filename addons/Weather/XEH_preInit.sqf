// TFSRHS_Weather_Master
[
    "TFSRHS_Weather_Master",
    "CHECKBOX",
    ["Dynamic Weather Enable", "Turn ON/OFF Dynamic Weather. MUST be enabled for any of these settings to work!"],
    "TFSRHS Weather",
    false,
    true,
    {
        if (_this) then { call TFSRHS_fnc_RealWeather};
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_StartWeather
[
    "TFSRHS_Weather_StartWeather",
    "LIST",
    ["Dynamic Weather - Start", "If Dynamic Weather enabled, what should the starting weather be?"],
    "TFSRHS Weather",
    [[0, 1, 2, 3], [
        ["Random", "Start with the Weather on a random setting."],
        ["Clear", "Start with the Weather Clear."],
        ["Cloudy", "Start with the Weather Cloudy."],
        ["Rain", "Start with the Weather Raining"]
    ], 1],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_StartWeather", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_RealTime
[
    "TFSRHS_Weather_RealTime",
    "CHECKBOX",
    ["Real Time", "Real time is more realistic weather changes, disable for more rapid changes."],
    "TFSRHS Weather",
    true,
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_RealTime", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_SyncTime
[
    "TFSRHS_Weather_SyncTime",
    "SLIDER",
    ["Sync Time", "How often the server broadcasts weather to clients in seconds. Lower = faster client updates at cost of higher network traffic."],
    "TFSRHS Weather",
    [1, 120, 60, 0],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_SyncTime", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_MinTime
[
    "TFSRHS_Weather_MinTime",
    "SLIDER",
    ["Forcast Minimum Time", "Min time mins (real time) before a new weather forecast"],
    "TFSRHS Weather",
    [1, 120, 1, 0],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_MinTime", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_MaxTime
[
    "TFSRHS_Weather_MaxTime",
    "SLIDER",
    ["Forcast Maximum Time", "Max time mins (real time) before a new weather forecast - Must be greater than Forcast Minimum Time"],
    "TFSRHS Weather",
    [1, 240, 60, 0],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_MaxTime", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_DayTimeAcc
[
    "TFSRHS_Weather_DayTimeAcc",
    "SLIDER",
    ["Day Time Acceleration", "Time Acceleration during daylight. 2.00 = 2 game seconds for every 1 real second."],
    "TFSRHS Weather",
    [0, 60, 1, 2],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_DayTimeAcc", _this];
    }
] call CBA_Settings_fnc_init;

// TFSRHS_Weather_NightTimeAcc
[
    "TFSRHS_Weather_NightTimeAcc",
    "SLIDER",
    ["Night Time Acceleration", "Time Acceleration during night. 2.00 = 2 game seconds for every 1 real second."],
    "TFSRHS Weather",
    [0, 60, 1, 2],
    true,
    {
       uiNamespace setVariable ["TFSRHS_Weather_NightTimeAcc", _this];
    }
] call CBA_Settings_fnc_init;