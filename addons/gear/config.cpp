#include "script_component.hpp"


class CfgPatches {
    
    class TFS_Gear {
        name = "$STR_TFS_Gear_Title";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        units[] = {};
        weapons[] = {};
        author = AUTHOR;
        authors[] = {
            "O. Jemineh"
        };
        url = URL;
        VERSION_CONFIG;
    };
    
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
