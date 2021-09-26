#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = "TFS: Spectator";
        author = "Head";
        url = "http://www.teamonetactical.com";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tfs_common"};
        VERSION_CONFIG;
    };
};

class CfgRespawnTemplates
{
    class TFS_Spectator
    {
        displayName = "TFS Spectator";
        onPlayerRespawn  = QFUNC(init);
        onPlayerKilled = "";
    };
};
#include "autotest.hpp"
#include "CfgEventHandlers.hpp"
#include "display3DEN.hpp"
#include "dialog.hpp"
#include "CfgVehicles.hpp"
#include "tags.hpp"
