class CBA_Extended_EventHandlers;
class CfgVehicles {
    
    // INTERACTIONS
    
    class Man;
    class CAManBase: Man {
        
        // exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
        
        class ACE_SelfActions {
            class ACE_Equipment {
                class TFS_Medical_Area_Action_Construct {
                    displayName = "$STR_TFS_Area_Action_Construct";
                    condition = "[_player] call TFS_medical_area_fnc_canConstruct";
                    statement = "[_player] call TFS_medical_area_fnc_doConstruct";
                    exceptions[] = {"isNotInside", "isNotSitting", "isNotSwimming"};
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
        author = "$STR_TFS_Area_Author";
        displayName = "$STR_TFS_Area_DisplayName";
        editorPreview = "\z\tfs\addons\medical\area\data\previews\medical_area.jpg";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(TFS_MedicArea,1);
        };
    };
    
};
