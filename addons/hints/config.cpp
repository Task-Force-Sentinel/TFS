#include "script_component.hpp"

class CfgPatches
{

	class TFS_Hints
	{
		author = AUTHOR;
		name = COMPONENT_NAME;
		url = URL;
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"tfs_main"};
		units[] = {};
		weapons[] = {};
		authors[] = {
			"O. Jemineh"};
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "gui\RscHint.hpp"
