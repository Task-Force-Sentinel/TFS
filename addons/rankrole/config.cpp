#include "script_component.hpp"

class CfgPatches
{
    class tfs_rankrole
    {
        name = COMPONENT_NAME;
        requiredAddons[] = {
            "ace_medical_engine"
        };
        units[] = {};
        weapons[] = {};
        author = AUTHOR;
        authors[] = {
            "YonV"
        };
        url = URL;
    };
};

class CfgFunctions {
    class tfs_rankrole {

        tag = "tfs_rankrole";
        class RankRole {

            file = "z\tfs\addons\rankrole\Functions";
            class rank {postInit = 1;};
            class makecom {};
            class makeeng {};
            class makewep {};
            class makemed {};
            class role {};
        };
    };
};








class Extended_PreInit_EventHandlers {
    tfsrank = "call compile preprocessFileLineNumbers 'z\tfs\addons\rankrole\XEH_preInit.sqf'";
};
class Extended_PostInit_EventHandlers {
    tfsrank = "call tfs_rankrole_fnc_rank";
};
