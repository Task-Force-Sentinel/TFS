#include "script_component.hpp"


class CfgPatches {
	
	class TFSRHS_core {
		author = AUTHOR;
		name = COMPONENT_NAME;
		url = URL;
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"tfsrhs_main",
			"tfsrhs_hints"
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
