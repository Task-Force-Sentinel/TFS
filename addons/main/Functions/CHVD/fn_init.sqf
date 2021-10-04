[] spawn {
    if (!hasinterface) exitwith {};
    // Wait for mission init, in case there are variables defined some place else
    waitUntil {
        time > 0
    };
    
    // Define variables, load from profileNamespace
    TFS_Main_viewDistanceNoGrass = if (isnil "TFS_Main_viewDistanceNoGrass") then {
        true
    } else {
        TFS_Main_viewDistanceNoGrass
    };
    TFS_Main_viewDistancemaxdistance = if (isnil "TFS_Main_viewDistancemaxdistance") then {
        12000
    } else {
        TFS_Main_viewDistancemaxdistance
    };
    TFS_Main_viewDistancemaxObjectdistance = if (isnil "TFS_Main_viewDistancemaxObjectdistance") then {
        12000
    } else {
        TFS_Main_viewDistancemaxObjectdistance
    };
    
    CHVD_footSyncmode = profileNamespace getVariable ["CHVD_footSyncmode", 0];
    CHVD_footSyncPercentage = profileNamespace getVariable ["CHVD_footSyncPercentage", 0.8];
    CHVD_carSyncmode = profileNamespace getVariable ["CHVD_carSyncmode", 0];
    CHVD_carSyncPercentage = profileNamespace getVariable ["CHVD_carSyncPercentage", 0.8];
    CHVD_airSyncmode = profileNamespace getVariable ["CHVD_airSyncmode", 0];
    CHVD_airSyncPercentage = profileNamespace getVariable ["CHVD_airSyncPercentage", 0.8];
    
    CHVD_foot = (profileNamespace getVariable ["CHVD_foot", viewDistance]) min TFS_Main_viewDistancemaxdistance;
    CHVD_car = (profileNamespace getVariable ["CHVD_car", viewDistance]) min TFS_Main_viewDistancemaxdistance;
    CHVD_air = (profileNamespace getVariable ["CHVD_air", viewDistance]) min TFS_Main_viewDistancemaxdistance;
    
    CHVD_footobj = (profileNamespace getVariable ["CHVD_footobj", viewDistance]) min TFS_Main_viewDistancemaxObjectdistance min TFS_Main_viewDistancemaxdistance;
    CHVD_footobj = if (CHVD_footSyncmode isEqualto 1) then {
        CHVD_foot * CHVD_footSyncPercentage
    } else {
        CHVD_footobj
    };
    CHVD_carObj = (profileNamespace getVariable ["CHVD_carObj", viewDistance]) min TFS_Main_viewDistancemaxObjectdistance min TFS_Main_viewDistancemaxdistance;
    CHVD_carObj = if (CHVD_carSyncmode isEqualto 1) then {
        CHVD_car * CHVD_carSyncPercentage
    } else {
        CHVD_carObj
    };
    CHVD_airObj = (profileNamespace getVariable ["CHVD_airObj", viewDistance]) min TFS_Main_viewDistancemaxObjectdistance min TFS_Main_viewDistancemaxdistance;
    CHVD_airObj = if (CHVD_airSyncmode isEqualto 1) then {
        CHVD_air * CHVD_airSyncPercentage
    } else {
        CHVD_airObj
    };
    
    CHVD_footTerrain = if (TFS_Main_viewDistanceNoGrass) then {
        profileNamespace getVariable ["CHVD_footTerrain", 25]
    } else {
        (profileNamespace getVariable ["CHVD_footTerrain", 25]) min 48.99 max 3.125
    };
    CHVD_carTerrain = if (TFS_Main_viewDistanceNoGrass) then {
        profileNamespace getVariable ["CHVD_carTerrain", 25]
    } else {
        (profileNamespace getVariable ["CHVD_carTerrain", 25]) min 48.99 max 3.125
    };
    CHVD_airTerrain = if (TFS_Main_viewDistanceNoGrass) then {
        profileNamespace getVariable ["CHVD_airTerrain", 25]
    } else {
        (profileNamespace getVariable ["CHVD_airTerrain", 25]) min 48.99 max 3.125
    };
    
    CHVD_vehtype = 0;
    // 0 = foot, 1 = car, 2 = air
    
    // Begin initialization
    waitUntil {
        !isNull player
    };
    waitUntil {
        !isNull findDisplay 46
    };
    
    _actiontext = if (islocalized "str_chvd_title") then {
        localize "str_chvd_title"
    } else {
        "View distance settings"
    };
    player addAction [_actiontext, CHVD_fnc_opendialog, [], -90, false, true, '', '_target isEqualto vehicle _this'];
    player addEventHandler ["Respawn", format ["player addAction ['%1', CHVD_fnc_opendialog, [], -90, false, true, '', '_target isEqualto vehicle _this']", _actiontext]];
    
    (findDisplay 46) displayAddEventHandler ["Unload", {
        call CHVD_fnc_updatesettings
    }];
    // Reset obj view distance so game doesn't lag when browsing menues and so on, if FOV method was used during the game
    
    [] call CHVD_fnc_updateVehtype;
    [] call CHVD_fnc_updatesettings;
    
    // Detect when to change setting type
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            _currentvehicle = vehicle player;
            waitUntil {
                _currentvehicle != vehicle player
            };
            [] call CHVD_fnc_updateVehtype;
            if ((CHVD_vehtype isEqualto 0 && CHVD_footSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 1 && CHVD_carSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 2 && CHVD_airSyncmode isEqualto 2)) then {
                [1] call CHVD_fnc_updatesettings;
                [] call CHVD_fnc_updateTerrain;
                [4] call CHVD_fnc_updatesettings
            } else {
                [] call CHVD_fnc_updatesettings;
            };
        };
    };
    
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            _UAVstatus = call CHVD_fnc_UAVstatus;
            waitUntil {
                _UAVstatus != call CHVD_fnc_UAVstatus
            };
            [] call CHVD_fnc_updateVehtype;
            if ((CHVD_vehtype isEqualto 0 && CHVD_footSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 1 && CHVD_carSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 2 && CHVD_airSyncmode isEqualto 2)) then {
                [1] call CHVD_fnc_updatesettings;
                [] call CHVD_fnc_updateTerrain;
                [4] call CHVD_fnc_updatesettings
            } else {
                [] call CHVD_fnc_updatesettings;
            };
        };
    };
    
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            _currentZoom = call CHVD_fnc_trueZoom;
            waitUntil {
                _currentZoom != call CHVD_fnc_trueZoom
            };
            if ((CHVD_vehtype isEqualto 0 && CHVD_footSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 1 && CHVD_carSyncmode isEqualto 2) ||
            (CHVD_vehtype isEqualto 2 && CHVD_airSyncmode isEqualto 2)) then {
                [4] call CHVD_fnc_updatesettings
            };
        };
    };
};