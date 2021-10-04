#include "\z\tfs\addons\adminmenu\script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]]];

// Cache
if (isnil QGVAR(sideColors)) then {
    GVAR(sideColors) = [
        [0.975, 0.929, 0.078, 0.8],
        [1, 1, 1, 0.8],
        [profileNamespace getVariable ['Map_blufor_R', 0], profileNamespace getVariable ['Map_blufor_G', 0], profileNamespace getVariable ['Map_blufor_B', 1], 0.8],
        [profileNamespace getVariable ['Map_opfor_R', 1], profileNamespace getVariable ['Map_opfor_G', 0], profileNamespace getVariable ['Map_opfor_B', 0], 0.8],
        [profileNamespace getVariable ['Map_independent_R', 0], profileNamespace getVariable ['Map_independent_G', 1], profileNamespace getVariable ['Map_independent_B', 0], 0.8],
        [profileNamespace getVariable ['Map_civilian_R', 0.5], profileNamespace getVariable ['Map_civilian_G', 0], profileNamespace getVariable ['Map_civilian_B', 0.5], 0.8]
    ];
    GVAR(sideColorsindex) = [sideLogic, blufor, opfor, resistance, civilian];
};

GVAR(sideColors) select ((GVAR(sideColorsindex) find _side) + 1);