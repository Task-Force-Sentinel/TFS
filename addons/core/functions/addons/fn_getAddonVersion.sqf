/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\addons\fn_getAddonVersion.sqf
*	by Ojemineh
*
*	get addon version
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<strinG>
*
*	Example:
*	["tfs_core"] call TFS_fnc_getAddonVersion;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = "";

if (isClass (configFile >> "CfgPatches" >> _classname)) then {
    _return = gettext (configFile >> "CfgPatches" >> _classname >> "version");
};

_return;