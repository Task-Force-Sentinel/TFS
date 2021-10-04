class CfgfactionClasses {
    class NO_CATEGORY;
    
    class TFS: NO_CATEGORY
    {
        displayname = PREFIX;
    };
    class PREFIX: NO_CATEGORY {
        displayname = "Task force Sentinel";
        // faction name in-game
        icon = logO_PATH;
        priority = 0;
        side = 1;
        // 1 blufor 2 opfor 3 independant i think.
    };
    class TFS_modules: NO_CATEGORY
    {
        displayname = PREFIX;
    };
};