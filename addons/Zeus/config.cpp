#include "script_component.hpp"

class CfgPatches
{
    class TFS_Zeus
    {
        author = AUTHOR;
        name = name;
        url = URL;
        units[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_UI_F",
            "A3_UI_F_Curator",
            "A3_Functions_F_Curator",
            "A3_modules_F",
            "A3_modules_F_Curator",
            "A3_modules_F_Bootcamp_Misc",
            "cba_main",
            "cba_xeh"
        };
        version = VERSION;
        authors[] = {
            "MitchJC"
        };
        weapons[] = {};
    };
};

class CfgFunctions
{
    #include "CfgFunctions.hpp"
};

#include "cfgVehicles.hpp"

class Extended_Preinit_EventHandlers
{
    class TFS_Zeus_Event
    {
        init = "call compile preprocessFileLineNumbers 'z\tfs\Addons\Zeus\XEH_preinit.sqf'";
    };
};

#include "ZenActions.hpp"