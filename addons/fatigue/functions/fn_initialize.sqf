/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\fatigue\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize fatigue addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call TFSRHS_fatigue_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["tfsrhs_fatigue"] call TFSRHS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "fatigue"] call TFSRHS_fnc_log;

// -------------------------------------------------------------------------------------------------
