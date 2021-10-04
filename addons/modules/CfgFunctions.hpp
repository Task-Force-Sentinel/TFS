class CfgFunctions {
    class TFS_modules {
        tag = QUOTE(PREFIX);
        
        class modules {
            file = "z\tfs\addons\modules\functions";
            class initialize {};
            class initsettings {};
        };
    };
    
    class TFS_Functions {
        tag = "tfs";
        
        class modules_Sound {
            file = "z\tfs\addons\modules\functions\sound";
            class moduleAmbientSound {};
            class moduleTriggerSound {};
        };
        
        class modules_Speech {
            file = "z\tfs\addons\modules\functions\speech";
            class moduleGlobalSpeech {};
            class moduleGlobalSpeechMenu {};
            class moduleGlobalSpeechPlay {};
            class moduleTriggerSpeech {};
        };
    };
};