#include "\z\tfs\addons\spectator\script_component.hpp"
waitUntil {
    !dialog
};
if (isnil "bis_fnc_moduleremoteControl_unit") then {
    createdialog QGVAR(dialog);
} else {
    waitUntil {
        sleep 0.1;
        isnil "bis_fnc_moduleremoteControl_unit"
    };
    waitUntil {
        sleep 0.1;
        !isNull (findDisplay 312)
    };
    // wait until open
    (findDisplay 312) displayAddEventHandler ["Unload", {
        GVAR(zeusPos) = getPos curatorCamera;
        GVAR(zeusDir) = getDir curatorCamera; GVAR(zeuspitchBank) = curatorCamera call BIS_fnc_getpitchBank; _this spawn tfs_spectator_fnc_zeusUnload;
    }];
};