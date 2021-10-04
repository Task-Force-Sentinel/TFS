#include "script_component.hpp"

class CfgPatches
{
    class TFS_MainMenu
    {
        author = AUTHor;
        name = COMPONENT_name;
        url = URL;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "tfs_main"
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
#include "CfgAddons.hpp"
#include "CfgCommands.hpp"

#include "gui\versioninfo.hpp"