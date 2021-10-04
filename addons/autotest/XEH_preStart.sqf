#include "script_component.hpp"

#include "XEH_PREP.sqf"

// Store DLC hash
private _dlcClasses = "isNumber (_x >> 'appiD')" configClasses (configFile >> "Cfgmods");

private _dlcHash = _dlcClasses apply {
    [getNumber (_x >> "appiD"), gettext (_x >> "nameShort")]
};

uiNamespace setVariable [QGVAR(dlcHash), [_dlcHash, "Unknown"] call CBA_fnc_hashCreate];