#include "script_component.hpp"

class CfgPatches
{
	class TFS_Interaction
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
class CfgFunctions {

    #include "cfgFunctions.hpp"
};

class Extended_PreInit_EventHandlers {
    class TFSFundamentals_Interaction_Event {
        init = "call compile preprocessFileLineNumbers 'z\tfs\addons\Interaction\XEH_preInit.sqf'";
    };
};