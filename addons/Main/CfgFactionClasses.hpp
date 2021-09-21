class CfgFactionClasses {    
    class NO_CATEGORY;

    class TFSRHS: NO_CATEGORY
    {
        displayName = PREFIX;
    };
    class PREFIX: NO_CATEGORY {
        displayName = PREFIX;
    };
    class TFSRHS_Modules: NO_CATEGORY
	{
		displayName = PREFIX;
	};
    class tfsrhs: NO_CATEGORY {
        displayName = PREFIX;
        priority = 2;
        side = 7;
    };
    class TFSRHS_Faction: NO_CATEGORY {
		displayName = PREFIX; //Faction name in-game
		icon = LOGO_PATH;
		priority = 0;
		side = 1; // 1 Blufor 2 opfor 3 independant i think.
	};
	class CLASS(IND) {
        displayName = PREFIX;
        icon = LOGO_PATH;
        side = 2;
        priority = 2;
    };
};