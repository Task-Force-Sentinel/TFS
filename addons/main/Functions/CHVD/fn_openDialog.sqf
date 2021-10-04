[] spawn {
    if (missionnamespace getVariable ["CHVD_loadingdialog", false]) exitwith {
        true
    };
    
    if (isNull (findDisplay 2900)) then {
        _dialog = createdialog "CHVD_dialog";
        if (!_dialog) exitwith {
            systemChat "CH View distance: Error: can't open dialog."
        };
    };
    
    disableSerialization;
    CHVD_loadingdialog = true;
    
    {
        ctrlsettext _x;
    } forEach [[1006, str round CHVD_foot], [1007, str round CHVD_footobj], [1013, str round CHVD_car], [1014, str round CHVD_carObj], [1017, str round CHVD_air], [1018, str round CHVD_airObj], [1400, str CHVD_footTerrain], [1401, str CHVD_carTerrain], [1402, str CHVD_airTerrain]];
    
    {
        sliderSetRange [_x select 0, 0, _x select 2];
        sliderSetRange [_x select 3, 0, (_x select 5) min (_x select 1)];
        sliderSetspeed [_x select 0, 500, 500];
        sliderSetspeed [_x select 3, 500, 500];
        sliderSetPosition [_x select 0, _x select 1];
        sliderSetPosition [_x select 3, (_x select 4) min (_x select 1)];
    } forEach [[1900, CHVD_foot, TFS_Main_viewDistancemaxdistance, 1901, CHVD_footobj, TFS_Main_viewDistancemaxObjectdistance], [1902, CHVD_car, TFS_Main_viewDistancemaxdistance, 1903, CHVD_carObj, TFS_Main_viewDistancemaxObjectdistance], [1904, CHVD_air, TFS_Main_viewDistancemaxdistance, 1905, CHVD_airObj, TFS_Main_viewDistancemaxObjectdistance]];
    
    {
        _ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
        
        _textDisabled = if (islocalized "str_chvd_disabled") then {
            localize "str_chvd_disabled"
        } else {
            "Disabled"
        };
        _ctrl lbAdd _textDisabled;
        
        _textDynamic = if (islocalized "str_chvd_dynamic") then {
            localize "str_chvd_dynamic"
        } else {
            "Dynamic"
        };
        _ctrl lbAdd _textDynamic;
        
        _textFov = if (islocalized "str_chvd_fov") then {
            localize "str_chvd_fov"
        } else {
            "FOV"
        };
        _ctrl lbAdd _textFov;
        
        _mode = call compile ("CHVD_" + (_x select 1) + "Syncmode");
        _ctrl lbsetCurSel _mode;
        // call compile format ["systemChat '%1 %2'", _ctrl, _x select 1];
        
        _handle = _ctrl ctrlsetEventHandler ["LBSelChanged",
            format ["[_this select 1, '%1', %2, %3, %4] call CHVD_fnc_onLBSelChanged_syncmode", _x select 1, _x select 2, _x select 3, _x select 4]
        ];
    } forEach [[1404, "foot", 1410, 1901, 1007], [1406, "car", 1409, 1903, 1014], [1408, "air", 1411, 1905, 1018]];
    
    {
        _ctrl = _x select 0;
        _mode = call compile ("CHVD_" + (_x select 1) + "Syncmode");
        
        switch (_mode) do {
            case 1: {
                _percentage = call compile ("CHVD_" + (_x select 1) + "SyncPercentage");
                ctrlsettext [_ctrl, format ["%1", _percentage * 100] + "%"];
                ctrlEnable [_ctrl, true];
            };
            default {
                ctrlEnable [_ctrl, false];
            };
        };
        _ctrlDisplay = (findDisplay 2900) displayCtrl _ctrl;
        _handle = _ctrlDisplay ctrlsetEventHandler ["keydown",
            format ["[_this select 0, '%1', %2, %3] call CHVD_fnc_onEBinput_syncmode", _x select 1, _x select 2, _x select 3]
        ];
    } forEach [[1410, "foot", 1901, 1007], [1409, "car", 1903, 1014], [1411, "air", 1905, 1018]];
    
    {
        _ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
        if (TFS_Main_viewDistanceNoGrass) then {
            _textLow = if (islocalized "str_chvd_low") then {
                localize "str_chvd_low"
            } else {
                "Low"
            };
            _ctrl lbAdd _textLow;
        };
        _textStandard = if (islocalized "str_chvd_standard") then {
            localize "str_chvd_standard"
        } else {
            "Standard"
        };
        _ctrl lbAdd _textStandard;
        _textHigh = if (islocalized "str_chvd_high") then {
            localize "str_chvd_high"
        } else {
            "High"
        };
        _ctrl lbAdd _textHigh;
        _textVeryHigh = if (islocalized "str_chvd_veryHigh") then {
            localize "str_chvd_veryHigh"
        } else {
            "Very High"
        };
        _ctrl lbAdd _textVeryHigh;
        _textUltra = if (islocalized "str_chvd_ultra") then {
            localize "str_chvd_ultra"
        } else {
            "Ultra"
        };
        _ctrl lbAdd _textUltra;
        
        _sel = [_x select 1] call CHVD_fnc_selTerrainQuality;
        if (TFS_Main_viewDistanceNoGrass) then {
            _ctrl lbsetCurSel _sel;
        } else {
            _ctrl lbsetCurSel (_sel - 1);
        };
    } forEach [[1500, CHVD_footTerrain], [1501, CHVD_carTerrain], [1502, CHVD_airTerrain]];
    
    {
        _ctrl = ((findDisplay 2900) displayCtrl (_x select 0));
        _handle = _ctrl ctrlsetEventHandler ["LBSelChanged",
            format ["[_this select 1, '%1', %2] call CHVD_fnc_onLBSelChanged", _x select 1, _x select 2]
        ];
    } forEach [[1500, "CHVD_footTerrain", 1400], [1501, "CHVD_carTerrain", 1401], [1502, "CHVD_airTerrain", 1402]];
    
    if (CHVD_footSyncmode isEqualto 1) then {
        ctrlEnable [1901, false];
        ctrlEnable [1007, false];
    } else {
        ctrlEnable [1901, true];
        ctrlEnable [1007, true];
    };
    
    if (CHVD_carSyncmode isEqualto 1) then {
        ctrlEnable [1903, false];
        ctrlEnable [1014, false];
    } else {
        ctrlEnable [1903, true];
        ctrlEnable [1014, true];
    };
    
    if (CHVD_airSyncmode isEqualto 1) then {
        ctrlEnable [1905, false];
        ctrlEnable [1018, false];
    } else {
        ctrlEnable [1905, true];
        ctrlEnable [1018, true];
    };
    
    CHVD_loadingdialog = false;
};