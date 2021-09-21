#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = "TFSRHS: Spectator";
        author = "Head";
        url = "http://www.teamonetactical.com";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tfsrhs_common"};
        VERSION_CONFIG;
    };
};

class CfgRespawnTemplates
{
    class TFSRHS_Spectator
    {
        displayName = "TFSRHS Spectator";
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
