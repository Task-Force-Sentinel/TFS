/*
*	ARMA EXTENDED ENVIRONMENT
*	\tfs_common\functions\settings\fn_needRestart.sqf
*	by Ojemineh
*
*	settings restart notification
*
*	Arguments:
*	0: setting		- <strinG>
*	1: restartID	- <NUMBER>
*
*	Return:
*	nothing
*
*	Example:
*	["TFS_debug_enabled", 2] call tfs_fnc_needRestart;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_setting", "_restartID"];

_setting	= [_this, 0, "", [""]] call BIS_fnc_param;
_restartID	= [_this, 1, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_setting isEqualto "") exitwith {};
if (time < 1) exitwith {};

// -------------------------------------------------------------------------------------------------

switch (_restartID) do {
    // RESTART MISSION
    case 1: {
        [_setting, _restartID] remoteExec ["TFS_fnc_needRestartlocal", 0];
    };
    
    // RESTART SESSION (GLOBAL)
    case 2: {
        [_setting, _restartID] remoteExec ["TFS_fnc_needRestartlocal", 0];
    };
    
    // RESTART SESSION (player)
    case 3: {
        [_setting, _restartID] remoteExec ["TFS_fnc_needRestartlocal", player];
    };
    
    // RESTART ENGinE
    default {
        [_setting, _restartID] remoteExec ["TFS_fnc_needRestartlocal", 0];
    };
};