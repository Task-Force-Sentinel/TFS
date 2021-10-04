/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\hints\functions\fn_initsettings.sqf
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
*	[] call TFS_hints_fnc_initsettings;
*
*/

// -------------------------------------------------------------------------------------------------

// EXTENDED hintS

[
    "tfs_hint_position",
    "list",
    [
        localize "str_TFS_hints_CBA_position_Title",
        localize "str_TFS_hints_CBA_position_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_core"
    ],
    [
        [0, 1, 2, 3],
        [
            "str_TFS_hints_CBA_position_0",
            "str_TFS_hints_CBA_position_1",
            "str_TFS_hints_CBA_position_2",
            "str_TFS_hints_CBA_position_3"
        ],
        3
    ],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_duration",
    "SLIDER",
    [
        localize "str_TFS_hints_CBA_Duration_Title",
        localize "str_TFS_hints_CBA_Duration_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_core"
    ],
    [5, 30, 15, 0],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_queue_size",
    "SLIDER",
    [
        localize "str_TFS_hints_CBA_Queue_size_Title",
        localize "str_TFS_hints_CBA_Queue_size_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_core"
    ],
    [0, 9, 3, 0],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_queue_alpha",
    "SLIDER",
    [
        localize "str_TFS_hints_CBA_Queue_Alpha_Title",
        localize "str_TFS_hints_CBA_Queue_Alpha_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_core"
    ],
    [0.0, 0.8, 0.4, 2],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_sound",
    "list",
    [
        localize "str_TFS_hints_CBA_Sound_Title",
        localize "str_TFS_hints_CBA_Sound_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_core"
    ],
    [
        [0, 1, 2, 3, 4],
        [
            "str_TFS_hints_CBA_Sound_0",
            "str_TFS_hints_CBA_Sound_1",
            "str_TFS_hints_CBA_Sound_2",
            "str_TFS_hints_CBA_Sound_3",
            "str_TFS_hints_CBA_Sound_4"
        ],
        1
    ],
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
    "tfs_hint_color_background",
    "COLor",
    [
        localize "str_TFS_hints_CBA_Color_Background_Title",
        localize "str_TFS_hints_CBA_Color_Background_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Colors"
    ],
    [0.000, 0.000, 0.000, 0.5],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_color_default",
    "COLor",
    [
        localize "str_TFS_hints_CBA_Color_default_Title",
        localize "str_TFS_hints_CBA_Color_default_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Colors"
    ],
    [0.000, 0.824, 0.000, 1],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_color_info",
    "COLor",
    [
        localize "str_TFS_hints_CBA_Color_info_Title",
        localize "str_TFS_hints_CBA_Color_info_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Colors"
    ],
    [0.824, 0.824, 0.000, 1],
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_color_alert",
    "COLor",
    [
        localize "str_TFS_hints_CBA_Color_Alert_Title",
        localize "str_TFS_hints_CBA_Color_Alert_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Colors"
    ],
    [0.824, 0.000, 0.000, 1],
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
    "tfs_hint_option_ace",
    "CHECKBOX",
    [
        localize "str_TFS_hints_CBA_Option_ACE_Title",
        localize "str_TFS_hints_CBA_Option_ACE_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Options"
    ],
    true,
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_hint_option_cba",
    "CHECKBOX",
    [
        localize "str_TFS_hints_CBA_Option_CBA_Title",
        localize "str_TFS_hints_CBA_Option_CBA_Tip"
    ],
    [
        localize "str_TFS_hints_CBA_Category",
        localize "str_TFS_hints_CBA_Category_Options"
    ],
    true,
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------