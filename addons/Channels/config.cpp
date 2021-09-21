#include "script_component.hpp"

class CfgPatches
{
	class TFSRHSFundamentals_Channels
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
    class TFSRHSFundamentals_Channels_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfsrhs\addons\Channels\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class TFSRHS_AI_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfsrhs\addons\Channels\XEH_postInit.sqf'";
    };
};