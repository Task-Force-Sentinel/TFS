/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\fatigue\functions\fn_initSettings.sqf
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
 *	[] call TFSRHS_fatigue_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// FATIGUE

[
	"tfsrhs_fatigue_global_sounds",
	"CHECKBOX",
	[
		localize "STR_TFSRHS_Fatigue_CBA_Global_Sounds_Title", 
		localize "STR_TFSRHS_Fatigue_CBA_Global_Sounds_Tip"
	],
	[
		localize "STR_TFSRHS_Fatigue_CBA_Category", 
		localize "STR_TFSRHS_Fatigue_CBA_Category_core"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
