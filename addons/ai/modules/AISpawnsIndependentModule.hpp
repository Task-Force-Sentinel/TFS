class TFSRHS_ModuleAISpawnsIndependent: Module_F
{
	scope = 2;
	displayName = "AI Spawn - Independent";
	icon = "\z\tfsrhs\addons\media\images\icons\AI INDEP.paa";
	category = QUOTE(PREFIX);
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
				defaultValue = """IND_C_F""";
				class values
				{
					class CFP_I_ALNUSRA 				{name = "@CFP - al-Nusra Front";								value = "CFP_I_ALNUSRA";};
					class CFP_I_IS 						{name = "@CFP - Islamic State";									value = "CFP_I_IS";};
					class CFP_I_SDRebels 				{name = "@CFP - Sudan People's Liberation Movement North";		value = "CFP_I_SDRebels";};
					class CFP_I_SDRebelsrf 				{name = "@CFP - Sudan Revolutionary Front";						value = "CFP_I_SDRebelsrf";};
					class CFP_I_SSArmy 					{name = "@CFP - South Sudan People's Defense Force";			value = "CFP_I_SSArmy";};
					class CFP_I_TUAREG 					{name = "@CFP - Tuareg Rebels";									value = "CFP_I_TUAREG";};
					class CFP_I_WestUltra 				{name = "@CFP - Western Ultranationalists";						value = "CFP_I_WestUltra";};					
					class CUP_I_NAPA 					{name = "@CUP - National Part of Chernarus";					value = "CUP_I_NAPA";};
					class CUP_I_PMC_ION 				{name = "@CUP - ION PMC"; 										value = "CUP_I_PMC_ION";};
					class CUP_I_RACS 					{name = "@CUP - Royal Army Corps of Sahrani"; 					value = "CUP_I_RACS";};
					class CUP_I_TK_GUE 					{name = "@CUP - Takistani Locals"; 								value = "CUP_I_TK_GUE";};
					class CUP_I_UN 						{name = "@CUP - United Nations";								value = "CUP_I_UN";};
					class IND_F							{name = "Vanilla - AAF";										value = "IND_F";};
					class IND_C_F 						{name = "Vanilla - Syndikat"; 									value = "IND_C_F";};

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
