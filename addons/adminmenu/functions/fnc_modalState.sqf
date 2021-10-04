#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

if (isNull (uiNamespace getVariable [QGVAR(modalDisplay), displayNull])) exitwith {
    false
};

true