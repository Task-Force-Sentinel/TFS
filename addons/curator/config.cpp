#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "TFSRHS_main",
            "TFSRHS_debug_console"
        };
        author = AUTHOR;
        VERSION_CONFIG;
    };
};


#include "CfgEden.hpp"
#include "CfgEventHandlers.hpp"
