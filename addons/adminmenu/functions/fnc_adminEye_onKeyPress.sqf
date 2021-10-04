#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params["", "_type"];
// 20 = T Key
if (_type == 20) then {
    if (isNull GVAR(adminEyeselectedobj)) then {
        hint "nothing selected to Trigger";
    } else {
        if (typeOf GVAR(adminEyeselectedobj) == "TFS_ai_wavespawn") then {
            // Wave spawner trigger.
            TRACE_1("admin Eye triggered wave", GVAR(adminEyeselectedobj));
            [{
                params ["_wavespawner"];
                [_wavespawner] remoteExecCall [QEFUNC(ai, spawnWave), _wavespawner];
            }, GVAR(adminEyeselectedobj)] call CBA_fnc_execNextFrame;
        } else {
            private _trigger = GVAR(adminEyeselectedobj);
            
            if (local _trigger) then {
                [_trigger] call FUNC(adminEye_fireTrigger);
            } else {
                [_trigger] remoteExecCall [QFUNC(adminEye_fireTrigger), 2];
            };
        };
    };
};