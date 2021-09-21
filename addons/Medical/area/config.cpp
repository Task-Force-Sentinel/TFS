#include "..\script_component.hpp"

class CfgPatches {
	
	class TFSRHS_Medical_Area {
		name = "$STR_TFSRHS_Medical_Area_Title";
		addonRootClass = "TFSRHS_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_enoch",
			"tfsrhs_medical"
		};
		units[] = {
			"TFSRHS_Item_MedicArea"
		};
		weapons[] = {
			"TFSRHS_MedicArea"
		};
		author = "$STR_TFSRHS_Medical_Area_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_TFSRHS_Medical_Area_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
