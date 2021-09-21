/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\modules\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize modules addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call TFSRHS_modules_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["tfsrhs_modules"] call TFSRHS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "modules"] call TFSRHS_fnc_log;

// -------------------------------------------------------------------------------------------------
