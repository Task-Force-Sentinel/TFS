#include "script_component.hpp"
/*
* Author: NemesisRE
* Checks if client is any sort of admin
*
* Arguments:
* None
*
* Return Value:
* BOOL
*
* Example:
* call TFS_common_fnc_isadmin;
*
*/

if ((call BIS_fnc_admin) isEqualto 2) exitwith {
    true
};
if (getplayerUID TFS_unit in getMissionConfigValue ["enableDebugConsole", []]) exitwith {
    true
};
if (isServer) exitwith {
    true
};

false