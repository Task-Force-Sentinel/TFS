class TFSRHS_ModuleAISpawnsWest: Module_F
{
	scope = 2;
	displayName = "AI Spawn - West";
	icon = "\z\tfsrhs\addons\media\images\icons\AI WEST.paa";
	category = "Task Force Sentinel";
	function = "TFSRHS_fnc_moduleAISpawns";
	functionPriority = 2;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class ObjName: Edit
  			{
				property = "TFSRHS_AI_ObjName";
				displayName = "Objective Name";
				tooltip = "Name of Objective/Spawn Position.";
				defaultValue = """Objective 1""";
			};
		class EnemyType: Combo
  			{
				property = "TFSRHS_AI_EnemyType";
				displayName = "Enemy Faction";
				tooltip = "Enemy Faction Type for this Module.";
				defaultValue = """BLU_F""";
				class values
				{
					class BLU_F 							{name = "Vanilla - NATO"; 										value = "BLU_F";};
					class BLU_T_F							{name = "Vanilla - NATO (Pacific)"; 							value = "BLU_T_F";};
					class CFP_B_AFARMY 						{name = "@CFP - Afghan Army";									value = "CFP_B_AFARMY";};
					class CFP_B_AFGPOLICE 					{name = "@CFP - Afghan Police";									value = "CFP_B_AFGPOLICE";};
					class CFP_B_CAF 						{name = "@CFP - Chadian Armed Forces";							value = "CFP_B_CAF";};
					class CFP_B_CDF_SNW 					{name = "@CFP - Chernarus Defense Forces [Winter]";				value = "CFP_B_CDF_SNW";};
					class CFP_B_ILIDF 						{name = "@CFP - Israeli Defense Force";							value = "CFP_B_ILIDF";};
					class CFP_B_IQARMY 						{name = "@CFP - Iraqi Army";									value = "CFP_B_IQARMY";};
					class CFP_B_IQPOLICE 					{name = "@CFP - Iraqi Police";									value = "CFP_B_IQPOLICE";};
					class CFP_B_KEARMY 						{name = "@CFP - Kenyan Defense Force";							value = "CFP_B_KEARMY";};
					class CFP_B_MLARMY 						{name = "@CFP - Malian Government Forces";						value = "CFP_B_MLARMY";};
					class CFP_B_NAARMY 						{name = "@CFP - Nigerian Army";									value = "CFP_B_NAARMY";};
					class CFP_B_PESH 						{name = "@CFP - Peshmerga";										value = "CFP_B_PESH";};
					class CFP_B_UGARMY 						{name = "@CFP - Uganda People's Defense Force";					value = "CFP_B_UGARMY";};
					class CFP_B_USARMY_1991_DES 			{name = "@CFP - US Army 1991 [Arid/Desert]";					value = "CFP_B_USARMY_1991_DES";};
					class CFP_B_USARMY_1991_WDL 			{name = "@CFP - US Army 1991 [Woodland]";						value = "CFP_B_USARMY_1991_WDL";};
					class CFP_B_USARMY_2003_DES 			{name = "@CFP - US Army 2003 [Arid/Desert]";					value = "CFP_B_USARMY_2003_DES";};
					class CFP_B_USARMY_2003_WDL 			{name = "@CFP - US Army 2003 [Woodland]";						value = "CFP_B_USARMY_2003_WDL";};
					class CFP_B_USCIA						{name = "@CFP - US CIA (Middle East)";							value = "CFP_B_USCIA";};
					class CFP_B_USRANGERS_WDL 				{name = "@CFP - US 75th Rangers (Jungle/Woodland)";				value = "CFP_B_USRANGERS_WDL";};
					class CFP_B_USSEALS_DES 				{name = "@CFP - US Navy Seals (Arid / Desert)";					value = "CFP_B_USSEALS_DES";};
					class CFP_B_USSEALS_WDL 				{name = "@CFP - US Navy Seals (Jungle / Woodland)";				value = "CFP_B_USSEALS_WDL";};
					class CFP_B_YPG 						{name = "@CFP - YPG";											value = "CFP_B_YPG";};
					class CUP_B_CZ 							{name = "@CUP - Army of the Czech Republic";					value = "CUP_B_CZ";};
					class CUP_B_GB 							{name = "@CUP - British Armed Forces"; 							value = "CUP_B_GB";};
					class CUP_B_GER 						{name = "@CUP - Bundeswehr"; 									value = "CUP_B_GER";};
					class CUP_B_US_Army 					{name = "@CUP - United States Army"; 							value = "CUP_B_US_Army";};
				};
			};
		class GarrRadius: Edit
  			{
				property = "TFSRHS_AI_GarRadius";
				displayName = "Garrison Radius";
				tooltip = "AI Garrison radius from this module.";
				typeName = "NUMBER";
				defaultValue = 100;
			};

		class GarrisonedGroupsMin: Edit
		{
			property = "TFSRHS_AI_GarrisonedGroupsMin";
			displayName = "Min Garrisoned Groups";
			description = "Minimum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class GarrisonedGroupsMax: Edit
		{
			property = "TFSRHS_AI_GarrisonedGroupsMax";
			displayName = "Max Garrisoned Groups";
			description = "Maximum Number of Garrisoned AI Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};

		class PatrolMethod: Combo
  			{
				property = "TFSRHS_AI_PatrolMethod";
				displayName = "Patrol Method";
				tooltip = "Method to use for plotting patrol paths";
				defaultValue = """RANDOM""";
				class values
				{
					class RANDOM 				{name = "Random";		value = "RANDOM";};
					class ROAD	 				{name = "Along Roads";	value = "ROAD";};
				};
			};
		class Radius: Edit
  			{
				property = "TFSRHS_AI_Radius";
				displayName = "Patrol Radius";
				tooltip = "AI Patrol radius from this module.";
				typeName = "NUMBER";
				defaultValue = 500;
			};

		class EIPatrolsMin: Edit
		{
			property = "TFSRHS_AI_EIPatrolsMin";
			displayName = "Min Infantry Patrols";
			description = "Minimum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIPatrolsMax: Edit
		{
			property = "TFSRHS_AI_EIPatrolsMax";
			displayName = "Max Infantry Patrols";
			description = "Maximum Number of Infantry Patrol Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMin: Edit
		{
			property = "TFSRHS_AI_EIAAMin";
			displayName = "Min AA Infantry";
			description = "Minimum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIAAMax: Edit
		{
			property = "TFSRHS_AI_EIAAMax";
			displayName = "Max AA Infantry";
			description = "Maximum Number of AA Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMin: Edit
		{
			property = "TFSRHS_AI_EIATMin";
			displayName = "Min AT Infantry";
			description = "Minimum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EIATMax: Edit
		{
			property = "TFSRHS_AI_EIATMax";
			displayName = "Max AT Infantry";
			description = "Maximum Number of AT Infantry Groups to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EISniperMin: Edit
		{
			property = "TFSRHS_AI_EISniperMin";
			displayName = "Min Sniper Teams";
			description = "Minimum Number of Sniper Teams to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class EISniperMax: Edit
		{
			property = "TFSRHS_AI_EISniperMax";
			displayName = "Max Sniper Teams";
			description = "Maximum Number of Sniper Teams to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMin: Edit
		{
			property = "TFSRHS_AI_VehAAMin";
			displayName = "Min AA Vehicles";
			description = "Minimum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehAAMax: Edit
		{
			property = "TFSRHS_AI_VehAAMax";
			displayName = "Max AA Vehicles";
			description = "Maximum Number of AA Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMin: Edit
		{
			property = "TFSRHS_AI_VehLightMin";
			displayName = "Min Light Vehicles";
			description = "Minimum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehLightMax: Edit
		{
			property = "TFSRHS_AI_VehLightMax";
			displayName = "Max Light Vehicles";
			description = "Maximum Number of Light Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMin: Edit
		{
			property = "TFSRHS_AI_VehMRAPMin";
			displayName = "Min MRAPs";
			description = "Minimum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehMRAPMax: Edit
		{
			property = "TFSRHS_AI_VehMRAPMax";
			displayName = "Max MRAPs";
			description = "Maximum Number of MRAPs to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMin: Edit
		{
			property = "TFSRHS_AI_VehHeavyMin";
			displayName = "Min Heavy Vehicles";
			description = "Minimum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehHeavyMax: Edit
		{
			property = "TFSRHS_AI_VehHeavyMax";
			displayName = "Max Heavy Vehicles";
			description = "Maximum Number of Heavy Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMin: Edit
		{
			property = "TFSRHS_AI_VehRandomMin";
			displayName = "Min Random Vehicles";
			description = "Minimum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class VehRandomMax: Edit
		{
			property = "TFSRHS_AI_VehRandomMax";
			displayName = "Max Random Vehicles";
			description = "Maximum Number of Random Vehicles to Spawn";
			typeName = "Number";
			defaultValue = 0;
		};
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Place this module to spawn selected AI around module location.",
			"Multiple AI Spawn modules can be used with different settings.",
			"Ensure all Max values are greater than min values.",
			"Ensure you have the mod enabled for selected modded faction.",
			"Top Tip: Copy and Paste modules!"
		};
			position = 1; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 1; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};
