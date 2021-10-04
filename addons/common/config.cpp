#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        author = "Nick";
        url = URL;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFS_main", "3den"};
        VERSION_CONFIG;
    };
};
#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "display3DEN.hpp"
#include "UI\RscModal.hpp"
#include "CfgSounds.hpp"

class TFS_autotest
{
    class GVAR(groupNamesSlottingScreen)
    {
        code = QUOTE([] call FUNC(testGroupsSlottingScreen));
    };
};
