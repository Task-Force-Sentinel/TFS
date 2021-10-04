class CfgFunctions {
    
    class TFS_Fatigue {
        
        tag = "tfs_fatigue";
        
        class Recline {
            file = "z\tfs\addons\fatigue\functions";
            class initialize {};
            class initSettings {};
        };
        
    };
    
    class TFS_Fatigue_ACE {
        
        tag = "ace_advanced_fatigue";
        
        class ace_advanced_fatigue {
            file = "z\tfs\addons\fatigue\functions\ace_advanced_fatigue";
            class handleEffects {};
        };
        
    };
    
};
