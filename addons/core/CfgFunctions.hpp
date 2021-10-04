class CfgFunctions {
    class TFS_core {
        tag = "tfs_core";
        
        class core {
            file = "z\tfs\addons\core\functions";
            class initialize {};
            class initsettings {};
        };
    };
    
    class TFS_Functions {
        tag = "tfs";
        
        class Addons {
            file = "z\tfs\addons\core\functions\addons";
            class getAddonAuthor {};
            class getAddonAuthors {};
            class getAddonname {};
            class getAddonRequiredAddons {};
            class getAddonrequiredVersion {};
            class getAddonunits {};
            class getAddonURL {};
            class getAddonVersion {};
            class getAddonVersionArray {};
            class getAddonVersionstring {};
            class getAddonweapons {};
            class isAddon {};
        };
        
        class core {
            file = "z\tfs\addons\core\functions\common";
            class addItem {};
            class attachtorel {};
            class createLitter {};
            class createLitterServer {};
            class getUnitinsignia {};
            class isadmin {};
            class isCurator {};
            class isinBuilding {};
            class screenshot {};
            class setUnitinsignia {};
        };
        
        class Diagnostic {
            file = "z\tfs\addons\core\functions\diagnostics";
            class diaglog {};
            class diaglogGlobal {};
            class diaglogServer {};
            class isDebug {};
            class log {};
            class logGlobal {};
            class logServer {};
        };
        
        class settings {
            file = "z\tfs\addons\core\functions\settings";
            class getKeybindstring {};
            class needRestart {};
            class needRestartlocal {};
        };
        
        class Sounds {
            file = "z\tfs\addons\core\functions\sounds";
            class decibeltoGain {};
            class gaintoDecibel {};
            class getSounddistance {};
            class getSoundDuration {};
            class getSoundFile {};
            class getSoundpitch {};
            class getsoundVolume {};
            class isSpeaking {};
            class loop3dSound {};
            class loop3dSoundlocal {};
            class play3dSound {};
            class play3dSoundlocal {};
            class playSound {};
            class playSoundlocal {};
            class playSound3D {};
            class say3D {};
            class say3Dlocal {};
            class speak3d {};
            class speak3dlocal {};
            class stop3dSound {};
            class stop3dSoundlocal {};
        };
        
        class Videos {
            file = "z\tfs\addons\core\functions\videos";
            class playVideo {};
            class playVideoOnce {};
            class videoKeydown {};
        };
    };
};