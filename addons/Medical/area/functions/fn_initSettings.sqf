/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\medical\area\functions\fn_initSettings.sqf
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
 *	[] call TFSRHS_medical_area_fnc_initSettings;
 *	
 */

// -------------------------------------------------------------------------------------------------

// MEDICAL AREA

[
	"tfsrhs_medical_area_constuct_time",
	"SLIDER",
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Construct_Time_Title", 
		localize "STR_TFSRHS_Medical_Area_CBA_Construct_Time_Tip"
	],
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Category", 
		localize "STR_TFSRHS_Medical_Area_CBA_Category_core"
	],
	[3,90,30,0],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfsrhs_medical_area_dismantle_time",
	"SLIDER",
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Dismantle_Time_Title", 
		localize "STR_TFSRHS_Medical_Area_CBA_Dismantle_Time_Tip"
	],
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Category", 
		localize "STR_TFSRHS_Medical_Area_CBA_Category_core"
	],
	[3,90,30,0],
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

if (["adv_aceCPR"] call TFSRHS_fnc_isAddon) then {
[
	"tfsrhs_medical_area_enable_defibrillator",
	"CHECKBOX",
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Enable_Defibrillator_Title", 
		localize "STR_TFSRHS_Medical_Area_CBA_Enable_Defibrillator_Tip"
	],
	[
		localize "STR_TFSRHS_Medical_Area_CBA_Category", 
		localize "STR_TFSRHS_Medical_Area_CBA_Category_core"
	],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;
};

// -------------------------------------------------------------------------------------------------
