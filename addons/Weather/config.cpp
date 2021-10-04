#include "script_component.hpp"

class CfgPatches
{
    class TFS_Weather
    {
        author = AUTHOR;
        name = name;
        url = URL;
        units[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_UI_F", "cba_main", "cba_xeh"
        };
        version = VERSION;
        authors[] = {
            "MitchJC"
        };
        weapons[] = {};
    };
};

class Extended_Preinit_EventHandlers
{
    class TFS_Weather_Event
    {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Weather\XEH_preinit.sqf'";
    };
};

class CfgFunctions
{
    #include "CfgFunctions.hpp"
};