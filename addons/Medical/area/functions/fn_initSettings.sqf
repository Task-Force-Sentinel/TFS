/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\medical\area\functions\fn_initsettings.sqf
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
*	[] call TFS_medical_area_fnc_initsettings;
*
*/

// -------------------------------------------------------------------------------------------------

// MEDICAL AREA

[
    "tfs_medical_area_constuct_time",
    "SLIDER",
    [
        localize "str_TFS_Medical_Area_CBA_Construct_time_Title",
        localize "str_TFS_Medical_Area_CBA_Construct_time_Tip"
    ],
    [
        localize "str_TFS_Medical_Area_CBA_Category",
        localize "str_TFS_Medical_Area_CBA_Category_core"
    ],
    [3, 90, 30, 0],
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_medical_area_dismantle_time",
    "SLIDER",
    [
        localize "str_TFS_Medical_Area_CBA_Dismantle_time_Title",
        localize "str_TFS_Medical_Area_CBA_Dismantle_time_Tip"
    ],
    [
        localize "str_TFS_Medical_Area_CBA_Category",
        localize "str_TFS_Medical_Area_CBA_Category_core"
    ],
    [3, 90, 30, 0],
    1,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

if (["adv_aceCPR"] call TFS_fnc_isAddon) then {
    [
        "tfs_medical_area_enable_defibrillator",
        "CHECKBOX",
        [
            localize "str_TFS_Medical_Area_CBA_Enable_Defibrillator_Title",
            localize "str_TFS_Medical_Area_CBA_Enable_Defibrillator_Tip"
        ],
        [
            localize "str_TFS_Medical_Area_CBA_Category",
            localize "str_TFS_Medical_Area_CBA_Category_core"
        ],
        false,
        1,
        {}
    ] call CBA_settings_fnc_init;
};

// -------------------------------------------------------------------------------------------------