class TFSRHS_ModuleAISpawns: Module_F
{
	scope = 2;
	displayName = "AI Spawn - East";
	icon = "\z\tfsrhs\addons\media\images\icons\AI EAST.paa";
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
				defaultValue = """OPF_F""";
				class values
				{
					class CFP_O_ABUSAYYAF 			{name = "@CFP - Abu Sayyaf Group";							value = "CFP_O_ABUSAYYAF";};
					class CFP_O_ALQAEDA 			{name = "@CFP - Al Qaeda";									value = "CFP_O_ALQAEDA";};
					class CFP_O_ALSHABAAB 			{name = "@CFP - Al-Shabaab";								value = "CFP_O_ALSHABAAB";};
					class CFP_O_ANSARALLAH 			{name = "@CFP - Ansar Allah (Houthis)";						value = "CFP_O_ANSARALLAH";};
					class CFP_O_BOKOHARAM 			{name = "@CFP - Boko Haram";								value = "CFP_O_BOKOHARAM";};
					class CFP_O_CFRebels 			{name = "@CFP - Central African Rebels";					value = "CFP_O_CFRebels";};
					class CFP_O_CHDKZ_SNW 			{name = "@CFP - Chernarussian Movement of the Red Star Winter";	value = "CFP_O_CHDKZ_SNW";};
					class CFP_O_HAMAS 				{name = "@CFP - Hamas Al Qassam Brigades";					value = "CFP_O_HAMAS";};
					class CFP_O_HEZBOLLAH 			{name = "@CFP - Hezbollah";									value = "CFP_O_HEZBOLLAH";};
					class CFP_O_IQARMY 				{name = "@CFP - Iraqi Army (Hussein Regime)";				value = "CFP_O_IQARMY";};
					class CFP_O_IRARMY 				{name = "@CFP - Islamic Republic of Iran Army";				value = "CFP_O_IRARMY";};
					class CFP_O_IS 					{name = "@CFP - Islamic State";								value = "CFP_O_IS";};
					class CFP_O_NKARMY 				{name = "@CFP - Korean People's Army";						value = "CFP_O_NKARMY";};
					class CFP_O_RUARMY_DES 			{name = "@CFP - Russian Ground Forces (Arid / Desert)";		value = "CFP_O_RUARMY_DES";};
					class CFP_O_RUMVD 				{name = "@CFP - Russian National Guard";					value = "CFP_O_RUMVD";};
					class CFP_O_SDARMY 				{name = "@CFP - Sudanese Armed Forces";						value = "CFP_O_SDARMY";};
					class CFP_O_SDMilitia 			{name = "@CFP - Sudan Rapid Support Forces / Janjaweed";	value = "CFP_O_SDMilitia";};
					class CFP_O_SOREBEL 			{name = "@CFP - Somali Rebels";								value = "CFP_O_SOREBEL";};
					class CFP_O_SSREBELS			{name = "@CFP - Sudan People's Liberation Movement";		value = "CFP_O_SSREBELS";};
					class CFP_O_SYARMY 				{name = "@CFP - Syrian Arab Army";							value = "CFP_O_SYARMY";};
					class CFP_O_TBAN 				{name = "@CFP - Taliban Insurgents";						value = "CFP_O_TBAN";};																									
					class CUP_O_ChDKZ 				{name = "@CUP - Chernarussian Movement of the Red Star"; 	value = "CUP_O_ChDKZ";};
					class CUP_O_RU 					{name = "@CUP - Russian Federation"; 						value = "CUP_O_RU";};
					class CUP_O_SLA 				{name = "@CUP - Sahrani Liberation Army";					value = "CUP_O_SLA";};
					class CUP_O_TK 					{name = "@CUP - Takistan Army"; 							value = "CUP_O_TK";};
					class CUP_O_TK_MILITIA 			{name = "@CUP - Takistan Militia"; 							value = "CUP_O_TK_MILITIA";};
					class OPF_F						{name = "Vanilla - CSAT"; 									value = "OPF_F";};
					class OPF_T_F 					{name = "Vanilla - CSAT (Pacific)"; 						value = "OPF_T_F";};
					class TEC_CSAT					{name = "CSAT (Iran, Arid)"; 								value = "TEC_CSAT";};
					class TEC_CSAT_Pacific 			{name = "CSAT (Iran, Woodland)"; 							value = "TEC_CSAT_Pacific";};
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
