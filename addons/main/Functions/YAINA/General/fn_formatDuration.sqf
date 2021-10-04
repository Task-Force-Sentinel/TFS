/*
Function: YAinA_F_fnc_formatDuration

Description:
formats given duration of time in seconds into a string with format hh:mm:ss

Arguments:
_in - Duration to format in s

Return Value:
Given duration in string format hh:mm:ss

Example:
nothing to see here

Author:
Martin
*/
params ["_in"];

_seconds = round(_in);

// Hours
_hours = floor(_seconds / 3600);
_seconds = _seconds - (3600 * _hours);
_hoursstring = format ["%1 hour%2", _hours, ["s", ""] select (_hours isEqualto 1)];

// minutes
_minutes = floor(_seconds / 60);
_seconds = _seconds - (60 * _minutes);
_minutesstring = format ["%1 minute%2", _minutes, ["s", ""] select (_minutes isEqualto 1)];

// Seconds
_secondsstring = format ["%1 second%2", _seconds, ["s", ""] select (_seconds isEqualto 1)];

if (_hours > 0) exitwith {
    if (_minutes > 0) exitwith {
        format["%1 %2", _hoursstring, _minutesstring];
    };
    _hoursstring;
};

if (_minutes > 0) exitwith {
    if (_seconds > 0) exitwith {
        format["%1 %2", _minutesstring, _secondsstring];
    };
    _minutesstring;
};

_secondsstring