#include "script_component.hpp"


class CfgPatches {

	class TFSRHS_Interactions {
		author = AUTHOR;
		name = COMPONENT_NAME;
		url = URL;
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"tfsrhs_core"
		};
		units[] = {};
		weapons[] = {};
		authors[] = {
			"O. Jemineh"
		};
		VERSION_CONFIG;
	};

};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

#include "CfgActions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
