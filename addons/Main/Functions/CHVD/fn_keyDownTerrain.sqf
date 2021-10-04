if (CHVD_keydown) exitwith {};
CHVD_keydown = true;

private ["_vehtypestring"];
_updatetype = [_this, 0, 0, [0]] call BIS_fnc_param;
if (_updatetype isEqualto 0) exitwith {};
_terrainGridArray = [50, 48.99, 25, 12.5, 3.125];

if (!isNull (findDisplay 2900)) then {
    call CHVD_fnc_opendialog
};

switch (CHVD_vehtype) do {
    case 1: {
        _vehtypestring = "car";
    };
    case 2: {
        _vehtypestring = "air";
    };
    default {
        _vehtypestring = "foot";
    };
};

_terrainGridVar = "CHVD_" + _vehtypestring + "Terrain";
_terrainGrid = call compile _terrainGridVar;
_terrainindex = switch (true) do {
    case (_terrainGrid >= 49): {
        0
    };
    case (_terrainGrid >= 48.99): {
        1
    };
    case (_terrainGrid >= 25): {
        2
    };
    case (_terrainGrid >= 12.5): {
        3
    };
    case (_terrainGrid >= 3.125): {
        4
    };
    default {
        1
    };
};
_terrainindex = (_terrainindex + _updatetype) max 0 min 4;
_terrainGrid = _terrainGridArray select _terrainindex;

if (!TFS_Main_viewDistanceNoGrass) then {
    _terrainindex = _terrainindex max 1;
    _terrainGrid = _terrainGrid min 48.99;
};

call compile format ["%1 = %2", _terrainGridVar, _terrainGrid];
call compile format ["profileNamespace setVariable ['%1', %1]", _terrainGridVar];

call CHVD_fnc_updateTerrain;

_terrainstring = "";
for "_i" from (37.125) to 3.125 step -1 do {
    if (round ((sqrt _terrainGrid) * 10) -18 >= 53 / 37.125 * _i) then {
        _terrainstring = _terrainstring + "·";
    } else {
        _terrainstring = _terrainstring + "I";
    };
};

_terrainQualityArray = [
    ["Low", localize "str_chvd_low"] select (islocalized "str_chvd_low"),
    ["Standart", localize "str_chvd_standard"] select (islocalized "str_chvd_standard"),
    ["High", localize "str_chvd_high"] select (islocalized "str_chvd_high"),
    ["Very High", localize "str_chvd_veryHigh"] select (islocalized "str_chvd_veryHigh"),
    ["Ultra", localize "str_chvd_ultra"] select (islocalized "str_chvd_ultra")
];
_terrainQuality = _terrainQualityArray select _terrainindex;
_textTerrainQuality = if (islocalized "str_chvd_terrainQuality") then {
    localize "str_chvd_terrainQuality"
} else {
    "Terrain Quality"
};
_textTerrainGrid = if (islocalized "str_chvd_terrainGrid") then {
    localize "str_chvd_terrainGrid"
} else {
    "Terrain Grid"
};

hintSilent parsetext format ["<t align='left' size='1.33'>
    %2: <t align='right'>%3</t>
    <br />
    %4: <t align='right'>%5</t>
    <br />
    <t size='2' shadow='0' color='%1'>%6</t>
    </t>",
    [profileNamespace getVariable ['GUI_BCG_RGB_R', 0.3843], profileNamespace getVariable ['GUI_BCG_RGB_G', 0.7019], profileNamespace getVariable ['GUI_BCG_RGB_B', 0.8862], profileNamespace getVariable ['GUI_BCG_RGB_A', 0.7]] call BIS_fnc_colorRGBAtoHTML,
    _textTerrainQuality,
    _terrainQuality,
    _textTerrainGrid,
    _terrainGrid,
    _terrainstring
];

terminate (missionnamespace getVariable ["CHVD_hintHandle", scriptNull]);
CHVD_hintHandle = [] spawn {
    uiSleep 2;
    hintSilent "";
};

[] spawn {
    uiSleep 0.05;
    CHVD_keydown = false;
};