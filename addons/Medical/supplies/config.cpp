#include "..\script_component.hpp"

class CfgPatches {
	
	class TFSRHS_Medical_Supplies {
		name = "$STR_TFSRHS_Medical_Supplies_Title";
		addonRootClass = "TFSRHS_Medical";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"a3_props_f_orange",
			"tfsrhs_medical"
		};
		units[] = {
			"TFSRHS_Item_FirstAid",
			"TFSRHS_Item_MedicKit"
		};
		weapons[] = {
			"TFSRHS_FirstAid",
			"TFSRHS_MedicKit"
		};
		author = "$STR_TFSRHS_Medical_Supplies_Author";
		authors[] = {
			"O. Jemineh"
		};
		url = "$STR_TFSRHS_Medical_Supplies_URL";
		VERSION_CONFIG;
	};
	
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
