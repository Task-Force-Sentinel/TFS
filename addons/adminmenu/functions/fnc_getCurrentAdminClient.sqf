#include "\z\tfs\addons\adminmenu\script_component.hpp"

// if (!isremoteExecuted && isMultiplayer) exitwith {};
// ??

params ["_origin", "_adminLevel"];

GVAR(currentadmin) = profileName;
if (_adminLevel isEqualto 1) then {
    GVAR(currentadmin) = GVAR(currentadmin) + " (voted)";
};

_origin publicVariableClient QGVAR(currentadmin);