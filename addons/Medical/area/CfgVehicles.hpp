class CBA_Extended_EventHandlers;
class CfgVehicles {
    // inTERactionS
    
    class Man;
    class CAManBase: Man {
        // exceptions[] = {"isnotDead", "isnotUnconscious", "isnotSurrendering", "isnotHandcuffed", "isnotCarrying", "isnotDragging", "isnotEscorting", "isnotSwimming", "isnotRefueling", "isnotonLadder", "isnotSitting", "isnotinside", "isnotinZeus", "notonMap"};
        
        class ACE_Selfactions {
            class ACE_Equipment {
                class TFS_Medical_Area_action_Construct {
                    displayname = "$str_TFS_Area_action_Construct";
                    condition = "[_player] call TFS_medical_area_fnc_canConstruct";
                    statement = "[_player] call TFS_medical_area_fnc_doConstruct";
                    exceptions[] = {
                        "isnotinside", "isnotSitting", "isnotSwimming"
                    };
                    icon = "\z\tfs\addons\medical\data\icons\medical_cross_ca.paa";
                    showDisabled = 0;
                };
            };
        };
    };
    
    // MEDICAL AREA
    
    class Item_Base_F;
    class TFS_Item_MedicArea: Item_Base_F {
        scope = 2;
        scopeArsenal = 2;
        scopeCurator = 2;
        author = "$str_TFS_Area_Author";
        displayname = "$str_TFS_Area_Displayname";
        editorPreview = "\z\tfs\addons\medical\area\data\previews\medical_area.jpg";
        vehicleClass = "items";
        class Transportitems {
            MACRO_ADDITEM(TFS_MedicArea, 1);
        };
    };
};