class CfgFactionClasses {    
    class NO_CATEGORY;

    class TFS: NO_CATEGORY
    {
        displayName = PREFIX;
    };
    class PREFIX: NO_CATEGORY {
        displayName = "Task Force Sentinel"; //Faction name in-game
		icon = LOGO_PATH;
		priority = 0;
		side = 1; // 1 Blufor 2 opfor 3 independant i think.
    };
    class TFS_Modules: NO_CATEGORY
	{
		displayName = PREFIX;
	};
};