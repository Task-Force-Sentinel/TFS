#include "script_component.hpp"

class CfgPatches
{
    class TFS_interaction
    {
        author = AUTHor;
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
class CfgFunctions
{
    #include "cfgFunctions.hpp"
};

class Extended_Preinit_EventHandlers
{
    class TFSFundamentals_interaction_Event
    {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\interaction\XEH_preinit.sqf'";
    };
};