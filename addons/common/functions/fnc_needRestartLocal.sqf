/*
 * ARMA EXTENDED ENVIRONMENT
 * \tfs_common\functions\settings\fn_needRestartLocal.sqf
 * by Ojemineh
 * 
 * settings restart notification
 * 
 * Arguments:
 * 0: setting  - <STRING>
 * 1: restartID - <NUMBER>
 * 
 * Return:
 * nothing
 * 
 * Example:
 * ["TFS_debug_enabled", 2] call tfs_fnc_needRestartLocal;
 * 
 */

// -------------------------------------------------------------------------------------------------

if (Not hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------

private ["_setting", "_restartID"];

_setting = [_this, 0, "", [""]] call BIS_fnc_param;
_restartID = [_this, 1, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualTo "") exitWith {};

// -------------------------------------------------------------------------------------------------

private _message = "";

switch (_restartID) do {
    
    // RESTART MISSION
    case 1: {
        _message = format [localize "STR_tfs_Common_Hint_Need_Restart_Mission", toUpper(_setting)];
    };
    
    // RESTART SESSION (GLOBAL)
    case 2: {
        _message = format [localize "STR_tfs_Common_Hint_Need_Restart_Session", toUpper(_setting)];
    };
    
    // RESTART SESSION (PLAYER)
    case 3: {
        _message = format [localize "STR_tfs_Common_Hint_Need_Restart_Session", toUpper(_setting)];
    };
    
    // RESTART ENGINE
    default {
        _message = format [localize "STR_tfs_Common_Hint_Need_Restart_Engine", toUpper(_setting)];
    };
    
};

private _hint = format [hint_tfs_image_2, "\tfs_common\data\icons\settings_ca.paa", _message];
[_hint, 1] call tfs_fnc_hint;
