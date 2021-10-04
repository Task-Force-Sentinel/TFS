#include "\z\tfs\addons\adminmenu\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: TFS_adminmenu_fnc_log

Description:
logs a message to registered admins, visible in the admin menu.

parameters:
_message - Message to be displayed [string]
_isWarning - Whether to display as warning [Bool]
_tag - Tag that message will be prefixed with [string, defaults to "[TFS log]"]

Returns:
nil

Examples:
(begin example)
["Everything is on fire!", true, "[TFS firealarm]"] call TFS_adminmenu_fnc_log;
(end)
(begin example)
[format ["%1 did something", profileName]] call TFS_adminmenu_fnc_log;
(end)

Author:
Freddo
---------------------------------------------------------------------------- */
// todo: move to PREPMAin(log)

params [
    ["_message", "", [""]],
    ["_isWarning", false, [false]],
    ["_tag", "", [""]]
];

if !(_tag isEqualto "") then {
    _tag = format ["[%1] ", _tag];
};

[QGVAR(serverlog), [CBA_missiontime, _tag + _message, _isWarning]] call CBA_fnc_serverEvent;
log_2("Sent log message to admins: ""%1"" isWarning: %2", _message, _isWarning)