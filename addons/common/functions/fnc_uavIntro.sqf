#include "script_component.hpp"

private ["_uavintro", "_uavintroposition", "_uavintrotext"];

if (getmarkerColor "TFS_uavintroMarker" == "") then {
    _uavintroposition = vehicle TFS_unit;
} else {
    _uavintroposition = getmarkerPos "TFS_uavintroMarker";
};

if (GVAR(uavintrotext) == "") then {
    _uavintrotext = gettext (missionConfigFile >> "onloadname");
} else {
    _uavintrotext = GVAR(uavintrotext);
};

_uavintro = [
    _uavintroposition,
    _uavintrotext,
    GVAR(uavintroAltitude),
    GVAR(uavintroradius),
    GVAR(uavintroAngle),
    1,
    [],
    0,
    true,
    3
] spawn BIS_fnc_establishingShot;

switch (GVAR(uavintroVision)) do {
    case 1: {
        camUseNVG true
    };
    case 2: {
        true setCamUseTI 0
    };
    case 3: {
        true setCamUseTI 1
    };
    case 4: {
        true setCamUseTI 2
    };
    case 5: {
        true setCamUseTI 3
    };
    case 6: {
        true setCamUseTI 4
    };
    case 7: {
        true setCamUseTI 5
    };
    case 8: {
        true setCamUseTI 6
    };
    case 9: {
        true setCamUseTI 7
    };
};

_uavintro;