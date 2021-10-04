/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\fatigue\functions\fn_initialize.sqf
 * by Ojemineh
 * 
 * initialize fatigue addon
 * 
 * Arguments:
 * nothing
 * 
 * Return:
 * nothing
 * 
 * Example:
 * [] call TFS_fatigue_fnc_initialize;
 * 
 */

// -------------------------------------------------------------------------------------------------

private _version = ["tfs_fatigue"] call TFS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "fatigue"] call TFS_fnc_log;

// -------------------------------------------------------------------------------------------------
