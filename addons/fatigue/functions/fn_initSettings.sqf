/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\fatigue\functions\fn_initsettings.sqf
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
*	[] call TFS_fatigue_fnc_initsettings;
*
*/

// -------------------------------------------------------------------------------------------------

// FATIGUE

[
    "tfs_fatigue_global_sounds",
    "CHECKBOX",
    [
        localize "str_TFS_Fatigue_CBA_Global_Sounds_Title",
        localize "str_TFS_Fatigue_CBA_Global_Sounds_Tip"
    ],
    [
        localize "str_TFS_Fatigue_CBA_Category",
        localize "str_TFS_Fatigue_CBA_Category_core"
    ],
    true,
    1,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------