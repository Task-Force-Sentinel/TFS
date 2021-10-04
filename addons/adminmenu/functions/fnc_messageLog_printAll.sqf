#include "\z\tfs\addons\adminmenu\script_component.hpp"
/* ----------------------------------------------------------------------------
internal Function: TFS_adminmenu_fnc_messagelog_printAll

Description:
Prints current admin log to RPT

Examples:
(begin example)
[] call TFS_adminmenu_fnc_messagelog_printAll;
(end)

Author:
Freddo
---------------------------------------------------------------------------- */

diag_log "[TFS adminmenu] Printing complete log to RPT";

{
    _x params [
        ["_time", CBA_missiontime, [-1]],
        ["_text", "", [""]],
        ["_isWarning", false, [false]]
    ];
    
    private _text = format ["[%1]: %2", [_time, "MM:SS"] call BIS_fnc_secondstoString, _text];
    private _warning = if (_isWarning) then [{
        "[WARNinG] "
    }, {
        ""
    }];
    diag_log (_warning + _text);
} forEach GVAR(logEntries);

diag_log "[TFS adminmenu] log end";