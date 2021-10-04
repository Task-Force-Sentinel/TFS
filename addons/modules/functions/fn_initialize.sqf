/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\modules\functions\fn_initialize.sqf
 * by Ojemineh
 * 
 * initialize modules addon
 * 
 * Arguments:
 * nothing
 * 
 * Return:
 * nothing
 * 
 * Example:
 * [] call TFS_modules_fnc_initialize;
 * 
 */

// -------------------------------------------------------------------------------------------------

private _version = ["tfs_modules"] call DPSO_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "modules"] call TFS_fnc_log;

// -------------------------------------------------------------------------------------------------
