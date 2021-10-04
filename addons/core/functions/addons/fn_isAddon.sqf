/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\addons\fn_isAddon.sqf
*	by Ojemineh
*
*	check if addon is available
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<BOOLEAN>
*
*	Example:
*	["tfs_core"] call TFS_fnc_isAddon;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = isClass (configFile >> "CfgPatches" >> _classname);

_return;