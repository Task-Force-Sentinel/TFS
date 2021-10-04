#include "script_component.hpp"

if (isnil QEGVAR(common, TFS_enabled) || !(EGVAR(common, TFS_enabled))) exitwith {};

if !(hasinterface) exitwith {};

call FUNC(arsenal_postinit);

TFS_unit setVariable [QGVAR(preventProne), false, true];

[{
    if ((stance TFS_unit) == "PRONE" &&
    {
        TFS_unit getVariable [QGVAR(preventProne), false]
    } &&
    {
        !(TFS_unit getVariable ["ACE_isUnconscious", false]) || lifeState TFS_unit != "inCAPACITATED"
    }
    ) then {
        TFS_unit playAction "playerCrouch";
        hint localize "str_TFS_boc_crouch";
    };
}, 1] call CBA_fnc_addPerFrameHandler;