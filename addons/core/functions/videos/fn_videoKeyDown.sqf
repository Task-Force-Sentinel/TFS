/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\videos\fn_videoKeydown.sqf
* by Ojemineh
*
* video key handler
*
* Arguments:
* 0: Control - <DISPLAY>
* 1: DikCode - <NUMBER>
* 2: shiftState - <BOOLEAN>
* 3: ctrlState - <BOOLEAN>
* 4: altState - <BOOLEAN>
*
* Return:
* nothing
*
* Example:
* _kh = (findDisplay 46) displayAddEventHandler ["Keydown", "_this call TFS_fnc_videoKeydown"];
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_Control", "_DikCode", "_shiftState", "_ctrlState", "_altState"];

_Control = _this select 0;
_DikCode = _this select 1;
_shiftState = _this select 2;
_ctrlState = _this select 3;
_altState = _this select 4;

// -------------------------------------------------------------------------------------------------

private _handled = false;

if (missionnamespace getVariable ["BIS_fnc_playVideo_canSkip", false]) then {
    switch (_DikCode) do {
        // ESC
        case 1: {
            missionnamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
            _handled = true;
        };
        
        // SPACE
        case 57: {
            missionnamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
            _handled = true;
        };
        
        // OTHER
        default {
            _handled = true;
        };
    };
} else {
    _handled = true;
};

_handled;