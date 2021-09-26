/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfs\addons\interactions\functions\fn_initSettings.sqf
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
 *	[] call TFS_interactions_fnc_initSettings;
 *
 */

// -------------------------------------------------------------------------------------------------

// core

[
	"tfs_interactions_global_sounds",
	"CHECKBOX",
	[
		localize "STR_TFS_Interactions_CBA_Global_Sounds_Title", 
		localize "STR_TFS_Interactions_CBA_Global_Sounds_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_core"
	],
	true,
	1,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

// TAPSHOULDER

[
	"tfs_interactions_tapshoulder_ai",
	"CHECKBOX",
	[
		localize "STR_TFS_Interactions_CBA_TapShoulder_AI_Title",
		localize "STR_TFS_Interactions_CBA_TapShoulder_AI_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category",
		localize "STR_TFS_Interactions_CBA_Category_TapShoulder"
	],
	false,
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfs_interactions_tapshoulder_hint",
	"CHECKBOX",
	[
		localize "STR_TFS_Interactions_CBA_TapShoulder_Hint_Title",
		localize "STR_TFS_Interactions_CBA_TapShoulder_Hint_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category",
		localize "STR_TFS_Interactions_CBA_Category_TapShoulder"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
// ACCESS BACKPACK

[
	"tfs_interactions_backpack_access_faction",
	"LIST",
	[
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Faction_Title", 
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Faction_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_Backpacks"
	],
	[
		[0,1,2], 
		[
			"STR_TFS_Interactions_CBA_Backpack_Access_Faction_0", 
			"STR_TFS_Interactions_CBA_Backpack_Access_Faction_1", 
			"STR_TFS_Interactions_CBA_Backpack_Access_Faction_2"
		], 
		2
	],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfs_interactions_backpack_access_friendly",
	"LIST",
	[
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Friendly_Title", 
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Friendly_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_Backpacks"
	],
	[
		[0,1], 
		[
			"STR_TFS_Interactions_CBA_Backpack_Access_Friendly_0", 
			"STR_TFS_Interactions_CBA_Backpack_Access_Friendly_1"
		], 
		1
	],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfs_interactions_backpack_access_enemy",
	"LIST",
	[
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Enemy_Title", 
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Enemy_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_Backpacks"
	],
	[
		[0,1], 
		[
			"STR_TFS_Interactions_CBA_Backpack_Access_Enemy_0", 
			"STR_TFS_Interactions_CBA_Backpack_Access_Enemy_1"
		], 
		0
	],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfs_interactions_backpack_access_hint",
	"CHECKBOX",
	[
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Hint_Title", 
		localize "STR_TFS_Interactions_CBA_Backpack_Access_Hint_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_Backpacks"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

// ACCESS GEAR

[
	"tfs_interactions_gear_access_enabled",
	"LIST",
	[
		localize "STR_TFS_Interactions_CBA_Gear_Access_Enabled_Title", 
		localize "STR_TFS_Interactions_CBA_Gear_Access_Enabled_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category",
		localize "STR_TFS_Interactions_CBA_Category_Gear"
	],
	[
		[0,1], 
		[
			"STR_TFS_Interactions_CBA_Gear_Access_Enabled_0", 
			"STR_TFS_Interactions_CBA_Gear_Access_Enabled_1"
		], 
		1
	],
	1,
	{}
] call CBA_Settings_fnc_init;

[
	"tfs_interactions_gear_access_hint",
	"CHECKBOX",
	[
		localize "STR_TFS_Interactions_CBA_Gear_Access_Hint_Title", 
		localize "STR_TFS_Interactions_CBA_Gear_Access_Hint_Tip"
	],
	[
		localize "STR_TFS_Interactions_CBA_Category", 
		localize "STR_TFS_Interactions_CBA_Category_Gear"
	],
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
