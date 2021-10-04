#include "script_component.hpp"

ADdoN = false;

#include "initCBAsettings.sqf"

if (isnil QEGVAR(common, TFS_enabled) || !(EGVAR(common, TFS_enabled))) exitwith {};

#include "XEH_PREP.hpp"

ADdoN = true;