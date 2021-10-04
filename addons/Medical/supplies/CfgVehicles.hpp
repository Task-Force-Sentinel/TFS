class CBA_Extended_EventHandlers;
class Cfgvehicles {
    // inTERactionS
    
    class Man;
    class CAManBase: Man {
        // exceptions[] = {"isnotDead", "isnotUnconscious", "isnotSurrendering", "isnotHandcuffed", "isnotCarrying", "isnotDragging", "isnotEscorting", "isnotSwimming", "isnotRefueling", "isnotonLadder", "isnotSitting", "isnotinside", "isnotinZeus", "notonMap"};
        
        class ACE_Selfactions {
            class ACE_Equipment {
                class TFS_Medical_Supplies_action_FirstAid {
                    displayname = "$str_TFS_Supplies_action_FirstAid";
                    condition = "[_player] call TFS_medical_supplies_fnc_canUnpackFirstAid";
                    statement = "[_player] call TFS_medical_supplies_fnc_doUnpackFirstAid";
                    exceptions[] = {
                        "isnotinside", "isnotSitting"
                    };
                    icon = "\z\tfs\addons\medical\data\icons\medical_cross_ex_ca.paa";
                    showDisabled = 0;
                };
                
                class TFS_Medical_Supplies_action_MedicKit {
                    displayname = "$str_TFS_Supplies_action_MedicKit";
                    condition = "[_player] call TFS_medical_supplies_fnc_canUnpackMedicKit";
                    statement = "[_player] call TFS_medical_supplies_fnc_doUnpackMedicKit";
                    exceptions[] = {
                        "isnotinside", "isnotSitting"
                    };
                    icon = "\z\tfs\addons\medical\data\icons\medical_cross_ex_ca.paa";
                    showDisabled = 0;
                };
            };
        };
    };
    
    // MEDICAL SUPPLIES
    
    class Item_Base_F;
    
    class TFS_Item_FirstAid: Item_Base_F {
        scope = 2;
        scopeArsenal = 2;
        scopeCurator = 2;
        author = "$str_TFS_Supplies_Author";
        displayname = "$str_TFS_Supplies_Displayname";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\firstaid.jpg";
        vehicleClass = "items";
        class Transportitems {
            MACRO_addItem(TFS_FirstAid, 1);
        };
    };
    
    class TFS_Item_MedicKit: Item_Base_F {
        scope = 2;
        scopeArsenal = 2;
        scopeCurator = 2;
        author = "$str_TFS_Supplies_Author";
        displayname = "$str_TFS_Supplies_MedicKitDisplayName";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\medickit.jpg";
        vehicleClass = "items";
        class Transportitems {
            MACRO_addItem(TFS_MediKit, 1);
        };
    };
};