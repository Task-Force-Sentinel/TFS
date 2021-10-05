#include "..\script_component.hpp"

class CfgPatches {
    
    class TFS_Medical_Area {
        name = "$STR_TFS_Area_Title";
        addonRootClass = "TFS_Medical";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3_props_f_enoch",
            "tfs_medical"
        };
        units[] = {
            "TFS_Item_MedicArea"
        };
        weapons[] = {
            "TFS_MedicArea"
        };
        author = "$STR_TFS_Area_Author";
        authors[] = {
            "O. Jemineh"
        };
        url = "$STR_TFS_Area_URL";
        VERSION_CONFIG;
    };
    
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
