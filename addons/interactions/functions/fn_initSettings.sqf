/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\interactions\functions\fn_initsettings.sqf
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
*	[] call TFS_interactions_fnc_initsettings;
*
*/

// -------------------------------------------------------------------------------------------------

// core

[
    "tfs_interactions_global_sounds",
    "CHECKBOX",
    [
        localize "str_TFS_interactions_CBA_Global_Sounds_Title",
        localize "str_TFS_interactions_CBA_Global_Sounds_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_core"
    ],
    true,
    1,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

// TAPSHOULDER

[
    "tfs_interactions_tapshoulder_ai",
    "CHECKBOX",
    [
        localize "str_TFS_interactions_CBA_TapShoulder_AI_Title",
        localize "str_TFS_interactions_CBA_TapShoulder_AI_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_TapShoulder"
    ],
    false,
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_interactions_tapshoulder_hint",
    "CHECKBOX",
    [
        localize "str_TFS_interactions_CBA_TapShoulder_hint_Title",
        localize "str_TFS_interactions_CBA_TapShoulder_hint_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_TapShoulder"
    ],
    true,
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------
// ACCESS backpack

[
    "tfs_interactions_backpack_access_faction",
    "list",
    [
        localize "str_TFS_interactions_CBA_backpack_Access_faction_Title",
        localize "str_TFS_interactions_CBA_backpack_Access_faction_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_backpacks"
    ],
    [
        [0, 1, 2],
        [
            "str_TFS_interactions_CBA_backpack_Access_faction_0",
            "str_TFS_interactions_CBA_backpack_Access_faction_1",
            "str_TFS_interactions_CBA_backpack_Access_faction_2"
        ],
        2
    ],
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_interactions_backpack_access_friendly",
    "list",
    [
        localize "str_TFS_interactions_CBA_backpack_Access_Friendly_Title",
        localize "str_TFS_interactions_CBA_backpack_Access_Friendly_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_backpacks"
    ],
    [
        [0, 1],
        [
            "str_TFS_interactions_CBA_backpack_Access_Friendly_0",
            "str_TFS_interactions_CBA_backpack_Access_Friendly_1"
        ],
        1
    ],
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_interactions_backpack_access_enemy",
    "list",
    [
        localize "str_TFS_interactions_CBA_backpack_Access_Enemy_Title",
        localize "str_TFS_interactions_CBA_backpack_Access_Enemy_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_backpacks"
    ],
    [
        [0, 1],
        [
            "str_TFS_interactions_CBA_backpack_Access_Enemy_0",
            "str_TFS_interactions_CBA_backpack_Access_Enemy_1"
        ],
        0
    ],
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_interactions_backpack_access_hint",
    "CHECKBOX",
    [
        localize "str_TFS_interactions_CBA_backpack_Access_hint_Title",
        localize "str_TFS_interactions_CBA_backpack_Access_hint_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_backpacks"
    ],
    true,
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

// ACCESS GEAR

[
    "tfs_interactions_gear_access_enabled",
    "list",
    [
        localize "str_TFS_interactions_CBA_Gear_Access_Enabled_Title",
        localize "str_TFS_interactions_CBA_Gear_Access_Enabled_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_Gear"
    ],
    [
        [0, 1],
        [
            "str_TFS_interactions_CBA_Gear_Access_Enabled_0",
            "str_TFS_interactions_CBA_Gear_Access_Enabled_1"
        ],
        1
    ],
    1,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_interactions_gear_access_hint",
    "CHECKBOX",
    [
        localize "str_TFS_interactions_CBA_Gear_Access_hint_Title",
        localize "str_TFS_interactions_CBA_Gear_Access_hint_Tip"
    ],
    [
        localize "str_TFS_interactions_CBA_Category",
        localize "str_TFS_interactions_CBA_Category_Gear"
    ],
    true,
    0,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------