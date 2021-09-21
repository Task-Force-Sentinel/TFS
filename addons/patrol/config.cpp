#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = "TFSRHS: Patrol";
        author = "Head";
        url = URL;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFSRHS_common"};
        VERSION_CONFIG;
    };
};


#include "CfgEventHandlers.hpp"
#include "display3DEN.hpp"
#include "display3DENEditbox.hpp"
