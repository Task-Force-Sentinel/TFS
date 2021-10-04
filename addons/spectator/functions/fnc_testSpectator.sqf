#include "\z\tfs\addons\spectator\script_component.hpp"
// TFS Spectator configured.
private _output = [];

if (!((getMissionConfigValue ["respawn",0] == 1) and ("TFS_Spectator" in (getMissionConfigValue ["respawnTemplates",[]])))) then {
    _output pushBack [0,"TFS Spectator is not setup correctly. See wiki for instructions."];
};



_output
