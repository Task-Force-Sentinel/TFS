#include "script_component.hpp"

class CfgPatches
{
    class TFS_interactions
    {
        author = AUTHor;
        name = COMPONENT_name;
        url = URL;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
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

#include "Cfgactions.hpp"
#include "CfgSounds.hpp"
#include "Cfgvehicles.hpp"