// TRIGGER SPEECH

class TFS_moduleTriggerSpeech: module_F {
    scope = 2;
    
    displayname = "$str_TFS_Modules_TriggerSpeech_Displayname";
    category = "Task force Sentinel";
    author = AUTHOR;
    icon = "\z\tfs\addons\modules\data\icons\module_speech_1_ca.paa";
    
    function = "TFS_fnc_moduleTriggerSpeech";
    functionpriority = 1;
    
    isGlobal = 0;
    istriggerActivated = 1;
    isDisposable = 0;
    is3DEN = 1;
    
    class Attributes: AttributesBase {
        class Enabled {
            displayname = "$str_TFS_Modules_Speech_Enabled_Title";
            tooltip = "$str_TFS_Modules_Speech_Enabled_Tip";
            defaultValue = 1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Enabled";
            control = "Combo";
            class Values {
                class Enabled_0 {
                    name = "$str_TFS_Modules_Speech_Enabled_0";
                    value = 0;
                };
                class Enabled_1 {
                    name = "$str_TFS_Modules_Speech_Enabled_1";
                    value = 1;
                };
            };
        };
        
        class Source {
            displayname = "$str_TFS_Modules_Speech_Source_Title";
            tooltip = "$str_TFS_Modules_Speech_Source_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Source";
            control = "Edit";
        };
        
        class Sound {
            displayname = "$str_TFS_Modules_Speech_classname_Title";
            tooltip = "$str_TFS_Modules_Speech_classname_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Sound";
            control = "Sound";
        };
        
        class distance {
            displayname = "$str_TFS_Modules_Speech_distance_Title";
            tooltip = "$str_TFS_Modules_Speech_distance_Tip";
            defaultValue = 30;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_distance";
            control = "EditShort";
        };
        
        class maxdistance {
            displayname = "$str_TFS_Modules_Speech_maxdistance_Title";
            tooltip = "$str_TFS_Modules_Speech_maxdistance_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_maxdistance";
            control = "EditShort";
        };
        
        class Duration {
            displayname = "$str_TFS_Modules_Speech_Duration_Title";
            tooltip = "$str_TFS_Modules_Speech_Duration_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Duration";
            control = "EditShort";
        };
        
        class Loop {
            displayname = "$str_TFS_Modules_Speech_Loop_Title";
            tooltip = "$str_TFS_Modules_Speech_Loop_Tip";
            defaultValue = "false";
            typeName = "BOOL";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Loop";
            control = "Checkbox";
        };
        
        class Ignorestop {
            displayname = "$str_TFS_Modules_Speech_Ignorestop_Title";
            tooltip = "$str_TFS_Modules_Speech_Ignorestop_Tip";
            defaultValue = "false";
            typeName = "BOOL";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleTriggerSpeech_Ignorestop";
            control = "Checkbox";
        };
        
        class Animation {
            displayname = "$str_TFS_Modules_Speech_Animation2_Title";
            tooltip = "$str_TFS_Modules_Speech_Animation2_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleGlobalSpeech_Animation";
            control = "Edit";
        };
        
        class moduleDescription: moduleDescription {
            property = "moduleinfo";
            control = "moduleinfo";
        };
    };
    
    class moduleDescription: moduleDescription {
        description = "$str_TFS_Modules_TriggerSpeech_Description";
    };
};