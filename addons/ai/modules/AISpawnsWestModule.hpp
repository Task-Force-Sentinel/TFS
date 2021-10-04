class TFS_moduleAIspawnswest: module_F
{
    scope = 2;
    displayname = "AI spawn - west";
    icon = "\z\tfs\addons\media\images\icons\AI west.paa";
    category = QUOTE(PREFIX);
    function = "TFS_fnc_moduleAIspawns";
    functionpriority = 2;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class Objname: Edit
        {
            property = "TFS_AI_Objname";
            displayname = "Objective name";
            tooltip = "name of Objective/spawn position.";
            defaultValue = """Objective 1""";
        };
        class Enemytype: Combo
        {
            property = "TFS_AI_Enemytype";
            displayname = "Enemy faction";
            tooltip = "Enemy faction type for this module.";
            defaultValue = """BLU_F""";
            class values
            {
                class UK3CB_BAF_faction_Army_Arctic {
                    name = "@3CB BAF - Army - Arctic";
                    value = "UK3CB_BAF_faction_Army_Arctic";
                };
                class UK3CB_BAF_faction_Army_Desert {
                    name = "@3CB BAF - Army - Desert";
                    value = "UK3CB_BAF_faction_Army_Desert";
                };
                class UK3CB_BAF_faction_Army_MTP {
                    name = "@3CB BAF - Army - MTP";
                    value = "UK3CB_BAF_faction_Army_MTP";
                };
                class UK3CB_BAF_faction_Army_Temperate {
                    name = "@3CB BAF - Army - Temperate";
                    value = "UK3CB_BAF_faction_Army_Temperate";
                };
                class UK3CB_BAF_faction_Army_Tropical {
                    name = "@3CB BAF - Army - Tropical";
                    value = "UK3CB_BAF_faction_Army_Tropical";
                };
                class UK3CB_BAF_faction_Army_Woodland {
                    name = "@3CB BAF - Army - Woodland";
                    value = "UK3CB_BAF_faction_Army_Woodland";
                };
                class CFP_B_AFARMY {
                    name = "@CFP - Afghan Army";
                    value = "CFP_B_AFARMY";
                };
                class CFP_B_AFGPOLICE {
                    name = "@CFP - Afghan Police";
                    value = "CFP_B_AFGPOLICE";
                };
                class CFP_B_CAF {
                    name = "@CFP - Chadian Armed forces";
                    value = "CFP_B_CAF";
                };
                class CFP_B_CDF_SNW {
                    name = "@CFP - Chernarus Defense forces [Winter]";
                    value = "CFP_B_CDF_SNW";
                };
                class CFP_B_ILIDF {
                    name = "@CFP - Israeli Defense force";
                    value = "CFP_B_ILIDF";
                };
                class CFP_B_IQARMY {
                    name = "@CFP - Iraqi Army";
                    value = "CFP_B_IQARMY";
                };
                class CFP_B_IQPOLICE {
                    name = "@CFP - Iraqi Police";
                    value = "CFP_B_IQPOLICE";
                };
                class CFP_B_KEARMY {
                    name = "@CFP - Kenyan Defense force";
                    value = "CFP_B_KEARMY";
                };
                class CFP_B_MLARMY {
                    name = "@CFP - Malian Government forces";
                    value = "CFP_B_MLARMY";
                };
                class CFP_B_NAARMY {
                    name = "@CFP - Nigerian Army";
                    value = "CFP_B_NAARMY";
                };
                class CFP_B_PESH {
                    name = "@CFP - Peshmerga";
                    value = "CFP_B_PESH";
                };
                class CFP_B_UGARMY {
                    name = "@CFP - Uganda People's Defense force";
                    value = "CFP_B_UGARMY";
                };
                class CFP_B_USARMY_1991_DES {
                    name = "@CFP - US Army 1991 [Arid/Desert]";
                    value = "CFP_B_USARMY_1991_DES";
                };
                class CFP_B_USARMY_1991_WDL {
                    name = "@CFP - US Army 1991 [Woodland]";
                    value = "CFP_B_USARMY_1991_WDL";
                };
                class CFP_B_USARMY_2003_DES {
                    name = "@CFP - US Army 2003 [Arid/Desert]";
                    value = "CFP_B_USARMY_2003_DES";
                };
                class CFP_B_USARMY_2003_WDL {
                    name = "@CFP - US Army 2003 [Woodland]";
                    value = "CFP_B_USARMY_2003_WDL";
                };
                class CFP_B_USCIA {
                    name = "@CFP - US CIA (Middle east)";
                    value = "CFP_B_USCIA";
                };
                class CFP_B_USRANGERS_WDL {
                    name = "@CFP - US 75th Rangers (Jungle/Woodland)";
                    value = "CFP_B_USRANGERS_WDL";
                };
                class CFP_B_USSEALS_DES {
                    name = "@CFP - US Navy Seals (Arid / Desert)";
                    value = "CFP_B_USSEALS_DES";
                };
                class CFP_B_USSEALS_WDL {
                    name = "@CFP - US Navy Seals (Jungle / Woodland)";
                    value = "CFP_B_USSEALS_WDL";
                };
                class CFP_B_YPG {
                    name = "@CFP - YPG";
                    value = "CFP_B_YPG";
                };
                class UK3CB_ANA_B {
                    name = "@3CB factions - Afghan National Army";
                    value = "UK3CB_ANA_B";
                };
                class UK3CB_ANP_B {
                    name = "@3CB factions - Afghan National Police";
                    value = "UK3CB_ANP_B";
                };
                class UK3CB_CCM_B {
                    name = "@3CB factions - Chernarus local Defence Volunteers";
                    value = "UK3CB_CCM_B";
                };
                class UK3CB_TKA_B {
                    name = "@3CB factions - Takistan National Army";
                    value = "UK3CB_TKA_B";
                };
                class UK3CB_TKM_B {
                    name = "@3CB factions - Takistan Pro-Government Militia";
                    value = "UK3CB_TKM_B";
                };
                class UK3CB_TKP_B {
                    name = "@3CB factions - Takistan National Police";
                    value = "UK3CB_TKP_B";
                };
                class UK3CB_UN_B {
                    name = "@3CB factions - UN Peacekeepers";
                    value = "UK3CB_UN_B";
                };
                class CUP_B_CZ {
                    name = "@CUP - Army of the Czech Republic";
                    value = "CUP_B_CZ";
                };
                class CUP_B_GB {
                    name = "@CUP - British Armed forces";
                    value = "CUP_B_GB";
                };
                class CUP_B_GER {
                    name = "@CUP - Bundeswehr";
                    value = "CUP_B_GER";
                };
                class CUP_B_US_Army {
                    name = "@CUP - United States Army";
                    value = "CUP_B_US_Army";
                };
                class LIB_WEHRMACHT {
                    name = "@ifA3 - Wehrmacht";
                    value = "LIB_WEHRMACHT";
                };
                class OPTRE_UNSC {
                    name = "@OPTRE - UNSCDF";
                    value = "OPTRE_UNSC";
                };
                class LOP_AA {
                    name = "@Project opfor - Afghan National Army";
                    value = "LOP_AA";
                };
                class LOP_IA {
                    name = "@Project opfor - Iraqi Armed forces";
                    value = "LOP_IA";
                };
                class rhs_faction_usarmy_d {
                    name = "@RHS USAF - USA Army - Desert";
                    value = "rhs_faction_usarmy_d";
                };
                class rhs_faction_usarmy_wd {
                    name = "@RHS USAF - USA Army - Woodland";
                    value = "rhs_faction_usarmy_wd";
                };
                class BLU_F {
                    name = "Vanilla - NAto";
                    value = "BLU_F";
                };
                class BLU_T_F {
                    name = "Vanilla - NAto (Pacific)";
                    value = "BLU_T_F";
                };
            };
        };
        class Garrradius: Edit
        {
            property = "TFS_AI_Garradius";
            displayname = "Garrison radius";
            tooltip = "AI Garrison radius from this module.";
            typeName = "NUMBER";
            defaultValue = 100;
        };
        
        class Garrisonedgroupsmin: Edit
        {
            property = "TFS_AI_Garrisonedgroupsmin";
            displayname = "min Garrisoned groups";
            description = "minimum Number of Garrisoned AI groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class Garrisonedgroupsmax: Edit
        {
            property = "TFS_AI_Garrisonedgroupsmax";
            displayname = "max Garrisoned groups";
            description = "maximum Number of Garrisoned AI groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        
        class PatrolMethod: Combo
        {
            property = "TFS_AI_PatrolMethod";
            displayname = "Patrol Method";
            tooltip = "Method to use for plotting patrol paths";
            defaultValue = """random""";
            class values
            {
                class random {
                    name = "random";
                    value = "random";
                };
                class ROAD {
                    name = "Along Roads";
                    value = "ROAD";
                };
            };
        };
        class radius: Edit
        {
            property = "TFS_AI_radius";
            displayname = "Patrol radius";
            tooltip = "AI Patrol radius from this module.";
            typeName = "NUMBER";
            defaultValue = 500;
        };
        
        class EIPatrolsmin: Edit
        {
            property = "TFS_AI_EIPatrolsmin";
            displayname = "min infantry Patrols";
            description = "minimum Number of infantry Patrol groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EIPatrolsmax: Edit
        {
            property = "TFS_AI_EIPatrolsmax";
            displayname = "max infantry Patrols";
            description = "maximum Number of infantry Patrol groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EIAAmin: Edit
        {
            property = "TFS_AI_EIAAmin";
            displayname = "min AA infantry";
            description = "minimum Number of AA infantry groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EIAAmax: Edit
        {
            property = "TFS_AI_EIAAmax";
            displayname = "max AA infantry";
            description = "maximum Number of AA infantry groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EIATmin: Edit
        {
            property = "TFS_AI_EIATmin";
            displayname = "min AT infantry";
            description = "minimum Number of AT infantry groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EIATmax: Edit
        {
            property = "TFS_AI_EIATmax";
            displayname = "max AT infantry";
            description = "maximum Number of AT infantry groups to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EISnipermin: Edit
        {
            property = "TFS_AI_EISnipermin";
            displayname = "min Sniper teams";
            description = "minimum Number of Sniper teams to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class EISnipermax: Edit
        {
            property = "TFS_AI_EISnipermax";
            displayname = "max Sniper teams";
            description = "maximum Number of Sniper teams to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehAAmin: Edit
        {
            property = "TFS_AI_VehAAmin";
            displayname = "min AA vehicles";
            description = "minimum Number of AA vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehAAmax: Edit
        {
            property = "TFS_AI_VehAAmax";
            displayname = "max AA vehicles";
            description = "maximum Number of AA vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehLightmin: Edit
        {
            property = "TFS_AI_VehLightmin";
            displayname = "min Light vehicles";
            description = "minimum Number of Light vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehLightmax: Edit
        {
            property = "TFS_AI_VehLightmax";
            displayname = "max Light vehicles";
            description = "maximum Number of Light vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehMRAPmin: Edit
        {
            property = "TFS_AI_VehMRAPmin";
            displayname = "min MRAPs";
            description = "minimum Number of MRAPs to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehMRAPmax: Edit
        {
            property = "TFS_AI_VehMRAPmax";
            displayname = "max MRAPs";
            description = "maximum Number of MRAPs to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehHeavymin: Edit
        {
            property = "TFS_AI_VehHeavymin";
            displayname = "min Heavy vehicles";
            description = "minimum Number of Heavy vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class VehHeavymax: Edit
        {
            property = "TFS_AI_VehHeavymax";
            displayname = "max Heavy vehicles";
            description = "maximum Number of Heavy vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class Vehrandommin: Edit
        {
            property = "TFS_AI_Vehrandommin";
            displayname = "min random vehicles";
            description = "minimum Number of random vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class Vehrandommax: Edit
        {
            property = "TFS_AI_Vehrandommax";
            displayname = "max random vehicles";
            description = "maximum Number of random vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Place this module to spawn selected AI around module location.",
            "Multiple AI spawn modules can be used with different settings.",
            "Ensure all max values are greater than min values.",
            "Ensure you have the mod enabled for selected modded faction.",
            "top Tip: Copy and Paste modules!"
        };
        position = 1;
        // position is taken into effect
        direction = 0;
        // direction is taken into effect
        optional = 1;
        // Synced entity is optional
        duplicate = 1;
        // Multiple entities of this type can be synced
    };
};