/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\diagnostics\fn_log.sqf
*	by Ojemineh
*
*	add a rpt-log
*
*	Arguments:
*	0: type			- <NUMBER>
*	1: message		- <strinG>
*	2: params		- <ARRAY>
*	3: extension	- <strinG>
*	4: modification - <strinG>
*
*	Return:
*	nothing
*
*	Example:
*	[4, "player: '%1', time: '%2'", [player, time], "core"] call TFS_fnc_log;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_level", "_message", "_params", "_extension", "_modification"];

_level			= [_this, 0, 0, [0]] call BIS_fnc_param;
_message		= [_this, 1, "", [""]] call BIS_fnc_param;
_params			= [_this, 2, [], [[]]] call BIS_fnc_param;
_extension		= [_this, 3, "", [""]] call BIS_fnc_param;
_modification	= [_this, 4, "TFS", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

private _levelstr = "";

switch (_level) do {
    case 1: {
        _levelstr = "fatal";
    };
    case 2: {
        _levelstr = "error";
    };
    case 3: {
        _levelstr = "warning";
    };
    case 4: {
        _levelstr = "info";
    };
    case 5: {
        _levelstr = "debug";
    };
    case 6: {
        _levelstr = "trace";
    };
    default {
        _levelstr = "";
    };
};

// -------------------------------------------------------------------------------------------------

private _messagestr = "";

if (_params isEqualto []) then {
    _messagestr = _message;
} else {
    _messagestr = _message;
    if (count _params > 0) then {
        for "_i" from 1 to (count _params) do {
            private _param = "";
            if ((_params select (_i-1)) isEqualtype "") then {
                _param = (_params select (_i-1));
            } else {
                _param = str (_params select (_i-1));
            };
            private _pattern = "%" + (str _i);
            _messagestr = [_messagestr, _pattern, _param] call CBA_fnc_replace;
        };
    };
};

// -------------------------------------------------------------------------------------------------

private _logstr = "";

if (_modification != "") then {
    _logstr = _logstr + format ["[%1] ", toUpper(_modification)];
};

if (_extension != "") then {
    _logstr = _logstr + format ["(%1) ", toLower(_extension)];
};

if (_levelstr != "") then {
    _logstr = _logstr + format ["%1: ", toUpper(_levelstr)];
};

if (_messagestr != "") then {
    _logstr = _logstr + _messagestr;
};

// -------------------------------------------------------------------------------------------------

if (_logstr != "") then {
    diag_log (text _logstr);
};