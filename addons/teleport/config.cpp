#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        author = "Head";
        url = URL;
        units[] = {QGVAR(module),QGVAR(deploy)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFSRHS_common"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgModules.hpp"


class CfgWaypoints
{
    class TFSRHS
    {
        displayName = "TFSRHS";
        class Paradrop
        {
            displayName = "Paradrop";
            file = "\z\tfsrhs\addons\teleport\functions\fnc_paradropWaypoint.sqf";
            icon = "\a3\air_f_beta\Parachute_01\Data\UI\map_parachute_01_ca.paa";
            class Attributes
            {
            };
        };
    };
};
