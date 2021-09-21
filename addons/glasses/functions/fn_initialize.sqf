/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\glasses\functions\fn_initialize.sqf
 *	by Ojemineh
 *
 *	initialize glasses addon
 *
 *	Arguments:
 *	nothing
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[] call TFSRHS_glasses_fnc_initialize;
 *
 */

// -------------------------------------------------------------------------------------------------

private _version = ["TFSRHS_glasses"] call TFSRHS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "glasses"] call TFSRHS_fnc_log;

// -------------------------------------------------------------------------------------------------
