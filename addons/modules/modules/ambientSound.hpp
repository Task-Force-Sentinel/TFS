// AMBIENT SOUND

class TFS_ModuleAmbientSound: Module_F {
    
    scope = 2;
    
    displayName = "$STR_TFS_Modules_AmbientSound_DisplayName";
    category = "Task Force Sentinel";
    author = AUTHOR;
    icon = "\z\tfs\addons\modules\data\icons\module_sound_0_ca.paa";
    


    function = "TFS_fnc_moduleAmbientSound";
    functionPriority = 1;
    
    isGlobal = 0;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    
    class Attributes: AttributesBase {
        
        class Enabled {
            displayName = "$STR_TFS_Modules_Property_Sound_Enabled_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Enabled_Tip";
            defaultValue = 1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Enabled";
            control = "Combo";
            class Values {
                class Enabled_0 {
                    name = "$STR_TFS_Modules_Property_Sound_Enabled_0";
                    value = 0;
                };
                class Enabled_1 {
                    name = "$STR_TFS_Modules_Property_Sound_Enabled_1";
                    value = 1;
                };
            };
        };
        
        class Source {
            displayName = "$STR_TFS_Modules_Property_Sound_Source_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Source_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Source";
            control = "Edit";
        };
        
        class Sound {
            displayName = "$STR_TFS_Modules_Property_Sound_Classname_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Classname_Tip";
            defaultValue = "''";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Sound";
            control = "Sound";
        };
        
        class Offset {
            displayName = "$STR_TFS_Modules_Property_Sound_Offset_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Offset_Tip";
            defaultValue = "'[0,0,0]'";
            typeName = "STRING";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Offset";
            control = "EditShort";
        };
        
        class Distance {
            displayName = "$STR_TFS_Modules_Property_Sound_Distance_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Distance_Tip";
            defaultValue = 100;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Distance";
            control = "EditShort";
        };
        
        class MaxDistance {
            displayName = "$STR_TFS_Modules_Property_Sound_MaxDistance_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_MaxDistance_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_MaxDistance";
            control = "EditShort";
        };
        
        class Duration {
            displayName = "$STR_TFS_Modules_Property_Sound_Duration_Title";
            tooltip = "$STR_TFS_Modules_Property_Sound_Duration_Tip";
            defaultValue = -1;
            typeName = "NUMBER";
            expression = "_this setVariable ['%s', _value, true];";
            property = "TFS_ModuleAmbientSound_Duration";
            control = "EditShort";
        };
        
        class ModuleDescription: ModuleDescription {
            property = "ModuleInfo";
            control = "ModuleInfo";
        };
        
    };
    
    class ModuleDescription: ModuleDescription {
        description = "$STR_TFS_Modules_AmbientSound_Description";
    };
    
};
