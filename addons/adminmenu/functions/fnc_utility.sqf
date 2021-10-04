#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_utilityFunction", "_utilityname", ["_requirealive", false]];

GVAR(utilityData) = [];
if (!isnil QGVAR(selectedTab)) then {
    if (GVAR(selectedTab) isEqualto IDC_TFS_adminMENU_G_PMAN && !isnil QGVAR(playerManagement_selected)) then {
        GVAR(utilityData) = GVAR(playerManagement_selected) apply {
            _x call BIS_fnc_objectFromNetId
        };
        
        if ((count GVAR(utilityData)) isEqualto 0) exitwith {
            systemChat "[TFS admin Menu] No players selected for the action!";
        };
        
        if (_requirealive) then {
            GVAR(utilityData) = GVAR(utilityData) select {
                alive _x && _x isKindOf "CAManBase"
            };
            
            if ((count GVAR(utilityData)) isEqualto 0) exitwith {
                systemChat "[TFS admin Menu] No alive players selected for the action!";
            };
        };
    };
};

if (isnil _utilityFunction) then {
    systemChat format ["[TFS admin Menu] Utility with name '%1' requires undefined function '%2'", _utilityname, _utilityFunction];
} else {
    call (missionnamespace getVariable _utilityFunction);
};