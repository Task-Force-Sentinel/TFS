class CfgFunctions {
    class TFS_hints {
        tag = "tfs_hints";
        
        class hints {
            file = "\z\tfs\addons\hints\functions";
            class cleanup {};
            class initialize {};
            class initsettings {};
        };
    };
    
    class TFS_hints_Functions {
        tag = "tfs";
        
        class hints {
            file = "\z\tfs\addons\hints\functions";
            class hint {};
            class hintglobal {};
        };
    };
    
    class TFS_hints_ACE {
        tag = "ace_common";
        
        class ace_common {
            file = "\z\tfs\addons\hints\functions\ace_common";
            class displayIcon {};
            class displayIconEx {
                file = "\z\ace\addons\common\functions\fnc_displayIcon.sqf";
            };
            class displaytext {};
            class displaytextEx {
                file = "\z\ace\addons\common\functions\fnc_displaytext.sqf";
            };
            class displaytextpicture {};
            class displaytextpictureEx {
                file = "\z\ace\addons\common\functions\fnc_displaytextpicture.sqf";
            };
            class displaytextstructured {};
            class displaytextstructuredEx {
                file = "\z\ace\addons\common\functions\fnc_displaytextstructured.sqf";
            };
            class stringtoColoredtext {};
        };
    };
    
    class TFS_hints_CBA {
        tag = "cba";
        
        class cba_ui {
            file = "z\tfs\addons\hints\functions\cba_ui";
            class notify {};
            class notifyEx {
                recompile = 1;
                file = "\x\cba\addons\ui\fnc_notify.sqf";
            };
        };
    };
};