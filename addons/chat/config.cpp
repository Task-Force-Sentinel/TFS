#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        author = "Freddo";
        url = URL;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFSRHS_common"};
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
