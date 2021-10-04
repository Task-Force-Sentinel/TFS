#include "script_component.hpp"

class cfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        author = "Snippers";
        url = URL;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"TFS_common"};
        VERSION_CONFIG;
    };
};

#include "Cfg3DEN.hpp"
#include "CfgDiary.hpp"
#include "CfgEventHandlers.hpp"

#include "display3DEN.hpp"

class TFS_autotest
{
    class GVAR(test)
    {
        code = QUOTE([] call FUNC(testBriefings));
    };
};
