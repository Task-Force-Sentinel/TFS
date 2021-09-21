#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        author = AUTHOR;
		name = COMPONENT_NAME;
        url = URL;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFSRHS_common"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"
#include "display3DEN.hpp"
#include "autotest.hpp"
