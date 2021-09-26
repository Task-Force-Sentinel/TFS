#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QEGVAR(common,TFS_enabled) || !(EGVAR(common,TFS_enabled))) exitWith {};

#include "Scripts\cbrn\XEH_PreInit.sqf"

ADDON = true;
