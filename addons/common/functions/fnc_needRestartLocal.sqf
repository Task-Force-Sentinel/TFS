/*
* ARMA EXTENDED ENVIRONMENT
* \tfs_common\functions\settings\fn_needRestartlocal.sqf
* by Ojemineh
*
* settings restart notification
*
* Arguments:
* 0: setting - <strinG>
* 1: restartID - <NUMBER>
*
* Return:
* nothing
*
* Example:
* ["TFS_debug_enabled", 2] call tfs_fnc_needRestartlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_setting", "_restartID"];

_setting = [_this, 0, "", [""]] call BIS_fnc_param;
_restartID = [_this, 1, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

private _message = "";

switch (_restartID) do {
    // RESTART MISSION
    case 1: {
        _message = format [localize "str_tfs_Common_hint_Need_Restart_Mission", toUpper(_setting)];
    };
    
    // RESTART SESSION (GLOBAL)
    case 2: {
        _message = format [localize "str_tfs_Common_hint_Need_Restart_Session", toUpper(_setting)];
    };
    
    // RESTART SESSION (player)
    case 3: {
        _message = format [localize "str_tfs_Common_hint_Need_Restart_Session", toUpper(_setting)];
    };
    
    // RESTART ENGinE
    default {
        _message = format [localize "str_tfs_Common_hint_Need_Restart_Engine", toUpper(_setting)];
    };
};

private _hint = format [hint_tpl_image_2, "\tfs_common\data\icons\settings_ca.paa", _message];
[_hint, 1] call tfs_fnc_hint;