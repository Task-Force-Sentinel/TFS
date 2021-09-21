// Creator Actions
[
    "TFSRHS_CreatorActions_Master",
    "CHECKBOX",
    ["Enable Creator Actions", "Show/Hide Creator Actions in ACE Self Interaction Menu"],
    "TFSRHS Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {call TFSRHS_fnc_InitCreatorActions};
    }
] call CBA_Settings_fnc_init;

[
    "TFSRHS_CreatorActions_Channels",
    "CHECKBOX",
    ["Enable Channel Actions", "Add Creator Actions to enable/disable channels"],
    "TFSRHS Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {call TFSRHS_fnc_InitChannelActions};
    }
] call CBA_Settings_fnc_init;

/*
[
    "TFSRHS_CreatorActions_MarkerSaving",
    "CHECKBOX",
    ["Enable SaveMarkers", "Add Creator Actions to save/load markers"],
    "TFSRHS Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {
			[
				"SaveMarkers",
				"Save/Load Markers",
				"",
				{[] call TFSRHS_MI_fnc_openDialog;},
				{TFSRHS_Main_MapIcons}
			] call TFSRHS_fnc_addCreatorAction;
		};
    }
] call CBA_Settings_fnc_init;
*/ // broken as fuck, crashes the game...

[
    "TFSRHS_CreatorActions_EndMission",
    "CHECKBOX",
    ["Enable EndMission", "Add Creator Actions to end the mission and return players to the lobby"],
    "TFSRHS Creator Actions",
    true,
    true,
    {
		if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
        if (_this && { hasinterface }) then  {
			[
				"EndMissionSuccess",
				"<t color='#00ff00'>Mission Success</t>",
				"",
				{["EveryoneWins"] remoteExec ["BIS_fnc_endMissionServer", 2]},
				{true}
			] call TFSRHS_fnc_addCreatorAction;

			[
				"EndMissionFail",
				"<t color='#ff0000'>Mission Failure</t>",
				"",
				{["EveryoneLost"] remoteExec ["BIS_fnc_endMissionServer", 2]},
				{true}
			] call TFSRHS_fnc_addCreatorAction;
		};
    }
] call CBA_Settings_fnc_init;