#include "script_component.hpp"

private ["_uavIntro","_uavIntroPosition","_uavIntroText"];

if (getMarkerColor "TFSRHS_uavIntroMarker" == "") then {
    _uavIntroPosition = vehicle TFSRHS_unit;
} else {
    _uavIntroPosition = getMarkerPos "TFSRHS_uavIntroMarker";
};

if (GVAR(uavIntroText) == "") then {
    _uavIntroText = getText (missionConfigFile >> "onLoadName");
} else {
    _uavIntroText = GVAR(uavIntroText);
};

_uavIntro = [
    _uavIntroPosition,
    _uavIntroText,
    GVAR(uavIntroAltitude),
    GVAR(uavIntroRadius),
    GVAR(uavIntroAngle),
    1,
    [],
    0,
    true,
    3
] spawn BIS_fnc_establishingShot;

switch (GVAR(uavIntroVision)) do {
    case 1: {camUseNVG true};
    case 2: {true setCamUseTI 0};
    case 3: {true setCamUseTI 1};
    case 4: {true setCamUseTI 2};
    case 5: {true setCamUseTI 3};
    case 6: {true setCamUseTI 4};
    case 7: {true setCamUseTI 5};
    case 8: {true setCamUseTI 6};
    case 9: {true setCamUseTI 7};
};

_uavIntro;
