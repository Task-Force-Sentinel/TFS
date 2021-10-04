class CfgfactionClasses {
    class NO_CATEGorY;
    
    class TFS: NO_CATEGorY
    {
        displayname = PREFIX;
    };
    class PREFIX: NO_CATEGorY {
        displayname = "Task force Sentinel";
        // faction name in-game
        icon = logO_PATH;
        priority = 0;
        side = 1;
        // 1 blufor 2 opfor 3 independant i think.
    };
    class TFS_modules: NO_CATEGorY
    {
        displayname = PREFIX;
    };
};