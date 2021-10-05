#include "script_component.hpp"

if (isNil QEGVAR(common,TFS_enabled) || !(EGVAR(common,TFS_enabled))) exitWith {};

if !(hasInterface) exitWith {};

call FUNC(arsenal_postInit);

TFS_unit setVariable [QGVAR(preventProne),false,true];

[{
    if (
        (stance TFS_unit) == "PRONE" &&
        {TFS_unit getvariable [QGVAR(preventProne),false]} &&
        {!(TFS_unit getVariable ["ACE_isUnconscious", false]) || lifeState TFS_unit != "INCAPACITATED"}
       ) then {
        TFS_unit playAction "PlayerCrouch";
        hint localize "STR_TFS_BOC_crouch";
    };
},1] call CBA_fnc_addPerFrameHandler;
