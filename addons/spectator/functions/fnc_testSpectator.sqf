#include "\z\tfsrhs\addons\spectator\script_component.hpp"
// TFSRHS Spectator configured.
private _output = [];

if (!((getMissionConfigValue ["respawn",0] == 1) and ("TFSRHS_Spectator" in (getMissionConfigValue ["respawnTemplates",[]])))) then {
    _output pushBack [0,"TFSRHS Spectator is not setup correctly. See wiki for instructions."];
};



_output
