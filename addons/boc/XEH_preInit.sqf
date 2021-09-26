#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QEGVAR(common,TFS_enabled) || !(EGVAR(common,TFS_enabled))) exitWith {};

#include "XEH_PREP.hpp"

ADDON = true;
