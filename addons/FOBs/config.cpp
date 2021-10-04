#include "script_component.hpp"

class CfgPatches
{
    class TFS_FOBs
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
            "Mokka"
        };
        weapons[] = {};
    };
};
class CfgFunctions
{
    #include "cfgFunctions.hpp"
};

#include "Cfgvehicles.hpp"