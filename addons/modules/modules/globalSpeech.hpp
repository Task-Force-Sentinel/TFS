// GLOBAL SPEECH

class TFS_moduleGlobalSpeech: module_F {
    scope = 2;
    
    displayname = "$str_TFS_Modules_GlobalSpeech_Displayname";
    category = "Task force Sentinel";
    author = AUTHor;
    icon = "\z\tfs\addons\modules\data\icons\module_speech_0_ca.paa";
    
    function = "TFS_fnc_moduleGlobalSpeech";
    functionpriority = 1;
    
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    
    class Attributes: AttributesBase {
        class Enabled {
            displayname = "$str_TFS_Modules_Speech_Enabled_Title";
            tooltip = "$str_TFS_Modules_Speech_Enabled_Tip";
            defaultValue = 1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Enabled";
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
            typeName = "strinG";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Source";
            control = "Edit";
        };
        
        class Sound {
            displayname = "$str_TFS_Modules_Speech_classname_Title";
            tooltip = "$str_TFS_Modules_Speech_classname_Tip";
            defaultValue = "''";
            typeName = "strinG";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Sound";
            control = "Sound";
        };
        
        class distance {
            displayname = "$str_TFS_Modules_Speech_distance_Title";
            tooltip = "$str_TFS_Modules_Speech_distance_Tip";
            defaultValue = 30;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_distance";
            control = "EditShort";
        };
        
        class maxdistance {
            displayname = "$str_TFS_Modules_Speech_maxdistance_Title";
            tooltip = "$str_TFS_Modules_Speech_maxdistance_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_maxdistance";
            control = "EditShort";
        };
        
        class Duration {
            displayname = "$str_TFS_Modules_Speech_Duration_Title";
            tooltip = "$str_TFS_Modules_Speech_Duration_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Duration";
            control = "EditShort";
        };
        
        class OnlyOnce {
            displayname = "$str_TFS_Modules_Speech_OnlyOnce_Title";
            tooltip = "$str_TFS_Modules_Speech_OnlyOnce_Tip";
            defaultValue = "false";
            typeName = "BOOL";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_OnlyOnce";
            control = "Checkbox";
        };
        
        class Reaction {
            displayname = "$str_TFS_Modules_Speech_Reaction_Title";
            tooltip = "$str_TFS_Modules_Speech_Reaction_Tip";
            defaultValue = 0;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Reaction";
            control = "Combo";
            class Values {
                class Reaction_0 {
                    name = "$str_TFS_Modules_Speech_Reaction_0";
                    value = 0;
                };
                class Reaction_1 {
                    name = "$str_TFS_Modules_Speech_Reaction_1";
                    value = 1;
                };
                class Reaction_2 {
                    name = "$str_TFS_Modules_Speech_Reaction_2";
                    value = 2;
                };
                class Reaction_3 {
                    name = "$str_TFS_Modules_Speech_Reaction_3";
                    value = 3;
                };
            };
        };
        
        class Animation {
            displayname = "$str_TFS_Modules_Speech_Animation_Title";
            tooltip = "$str_TFS_Modules_Speech_Animation_Tip";
            defaultValue = "''";
            typeName = "strinG";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_Animation";
            control = "Edit";
        };
        
        class CodeStart {
            displayname = "$str_TFS_Modules_Speech_CodeStart_Title";
            tooltip = "$str_TFS_Modules_Speech_CodeStart_Tip";
            defaultValue = "''";
            typeName = "strinG";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_CodeStart";
            control = "EditCodeMulti3";
        };
        
        class CodeEnd {
            displayname = "$str_TFS_Modules_Speech_CodeEnd_Title";
            tooltip = "$str_TFS_Modules_Speech_CodeEnd_Tip";
            defaultValue = "''";
            typeName = "strinG";
            expression = "_this setVariable ['%s', _value, true];
            ";
            property = "TFS_moduleGlobalSpeech_CodeEnd";
            control = "EditCodeMulti3";
        };
        
        class moduleDescription: moduleDescription {
            property = "moduleinfo";
            control = "moduleinfo";
        };
    };
    
    class moduleDescription: moduleDescription {
        description = "$str_TFS_Modules_GlobalSpeech_Description";
    };
};