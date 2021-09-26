#include "script_component.hpp"

if (EGVAR(common,aceFastroping)) then {
    [
        QGVAR(autoAdd),
        "CHECKBOX",
        ["Auto add FRIES", "Automatically add FRIES to helicopters that support them"],
        "TFS FRIES",
        true,
        true
    ] call CBA_fnc_addSetting;
};
