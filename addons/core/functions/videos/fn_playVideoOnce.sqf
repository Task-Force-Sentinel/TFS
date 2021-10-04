/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\videos\fn_playVideoOnce.sqf
* by Ojemineh
*
* play video once in a mission (by id)
*
* Arguments:
* 0: filename - <strinG>
* 1: id - <strinG>
* 2: canSkip - <BOOLEAN>
* 3: showSkip - <BOOLEAN>
* 4: showtime - <ARRAY> (Fadein, FadeOut)
*
* Return:
* ID
*
* Example:
* ["intro.ogv"] call TFS_fnc_playVideoOnce;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_filename", "_videoID", "_canSkip", "_showSkip", "_showtime"];

_filename = [_this, 0, "", [""]] call BIS_fnc_param;
_videoID = [_this, 1, "", [""]] call BIS_fnc_param;
_canSkip = [_this, 2, true, [true]] call BIS_fnc_param;
_showSkip = [_this, 3, true, [true]] call BIS_fnc_param;
_showtime = [_this, 4, [3, 3], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_filename isEqualto "") exitwith {};
if (_videoID isEqualto "") then {
    _videoID = "ONCE";
};
if (_showtime isEqualto []) then {
    _showtime = [3, 3];
};

// -------------------------------------------------------------------------------------------------

private _return = [_filename, _videoID, _canSkip, _showSkip, _showtime] spawn {
    params ["_filename", "_videoID", "_canSkip", "_showSkip", "_showtime"];
    
    missionnamespace setVariable ["BIS_fnc_playVideo_skipVideo", false];
    
    if (_canSkip) then {
        missionnamespace setVariable ["BIS_fnc_playVideo_canSkip", true];
    } else {
        missionnamespace setVariable ["BIS_fnc_playVideo_canSkip", false];
    };
    
    private _uID = getplayerUID player;
    private _videoTag = format ["TFS_Video_%1", _videoID];
    private _usersPlayed = (missionnamespace getVariable [_videoTag, []]);
    
    if (_uID in _usersPlayed) exitwith {};
    
    private _script = 0 spawn {};
    
    if ((_canSkip) && (_showSkip)) then {
        _script = [_showtime] spawn {
            params ["_showtime"];
            
            private _r = profileNamespace getVariable ['GUI_BCG_RGB_R', 0];
            private _g = profileNamespace getVariable ['GUI_BCG_RGB_G', 0];
            private _b = profileNamespace getVariable ['GUI_BCG_RGB_B', 0];
            private _a = profileNamespace getVariable ['GUI_BCG_RGB_A', 1];
            private _rgb = [_r, _g, _b] call BIS_fnc_colorRGBtoHTML;
            
            private _keyname = format ["<t color='%1'>[%2]</t>", _rgb, toUpper(((keyname 57) splitstring '"') joinstring '')];
            private _skipMsg = format ["<t font='RobotoCondensed' color='#ffffff' shadow='2' size='1.6'>%1</t>", localize "str_TFS_Core_SkipVideo"];
            private _message = format [_skipMsg, _keyname];
            
            uiSleep (_showtime select 0);
            99 cuttext [_message, "PLAin doWN", 0.5, true, true];
            uiSleep (_showtime select 1);
            99 cutFadeOut 0.5;
        };
    };
    
    _usersPlayed pushBackUnique _uID;
    missionnamespace setVariable [_videoTag, _usersPlayed, true];
    
    private _keyHandler = (findDisplay 46) displayAddEventHandler ["Keydown", "_this call TFS_fnc_videoKeydown"];
    private _video = [_filename] spawn BIS_fnc_playVideo;
    
    waitUntil {
        if (scriptDone _video) exitwith {
            true
        };
        false
    };
    
    (findDisplay 46) displayremoveEventHandler ["Keydown", _keyHandler];
    if ((_canSkip) && (_showSkip) && (!scriptDone _script)) then {
        99 cutFadeOut 0.01;
        terminate _script;
    };
};

_return;