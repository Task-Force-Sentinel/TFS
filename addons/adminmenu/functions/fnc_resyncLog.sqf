#include "\z\tfs\addons\adminmenu\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: TFS_adminmenu_fnc_resynclog

Description:
Resynchronizes the server log from the server to a client

parameters:
_ownerID - owner ID which will have its log resynchronized [Number or Object, default clientowner]

Returns:
nil

Examples:
(begin example)
[clientowner] call TFS_adminmenu_fnc_resynclog;
(end)

Author:
Freddo
---------------------------------------------------------------------------- */

params [
    ["_ownerID", clientowner, [-1, objNull]]
];

if IS_OBJECT(_ownerID) then {
    _ownerID = owner _ownerID;
};

[QGVAR(resynclog), _ownerID] call CBA_fnc_serverEvent;
log("Requesting log resynchronization")