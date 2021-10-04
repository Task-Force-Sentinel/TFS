#include "script_component.hpp"

ADDON = false;

if (isNil QEGVAR(common,TFS_enabled) || !(EGVAR(common,TFS_enabled))) exitWith {};

#include "XEH_PREP.hpp"

ADDON = true;
