/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\diagnostics\fn_logGlobal.sqf
* by Ojemineh
*
* add a rpt-log
*
* Arguments:
* 0: type - <NUMBER>
* 1: message - <strinG>
* 2: params - <ARRAY>
* 3: extension - <strinG>
* 4: modification - <strinG>
*
* Return:
* nothing
*
* Example:
* [4, "player: '%1', time: '%2'", [player, time], "core"] call TFS_fnc_logGlobal;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_level", "_message", "_params", "_extension", "_modification"];

_level = [_this, 0, 0, [0]] call BIS_fnc_param;
_message = [_this, 1, "", [""]] call BIS_fnc_param;
_params = [_this, 2, [], [[]]] call BIS_fnc_param;
_extension = [_this, 3, "", [""]] call BIS_fnc_param;
_modification = [_this, 4, "TFS", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

["tfs_core_log", [_level, _message, _params, _extension, _modification]] call CBA_fnc_globalEvent;