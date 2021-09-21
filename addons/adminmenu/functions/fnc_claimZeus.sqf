#include "\z\tfsrhs\addons\adminmenu\script_component.hpp"

if (isNull (getAssignedCuratorLogic player)) then {
    player remoteExec [QFUNC(makeZeusServer), 2];
    systemChat "[TFSRHS Admin Menu] You now have access to Zeus";

    [format ["%1 claimed zeus",profileName], false,"Admin Menu"] call FUNC(log);
} else {
    systemChat "[TFSRHS Admin Menu] You already have access to Zeus";
};
