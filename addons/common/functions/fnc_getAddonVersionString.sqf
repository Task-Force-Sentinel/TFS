/*
*	ARMA EXTENDED ENVIRONMENT
*	\tfs_common\functions\addons\fn_getAddonVersionstring.sqf
*	by Ojemineh
*
*	get addon version string
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<strinG>
*
*	Example:
*	["TFS_core"] call tfs_fnc_getAddonVersionstring;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = "";

if (isClass (configFile >> "CfgPatches" >> _classname)) then {
    _return = gettext (configFile >> "CfgPatches" >> _classname >> "versionstr");
};

_return;