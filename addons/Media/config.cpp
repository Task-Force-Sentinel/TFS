#include "script_component.hpp"

class CfgPatches
{
    class TFS_Media
    {
        author = AUTHOR;
        name = COMPONENT_NAME;
        url = URL;
        units[] = {
            "TFS_flag_White", "TFS_flag_Black"
        };
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

#include "CfgVehicles.hpp"
#include "CfgMusic.hpp"
#include "Cfgradio.hpp"
#include "CfgSounds.hpp"
#include "CfgUnitinsignia.hpp"
class CfgFunctions
{
    #include "cfgFunctions.hpp"
};