class CBA_Extended_EventHandlers;
class CfgVehicles {
	
	// INTERACTIONS
	
	class Man;
	class CAManBase: Man {
		
		// exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
		
		class ACE_SelfActions {
			class ACE_Equipment {
				
				class TFSRHS_Medical_Supplies_Action_FirstAid {
					displayName = "$STR_TFSRHS_Medical_Supplies_Action_FirstAid";
					condition = "[_player] call TFSRHS_medical_supplies_fnc_canUnpackFirstAid";
					statement = "[_player] call TFSRHS_medical_supplies_fnc_doUnpackFirstAid";
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "\z\tfsrhs\addons\medical\data\icons\medical_cross_ex_ca.paa";
					showDisabled = 0;
				};
				
				class TFSRHS_Medical_Supplies_Action_MedicKit {
					displayName = "$STR_TFSRHS_Medical_Supplies_Action_MedicKit";
					condition = "[_player] call TFSRHS_medical_supplies_fnc_canUnpackMedicKit";
					statement = "[_player] call TFSRHS_medical_supplies_fnc_doUnpackMedicKit";
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "\z\tfsrhs\addons\medical\data\icons\medical_cross_ex_ca.paa";
					showDisabled = 0;
				};
				
			};
		};
		
	};
	
	// MEDICAL SUPPLIES
	
	class Item_Base_F;
	
	class TFSRHS_Item_FirstAid: Item_Base_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_TFSRHS_Medical_Supplies_Author";
		displayName = "$STR_TFSRHS_Item_Medical_FirstAid_DisplayName";
		editorPreview = "\z\tfsrhs\addons\medical\supplies\data\previews\firstaid.jpg";
		vehicleClass = "Items";
		class TransportItems {
			MACRO_ADDITEM(TFSRHS_FirstAid,1);
		};
	};
	
	class TFSRHS_Item_MedicKit: Item_Base_F {
		scope = 2;
		scopeArsenal = 2;
		scopeCurator = 2;
		author = "$STR_TFSRHS_Medical_Supplies_Author";
		displayName = "$STR_TFSRHS_Item_Medical_MedicKit_DisplayName";
		editorPreview = "\z\tfsrhs\addons\medical\supplies\data\previews\medickit.jpg";
		vehicleClass = "Items";
		class TransportItems {
			MACRO_ADDITEM(TFSRHS_MediKit,1);
		};
	};
	
};
