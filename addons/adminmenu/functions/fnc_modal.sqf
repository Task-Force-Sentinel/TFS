#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_utilityFunction", "_utilityname", ["_args", 0]];

if (isnil _utilityFunction) exitwith {
    systemChat format ["[TFS admin Menu] modal utility with name '%1' requires undefined function '%2'", _utilityname, _utilityFunction];
};

GVAR(utilityData) = [];
private _exit = false;

if ((missionnamespace getVariable [QGVAR(selectedTab), -1]) isEqualto IDC_TFS_adminMENU_G_PMAN) then {
    GVAR(utilityData) = GVAR(playerManagement_selected) apply {
        _x call BIS_fnc_objectFromNetId
    };
    
    _exit = count GVAR(utilityData) == 0;
    if (!_exit && _args isEqualto true) then {
        GVAR(utilityData) = GVAR(utilityData) select {
            alive _x && _x isKindOf "CAManBase"
        };
        _exit = count GVAR(utilityData) == 0;
    };
};

if (_exit) exitwith {
    systemChat "[TFS admin Menu] No valid player(s) selected for the action!";
};

GVAR(modalDetails) = [_utilityFunction, _utilityname, _args];
createdialog QGVAR(modal);