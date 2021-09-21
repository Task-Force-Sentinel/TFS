#include "script_component.hpp"

if (isNil QEGVAR(common,TFSRHS_enabled) || !(EGVAR(common,TFSRHS_enabled))) exitWith {};

#include "Scripts\cbrn\XEH_PostInit.sqf"

if (isServer || !hasInterface) exitWith {};

if (!mod_ACE3) then {
    [] execVM QPATHTOF(Scripts\NRE_earplugs.sqf); // Earplugs
};
