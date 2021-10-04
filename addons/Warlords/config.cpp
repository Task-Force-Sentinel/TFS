#include "script_component.hpp"

class CfgPatches
{
    class TFS_Warlords
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

class CfgWLRequisitionPresets
{
    #include "Presets\RHS_Presets.hpp"
    #include "Presets\RHS_Pacific_Presets.hpp"
};

#include "CfgRespawnTemplates.hpp"

class params
{
    #include "Params.hpp"
};

class CfgFunctions
{
    #include "CfgFunctions.hpp"
};