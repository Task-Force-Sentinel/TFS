/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\tfsrhs_common\functions\addons\fn_getAddonVersionString.sqf
 *	by Ojemineh
 *	
 *	get addon version string
 *	
 *	Arguments:
 *	0: classname - <STRING>
 *	
 *	Return:
 *	<STRING>
 *	
 *	Example:
 *	["TFSRHS_core"] call tfsrhs_fnc_getAddonVersionString;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = "";

if (isClass (configfile >> "CfgPatches" >> _classname)) then {
	_return = getText (configfile >> "CfgPatches" >> _classname >> "versionStr");
};

_return;