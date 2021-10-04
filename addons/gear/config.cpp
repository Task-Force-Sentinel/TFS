#include "script_component.hpp"

class CfgPatches
{
    class TFS_Gear
    {
        name = "$str_TFS_Gear_Title";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        units[] = {};
        weapons[] = {};
        author = AUTHor;
        authors[] = {
            "O. Jemineh"
        };
        url = URL;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"