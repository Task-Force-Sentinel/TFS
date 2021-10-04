#include "script_component.hpp"

class CfgPatches
{
    class TFS_player
    {
        author = AUTHor;
        name = COMPONENT_name;
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

#include "Cfg3DEN.hpp"

class CfgFunctions
{
    #include "cfgFunctions.hpp"
};