#include "script_component.hpp"

call cbrn_fnc_init;

[
    "[TFSRHS] CBRN",
    "Decon & Heal",
    {
        params ["","_object"];
        if (_object in allPlayers) then {
            _object setVariable ["cbrn_stoppedAutoDamage", true];
            _object setVariable ["cbrn_damage", 0];
            ["ace_medical_treatment_fullHealLocal", [_object], _object] call CBA_fnc_targetEvent;
            [_object,false] call ace_medical_status_fnc_setCardiacArrestState;
            [_object,false] call ace_medical_status_fnc_setUnconsciousState;
        };
    }
] call zen_custom_modules_fnc_register;

[
    "[TFSRHS] CBRN",
    "Decon",
    {
        params ["","_object"];
        if (_object in allPlayers) then {
            _object setVariable ["cbrn_stoppedAutoDamage", true];
            _object setVariable ["cbrn_damage", 0];
        };
    }
] call zen_custom_modules_fnc_register;
