/*
Function: YAinA_F_fnc_log

Description:
General purpose logging function, that logs the message either to
the rpt or to an external log using A3log. Available logs are:

"GENERAL", "Commandslog", "Cleanuplog", "Killlog", "Errorlog", "Zeuslog"

Arguments:
_message - The log message
_log - The log type, for example Kill log, admin log or General log

Return Values:
None

Examples:
nothing to see here

Author:
Martin
*/

params ["_message", ["_log", "GENERAL"]];

if (isnil "YAinA_F_A3log") then {
    YAinA_F_A3log = isClass(configFile >> "CfgPatches" >> "a3log");
};

if (YAinA_F_A3log) then {
    [_message, _log] call A3log;
} else {
    diag_log format ["%1 | %2", _log, _message];
};