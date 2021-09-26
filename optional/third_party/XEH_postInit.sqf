#include "script_component.hpp"

if (isNil QEGVAR(common,TFS_enabled) || !(EGVAR(common,TFS_enabled))) exitWith {};

#include "Scripts\cbrn\XEH_PostInit.sqf"

if (isServer || !hasInterface) exitWith {};

if (!mod_ACE3) then {
    [] execVM QPATHTOF(Scripts\NRE_earplugs.sqf); // Earplugs
};
