#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QEGVAR(common,TFSRHS_enabled) || !(EGVAR(common,TFSRHS_enabled))) exitWith {};

#include "Scripts\cbrn\XEH_PreInit.sqf"

ADDON = true;
