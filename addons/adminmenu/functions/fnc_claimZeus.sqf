#include "\z\tfs\addons\adminmenu\script_component.hpp"

if (isNull (getAssignedCuratorlogic player)) then {
    player remoteExec [QFUNC(makeZeusServer), 2];
    systemChat "[TFS admin Menu] You now have access to Zeus";
    
    [format ["%1 claimed zeus", profileName], false, "admin Menu"] call FUNC(log);
} else {
    systemChat "[TFS admin Menu] You already have access to Zeus";
};