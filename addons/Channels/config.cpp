#include "script_component.hpp"

class CfgPatches
{
	class TFSFundamentals_Channels
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class TFSFundamentals_Channels_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Channels\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class TFS_AI_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Channels\XEH_postInit.sqf'";
    };
};