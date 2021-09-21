/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\core\functions\diagnostics\fn_isDebug.sqf
 *	by Ojemineh
 *	
 *	check if debug is enabled
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	<BOOLEAN>
 *	
 *	Example:
 *	[] call TFSRHS_fnc_isDebug;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _return = (missionNamespace getVariable ["tfsrhs_debug_enabled", false]);

_return;