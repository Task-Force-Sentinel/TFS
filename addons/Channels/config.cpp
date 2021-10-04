#include "script_component.hpp"

class CfgPatches
{
    class TFSFundamentals_Channels
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

class Extended_Preinit_EventHandlers {
    class TFSFundamentals_Channels_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Channels\XEH_preinit.sqf'";
    };
};

class Extended_Postinit_EventHandlers {
    class TFS_AI_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Channels\XEH_postinit.sqf'";
    };
};