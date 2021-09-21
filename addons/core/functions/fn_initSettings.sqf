/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\core\functions\fn_initSettings.sqf
 *	by Ojemineh
 *	
 *	register cba settings
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call TFSRHS_core_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// core SETTINGS

[
	"tfsrhs_debug_enabled",
	"CHECKBOX",
	[
		localize "STR_TFSRHS_core_CBA_Debug_Enabled_Title", 
		localize "STR_TFSRHS_core_CBA_Debug_Enabled_Tip"
	],
	[
		localize "STR_TFSRHS_core_CBA_Category", 
		localize "STR_TFSRHS_core_CBA_Category_core"
	],
	false,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"tfsrhs_showNewsOnMainMenu",
	"CHECKBOX",
	[
		localize "STR_TFSRHS_core_CBA_Show_News_Title", 
		localize "STR_TFSRHS_core_CBA_Show_News_Tip"
	],
	[
		localize "STR_TFSRHS_core_CBA_Category", 
		localize "STR_TFSRHS_core_CBA_Category_core"
	],
	true,
	0,
	{
		params ["_value"];
		if (_value) then {
			profileNamespace setVariable ["tfsrhs_showNewsOnMainMenu", true];
		} else {
			profileNamespace setVariable ["tfsrhs_showNewsOnMainMenu", false];
		};
		saveProfileNamespace;
		[(uiNamespace getVariable "RscDisplayMain")] call compile preprocessfilelinenumbers '\z\tfsrhs\addons\mainmenu\scripts\versionInfo.sqf';
	}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
	"tfsrhs_tactical_view_enabled",
	"CHECKBOX",
	[
		localize "STR_TFSRHS_core_CBA_Tactical_View_Title", 
		localize "STR_TFSRHS_core_CBA_Tactical_View_Tip"
	],
	[
		localize "STR_TFSRHS_core_CBA_Category", 
		localize "STR_TFSRHS_core_CBA_Category_Options"
	],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
