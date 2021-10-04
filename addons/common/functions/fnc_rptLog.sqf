#include "script_component.hpp"

private ["_playableUnits","_aiUnits","_allGroups"];
if (isMultiplayer) then {
    _playableUnits = count playableUnits;
} else {
    _playableUnits = count switchableUnits;
};

_aiUnits = ((count allUnits)-(_playableUnits));
_allGroups = count allGroups;

// Init reporting
diag_log ""; diag_log "";
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Mission name: %1",(getText (missionConfigFile >> "overviewText"))];
diag_log format ["RPT: Init - Mission developer: %1",(getText (missionConfigFile >> "author"))];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of clients connected: %1", _playableUnits];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of AI's active: %1", _aiUnits];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of Groups active: %1", _allGroups];
diag_log "--------------------------------------------------------------------------------------";
diag_log ""; diag_log "";
