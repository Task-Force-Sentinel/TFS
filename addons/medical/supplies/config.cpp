#include "..\script_component.hpp"

class CfgPatches
{
    class TFS_Medical_Supplies
    {
        name = "$STR_TFS_Medical_Supplies_Title";
        addonRootClass = "TFS_Medical";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3_props_f_orange",
            "tfs_medical"
        };
        units[] = {
            "TFS_Item_FirstAid",
            "TFS_Item_MedicKit"
        };
        weapons[] = {
            "TFS_FirstAid",
            "TFS_MedicKit"
        };
        author = AUTHOR;
        authors[] = {
            "O. Jemineh"
        };
        url = URL;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"