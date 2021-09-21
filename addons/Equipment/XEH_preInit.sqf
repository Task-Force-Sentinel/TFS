#include "script_component.hpp"

ADDON = false;

if (isNil QEGVAR(common,TFSRHS_enabled) || !(EGVAR(common,TFSRHS_enabled))) exitWith {};

#include "XEH_PREP.hpp"

ADDON = true;
