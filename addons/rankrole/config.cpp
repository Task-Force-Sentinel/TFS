#include "script_component.hpp"

class CfgPatches
{
	class tfsrhs_rankrole
	{
		name = COMPONENT_NAME;
		requiredAddons[] = {
			"ace_medical_engine"
		};
		units[] = {};
		weapons[] = {};
		author = AUTHOR;
		authors[] = {
			"YonV"
		};
		url = URL;
	};
};

class CfgFunctions {
	class tfsrhs_rankrole {

		tag = "TFSRHS_rankrole";
		class RankRole {

			file = "z\tfsrhs\addons\rankrole\Functions";
			class rank {postInit = 1;};
            class makecom {};
            class makeeng {};
            class makewep {};
            class makemed {};
            class role {};
		};
	};
};








class Extended_PreInit_EventHandlers {
	tfsrhsrank = "call compile preprocessFileLineNumbers 'z\tfsrhs\addons\rankrole\XEH_preInit.sqf'";
};
class Extended_PostInit_EventHandlers {
	tfsrhsrank = "call tfsrhs_rankrole_fnc_rank";
};
