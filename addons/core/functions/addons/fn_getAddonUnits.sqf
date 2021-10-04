/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\addons\fn_getAddonunits.sqf
*	by Ojemineh
*
*	get addon units
*
*	Arguments:
*	0: classname - <strinG>
*
*	Return:
*	<ARRAY>
*
*	Example:
*	["tfs_core"] call TFS_fnc_getAddonunits;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = [];

if (isClass (configFile >> "CfgPatches" >> _classname)) then {
    _return = getArray (configFile >> "CfgPatches" >> _classname >> "units");
};

_return;