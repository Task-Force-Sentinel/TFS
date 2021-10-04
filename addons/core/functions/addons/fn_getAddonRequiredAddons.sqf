/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\core\functions\addons\fn_getAddonRequiredAddons.sqf
 * by Ojemineh
 * 
 * get addon required addons
 * 
 * Arguments:
 * 0: classname - <STRING>
 * 
 * Return:
 * <ARRAY>
 * 
 * Example:
 * ["tfs_core"] call TFS_fnc_getAddonRequiredAddons;
 * 
 */

// -------------------------------------------------------------------------------------------------

private ["_classname"];

_classname = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _return = [];

if (isClass (configfile >> "CfgPatches" >> _classname)) then {
 _return = getArray (configfile >> "CfgPatches" >> _classname >> "requiredAddons");
};

_return;