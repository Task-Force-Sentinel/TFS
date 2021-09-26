class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// INTERACTIONS
	
	class Man;
	class CAManBase: Man {
		
		// exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
		
		class ACE_SelfActions {
			class ACE_Equipment {
				
				class TFS_Medical_Supplies_Action_FirstAid {
					displayName = "$STR_TFS_Medical_Supplies_Action_FirstAid";
					condition = "[_player] call TFS_medical_supplies_fnc_canUnpackFirstAid";
					statement = "[_player] call TFS_medical_supplies_fnc_doUnpackFirstAid";
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "\z\tfs\addons\medical\data\icons\medical_cross_ex_ca.paa";
					showDisabled = 0;
				};
				
				class TFS_Medical_Supplies_Action_MedicKit {
					displayName = "$STR_TFS_Medical_Supplies_Action_MedicKit";
					condition = "[_player] call TFS_medical_supplies_fnc_canUnpackMedicKit";
					statement = "[_player] call TFS_medical_supplies_fnc_doUnpackMedicKit";
					exceptions[] = {"isNotInside", "isNotSitting"};
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
		author = "$STR_TFS_Medical_Supplies_Author";
		displayName = "$STR_TFS_Item_Medical_FirstAid_DisplayName";
		editorPreview = "\z\tfs\addons\medical\supplies\data\previews\firstaid.jpg";
		vehicleClass = "Items";
		class TransportItems {
			MACRO_ADDITEM(TFS_FirstAid,1);
		};
	};
	
	class TFS_Item_MedicKit: Item_Base_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_TFS_Medical_Supplies_Author";
		displayName = "$STR_TFS_Item_Medical_MedicKit_DisplayName";
		editorPreview = "\z\tfs\addons\medical\supplies\data\previews\medickit.jpg";
		vehicleClass = "Items";
		class TransportItems {
			MACRO_ADDITEM(TFS_MediKit,1);
		};
	};
	
};
