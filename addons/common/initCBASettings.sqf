[
    QGVAR(TFS_enabled),
    "CHECKBOX",
    "Enable Template",
    ["TFS settings", "Mission settings"],
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(skipMissioninit),
    "CHECKBOX",
    "Skip Mission initialization",
    ["TFS settings", "Mission settings"],
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(skipplayerinit),
    "CHECKBOX",
    "Skip player initialization",
    ["TFS settings", "Mission settings"],
    false,
    1
] call CBA_fnc_addsetting;

[
    QGVAR(playerinittime),
    "SLIDER",
    ["init time", "time to initialize the mission"],
    ["TFS settings", "Mission settings"],
    [10, 90, 15, 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(missionintro),
    "list",
    ["Mission intro", "text uses intro text on black background, UAV intro uses 'TFS_uavintroMarker' marker or player position as target"],
    ["TFS intro", "Main"],
    [[0, 1, 2, 3], ["disabled", "UAV", "Title text", "type text"], 1],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(introtext),
    "EDITBOX",
    ["intro text", "text that is show when text or UAV intro plays"],
    ["TFS intro", "text intro"],
    "[]",
    1
] call CBA_fnc_addsetting;

[
    QGVAR(uavintrotext),
    "EDITBOX",
    ["intro text", "text that is show when UAV intro plays (Mission Title if empty)"],
    ["TFS intro", "UAV intro"],
    "",
    1
] call CBA_fnc_addsetting;

[
    QGVAR(uavintroAltitude),
    "SLIDER",
    ["UAV intro altitude", "Altitude (in meters)"],
    ["TFS intro", "UAV intro"],
    [25, 3000, 100, 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(uavintroradius),
    "SLIDER",
    ["UAV intro radius", "radius of the circular movement (in meters)"],
    ["TFS intro", "UAV intro"],
    [25, 1000, 100, 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(uavintroAngle),
    "SLIDER",
    ["UAV intro angle", "Viewing angle (in degrees)"],
    ["TFS intro", "UAV intro"],
    [0, 360, 160, 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(uavintroVision),
    "list",
    ["UAV intro vision", "Different visions (Normal, NVG, TI)"],
    ["TFS intro", "UAV intro"],
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9], ["Normal", "NVG", "White Hot", "Black Hot", "Light Green Hot / Darker Green cold", "Black Hot / Darker Green cold", "Light Red Hot / Darker Red Cold", "Black Hot / Darker Red Cold", "White Hot / Darker Red Cold", "Thermal (Shade of Red and Green, Bodies are white)"], 0],
    1
] call CBA_fnc_addsetting;

[
    QGVAR(clanname),
    "EDITBOX",
    ["Clan name", "Clan name or name of the community. Used in hints, intro's etc."],
    ["TFS settings", "Main settings"],
    "CLAN name",
    1
] call CBA_fnc_addsetting;

[
    QGVAR(clanTag),
    "EDITBOX",
    ["Clan Tag", "Clantag or shortname of the community. Used in hints, intro's etc."],
    ["TFS settings", "Main settings"],
    "CLAN TAG",
    1
] call CBA_fnc_addsetting;