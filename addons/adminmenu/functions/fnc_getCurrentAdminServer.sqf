#include "\z\tfs\addons\adminmenu\script_component.hpp"

if (!isServer) exitwith {};

private _adminId = -1;
{
    if (admin owner _x > 0) exitwith {
        _adminId = owner _x;
    };
} forEach allplayers;

if (_adminId isEqualto -1) exitwith {
    GVAR(currentadmin) = "nobody";
    remoteExecutedOwner publicVariableClient QGVAR(currentadmin);
};

[remoteExecutedOwner, admin _adminId] remoteExec [QFUNC(getCurrentadminClient), _adminId];