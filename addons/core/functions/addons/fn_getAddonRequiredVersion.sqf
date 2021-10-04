/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\addons\fn_getAddonrequiredVersion.sqf
*	by Ojemineh
*
*	get addon required version
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<strinG>
*
*	Example:
*	["tfs_core"] call TFS_fnc_getAddonrequiredVersion;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = 0;

if (isClass (configFile >> "CfgPatches" >> _classname)) then {
    _return = getNumber (configFile >> "CfgPatches" >> _classname >> "requiredVersion");
};

_return;