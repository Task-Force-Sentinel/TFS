/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\fn_initialize.sqf
*	by Ojemineh
*
*	initialize gear addon
*
*	Arguments:
*	nothing
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_gear_fnc_initialize;
*
*/

// -------------------------------------------------------------------------------------------------

private _version = ["TFS_gear"] call TFS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "gear"] call TFS_fnc_log;

// -------------------------------------------------------------------------------------------------

if (isnil "GEAR_loadoUT_PATH") then {
    GEAR_loadoUT_PATH = "loadout";
};
if (isnil "GEAR_default_TEAM") then {
    GEAR_default_TEAM = "blufor";
};
if (isnil "GEAR_default_ROLE") then {
    GEAR_default_ROLE = "rifle";
};
if (isnil "GEAR_default_type") then {
    GEAR_default_type = "0";
};

if (isnil "GEAR_KEEP_goggles") then {
    GEAR_KEEP_goggles = true;
};

// -------------------------------------------------------------------------------------------------
// EVENTHandLER

[] spawn {
    waitUntil {
        if (!isNull (findDisplay 46)) exitwith {
            true
        };
        false
    };
    waitUntil {
        if ((!isNull player) && (time > 1)) exitwith {
            true
        };
        false
    };
    
    if (player in entities "HeadlessClient_F") exitwith {};
    
    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        
        private _insignia = [_unit] call TFS_fnc_getUnitinsignia;
        if (_insignia != "") then {
            [_unit, _insignia] call TFS_fnc_setUnitinsignia;
        };
        
        false;
    }];
    
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        
        private _insignia = [_unit] call TFS_fnc_getUnitinsignia;
        if (_insignia != "") then {
            [_unit, _insignia] call TFS_fnc_setUnitinsignia;
        };
        
        false;
    }];
    
    player addEventHandler ["inventoryClosed", {
        params ["_unit", "_container"];
        
        private _insignia = [_unit] call TFS_fnc_getUnitinsignia;
        if (_insignia != "") then {
            [_unit, _insignia] call TFS_fnc_setUnitinsignia;
        };
        
        false;
    }];
};

// -------------------------------------------------------------------------------------------------