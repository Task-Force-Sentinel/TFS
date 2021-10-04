// AMBIENT SOUND

class TFS_moduleAmbientSound: module_F {
    scope = 2;
    
    displayname = "$str_TFS_Modules_AmbientSound_Displayname";
    category = "Task force Sentinel";
    author = AUTHOR;
    icon = "\z\tfs\addons\modules\data\icons\module_sound_0_ca.paa";
    
    function = "TFS_fnc_moduleAmbientSound";
    functionpriority = 1;
    
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    
    class Attributes: AttributesBase {
        class Enabled {
            displayname = "$str_TFS_Modules_Sound_Enabled_Title";
            tooltip = "$str_TFS_Modules_Sound_Enabled_Tip";
            defaultValue = 1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_Enabled";
            control = "Combo";
            class Values {
                class Enabled_0 {
                    name = "$str_TFS_Modules_Sound_Enabled_0";
                    value = 0;
                };
                class Enabled_1 {
                    name = "$str_TFS_Modules_Sound_Enabled_1";
                    value = 1;
                };
            };
        };
        
        class Source {
            displayname = "$str_TFS_Modules_Sound_Source_Title";
            tooltip = "$str_TFS_Modules_Sound_Source_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_Source";
            control = "Edit";
        };
        
        class Sound {
            displayname = "$str_TFS_Modules_Sound_classname_Title";
            tooltip = "$str_TFS_Modules_Sound_classname_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_Sound";
            control = "Sound";
        };
        
        class Offset {
            displayname = "$str_TFS_Modules_Sound_Offset_Title";
            tooltip = "$str_TFS_Modules_Sound_Offset_Tip";
            defaultValue = "'[0, 0, 0]'";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_Offset";
            control = "EditShort";
        };
        
        class distance {
            displayname = "$str_TFS_Modules_Sound_distance_Title";
            tooltip = "$str_TFS_Modules_Sound_distance_Tip";
            defaultValue = 100;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_distance";
            control = "EditShort";
        };
        
        class maxdistance {
            displayname = "$str_TFS_Modules_Sound_maxdistance_Title";
            tooltip = "$str_TFS_Modules_Sound_maxdistance_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_maxdistance";
            control = "EditShort";
        };
        
        class Duration {
            displayname = "$str_TFS_Modules_Sound_Duration_Title";
            tooltip = "$str_TFS_Modules_Sound_Duration_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];            ";
            property = "TFS_moduleAmbientSound_Duration";
            control = "EditShort";
        };
        
        class moduleDescription: moduleDescription {
            property = "moduleinfo";
            control = "moduleinfo";
        };
    };
    
    class moduleDescription: moduleDescription {
        description = "$str_TFS_Modules_AmbientSound_Description";
    };
};