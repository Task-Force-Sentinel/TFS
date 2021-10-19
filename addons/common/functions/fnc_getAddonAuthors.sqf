/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\core\functions\addons\fn_getAddonAuthors.sqf
 * by Ojemineh
 * 
 * get addon authors
 * 
 * Arguments:
 * 0: classname - <STRING>
 * 
 * Return:
 * <ARRAY>
 * 
 * Example:
 * ["tfs_core"] call TFS_fnc_getAddonAuthors;
 * 
 */

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = [];

if (isClass (configfile >> "CfgPatches" >> _classname)) then {
 _return = getArray (configfile >> "CfgPatches" >> _classname >> "authors");
};

_return;