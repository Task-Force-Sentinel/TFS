class CfgFunctions {

    class TFS_Gear {

        tag = "TFS_gear";

        class Gear {
            file = "\z\tfs\addons\gear\functions";
            class initialize {};
            class initSettings {};
        };

        class Common {
            file = "\z\tfs\addons\gear\functions\common";
            class initPlayer {};
            class removeAll {};
            class restore {};
            class set {};
            class store {};
        };

        class Load {
            file = "\z\tfs\addons\gear\functions\load";
            class load {};
            class load_loadout {};
            class load_properties {};
        };

    };

};
