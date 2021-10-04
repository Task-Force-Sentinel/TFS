#include "script_component.hpp"

class CfgPatches
{
    class TFS_Fatigue
    {
        author = AUTHor;
        name = COMPONENT_name;
        url = URL;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_advanced_fatigue",
            "tfs_core"
        };
        units[] = {};
        weapons[] = {};
        authors[] = {
            "O. Jemineh"
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"