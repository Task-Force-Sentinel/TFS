#include "script_component.hpp"

private ["_playableunits", "_aiunits", "_allgroups"];
if (isMultiplayer) then {
    _playableunits = count playableunits;
} else {
    _playableunits = count switchableunits;
};

_aiunits = ((count allunits)-(_playableunits));
_allgroups = count allgroups;

// init reporting
diag_log "";
diag_log "";
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: init - Mission name: %1", (gettext (missionConfigFile >> "overviewtext"))];
diag_log format ["RPT: init - Mission developer: %1", (gettext (missionConfigFile >> "author"))];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: init - Number of clients connected: %1", _playableunits];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: init - Number of AI's active: %1", _aiunits];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: init - Number of groups active: %1", _allgroups];
diag_log "--------------------------------------------------------------------------------------";
diag_log "";
diag_log "";