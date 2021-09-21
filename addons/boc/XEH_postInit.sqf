#include "script_component.hpp"

if (isNil QEGVAR(common,TFSRHS_enabled) || !(EGVAR(common,TFSRHS_enabled))) exitWith {};

if !(hasInterface) exitWith {};

call FUNC(arsenal_postInit);

TFSRHS_unit setVariable [QGVAR(preventProne),false,true];

[{
    if (
        (stance TFSRHS_unit) == "PRONE" &&
        {TFSRHS_unit getvariable [QGVAR(preventProne),false]} &&
        {!(TFSRHS_unit getVariable ["ACE_isUnconscious", false]) || lifeState TFSRHS_unit != "INCAPACITATED"}
       ) then {
        TFSRHS_unit playAction "PlayerCrouch";
        hint localize "str_TFSRHS_boc_crouch";
    };
},1] call CBA_fnc_addPerFrameHandler;
