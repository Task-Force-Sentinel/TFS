/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\interactions\functions\fn_initialize.sqf
*	by Ojemineh
*
*	initialize interaction addon
*
*	Arguments:
*	nothing
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_interactions_fnc_initialize;
*
*/

// -------------------------------------------------------------------------------------------------

private _version = ["tfs_interactions"] call TFS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "interactions"] call TFS_fnc_log;

// -------------------------------------------------------------------------------------------------

if ((not hasinterface) || (is3DEN)) exitwith {};

// -------------------------------------------------------------------------------------------------

[] spawn {
    waitUntil {
        if ((!isNull player) && (time > 1)) exitwith {
            true
        };
        false
    };
    
    player addEventHandler ["inventoryOpened", {
        params ["_unit", "_container"];
        
        if (not (simulationEnabled _container)) then {
            [ format [hint_tpl_default, localize "str_TFS_interactions_inventory_Disabled"] ] call TFS_fnc_hint;
            closedialog 0;
            true;
        } else {
            if (_container isKindOf "CAManBase") then {
                if ((missionnamespace getVariable ["tfs_interactions_gear_access_enabled", 0]) == 0) then {
                    [ format [hint_tpl_default, localize "str_TFS_interactions_Gear_Disabled"] ] call TFS_fnc_hint;
                    closedialog 0;
                    true;
                } else {
                    false;
                };
            } else {
                false;
            };
        };
    }];
};