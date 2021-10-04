#include "script_component.hpp"

class CfgPatches
{
    class TFS_core
    {
        author = AUTHor;
        name = COMPONENT_name;
        url = URL;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tfs_main",
            "tfs_hints"
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