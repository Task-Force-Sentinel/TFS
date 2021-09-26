[] spawn {
	if (!hasInterface) exitWith {};
	//Wait for mission init, in case there are variables defined some place else
	waitUntil {time > 0};
	
	//Define variables, load from profileNamespace
	TFS_Main_ViewDistanceNoGrass = if (isNil "TFS_Main_ViewDistanceNoGrass") then {true} else {TFS_Main_ViewDistanceNoGrass};
	TFS_Main_ViewDistanceMaxDistance = if (isNil "TFS_Main_ViewDistanceMaxDistance") then {12000} else {TFS_Main_ViewDistanceMaxDistance};
	TFS_Main_ViewDistanceMaxObjectDistance = if (isNil "TFS_Main_ViewDistanceMaxObjectDistance") then {12000} else {TFS_Main_ViewDistanceMaxObjectDistance};
	
	CHVD_footSyncMode = profileNamespace getVariable ["CHVD_footSyncMode",0];
	CHVD_footSyncPercentage = profileNamespace getVariable ["CHVD_footSyncPercentage",0.8];	
	CHVD_carSyncMode = profileNamespace getVariable ["CHVD_carSyncMode",0];
	CHVD_carSyncPercentage = profileNamespace getVariable ["CHVD_carSyncPercentage",0.8];	
	CHVD_airSyncMode = profileNamespace getVariable ["CHVD_airSyncMode",0];
	CHVD_airSyncPercentage = profileNamespace getVariable ["CHVD_airSyncPercentage",0.8];

	CHVD_foot = (profileNamespace getVariable ["CHVD_foot",viewDistance]) min TFS_Main_ViewDistanceMaxDistance;
	CHVD_car = (profileNamespace getVariable ["CHVD_car",viewDistance]) min TFS_Main_ViewDistanceMaxDistance;
	CHVD_air = (profileNamespace getVariable ["CHVD_air",viewDistance]) min TFS_Main_ViewDistanceMaxDistance;

	CHVD_footObj = (profileNamespace getVariable ["CHVD_footObj",viewDistance]) min TFS_Main_ViewDistanceMaxObjectDistance min TFS_Main_ViewDistanceMaxDistance;
	CHVD_footObj = if (CHVD_footSyncMode isEqualTo 1) then {CHVD_foot * CHVD_footSyncPercentage} else {CHVD_footObj};	
	CHVD_carObj = (profileNamespace getVariable ["CHVD_carObj",viewDistance]) min TFS_Main_ViewDistanceMaxObjectDistance min TFS_Main_ViewDistanceMaxDistance;
	CHVD_carObj = if (CHVD_carSyncMode isEqualTo 1) then {CHVD_car * CHVD_carSyncPercentage} else {CHVD_carObj};	
	CHVD_airObj = (profileNamespace getVariable ["CHVD_airObj",viewDistance]) min TFS_Main_ViewDistanceMaxObjectDistance min TFS_Main_ViewDistanceMaxDistance;
	CHVD_airObj = if (CHVD_airSyncMode isEqualTo 1) then {CHVD_air * CHVD_airSyncPercentage} else {CHVD_airObj};

	CHVD_footTerrain = if (TFS_Main_ViewDistanceNoGrass) then {profileNamespace getVariable ["CHVD_footTerrain",25]} else {(profileNamespace getVariable ["CHVD_footTerrain",25]) min 48.99 max 3.125};
	CHVD_carTerrain = if (TFS_Main_ViewDistanceNoGrass) then {profileNamespace getVariable ["CHVD_carTerrain",25]} else {(profileNamespace getVariable ["CHVD_carTerrain",25]) min 48.99 max 3.125};
	CHVD_airTerrain = if (TFS_Main_ViewDistanceNoGrass) then {profileNamespace getVariable ["CHVD_airTerrain",25]} else {(profileNamespace getVariable ["CHVD_airTerrain",25]) min 48.99 max 3.125};
	
	CHVD_vehType = 0; // 0 = foot, 1 = car, 2 = air

	//Begin initialization
	waitUntil {!isNull player};
	waitUntil {!isNull findDisplay 46};

    _actionText = if (isLocalized "STR_chvd_title") then {localize "STR_chvd_title"} else {"View Distance Settings"};
    player addAction [_actionText, CHVD_fnc_openDialog, [], -90, false, true, '', '_target isEqualTo vehicle _this'];
    player addEventHandler ["Respawn", format ["player addAction ['%1', CHVD_fnc_openDialog, [], -90, false, true, '', '_target isEqualTo vehicle _this']", _actionText]];

	(findDisplay 46) displayAddEventHandler ["Unload", {call CHVD_fnc_updateSettings}]; // Reset obj view distance so game doesn't lag when browsing menues and so on, if FOV method was used during the game
	
	[] call CHVD_fnc_updateVehType;
	[] call CHVD_fnc_updateSettings;

	//Detect when to change setting type
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_currentVehicle = vehicle player;			
			waitUntil {_currentVehicle != vehicle player};			
			[] call CHVD_fnc_updateVehType;
			if (
				(CHVD_vehType isEqualTo 0 && CHVD_footSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 1 && CHVD_carSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 2 && CHVD_airSyncMode isEqualTo 2)
			) then {
				[1] call CHVD_fnc_updateSettings;
				[] call CHVD_fnc_updateTerrain;
				[4] call CHVD_fnc_updateSettings
			} else {				
				[] call CHVD_fnc_updateSettings;
			};
		};
	};
	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_UAVstatus = call CHVD_fnc_UAVstatus;			
			waitUntil {_UAVstatus != call CHVD_fnc_UAVstatus};			
			[] call CHVD_fnc_updateVehType;
			if (
				(CHVD_vehType isEqualTo 0 && CHVD_footSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 1 && CHVD_carSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 2 && CHVD_airSyncMode isEqualTo 2)
			) then {
				[1] call CHVD_fnc_updateSettings;
				[] call CHVD_fnc_updateTerrain;
				[4] call CHVD_fnc_updateSettings
			} else {
				[] call CHVD_fnc_updateSettings;
			};
		};
	};
	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_currentZoom = call CHVD_fnc_trueZoom;			
			waitUntil {_currentZoom != call CHVD_fnc_trueZoom};			
			if (
				(CHVD_vehType isEqualTo 0 && CHVD_footSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 1 && CHVD_carSyncMode isEqualTo 2) || 
				(CHVD_vehType isEqualTo 2 && CHVD_airSyncMode isEqualTo 2)
			) then {[4] call CHVD_fnc_updateSettings};
		};
	};
};