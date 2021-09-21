#include "script_component.hpp"


class CfgPatches {
	
	class TFSRHS_Fatigue {
		author = AUTHOR;
		name = COMPONENT_NAME;
		url = URL;
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"ace_advanced_fatigue",
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
#include "CfgSounds.hpp"
