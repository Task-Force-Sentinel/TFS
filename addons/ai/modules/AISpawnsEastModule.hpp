class TFS_moduleAIspawns: module_F
{
    scope = 2;
    displayname = "AI spawn - east";
    icon = "\z\tfs\addons\media\images\icons\AI east.paa";
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
            defaultValue = """OPF_F""";
            class values
            {
                class UK3CB_CCM_O {
                    name = "@3CB factions - Chernarus Communist Militia";
                    value = "UK3CB_CCM_O";
                };
                class UK3CB_TKA_O {
                    name = "@3CB factions - Takistan National Army";
                    value = "UK3CB_TKA_O";
                };
                class UK3CB_TKM_O {
                    name = "@3CB factions - Takistan insurgents";
                    value = "UK3CB_TKM_O";
                };
                class UK3CB_TKP_O {
                    name = "@3CB factions - Takistan National Police";
                    value = "UK3CB_TKP_O";
                };
                class CFP_O_ABUsayYAF {
                    name = "@CFP - Abu sayyaf group";
                    value = "CFP_O_ABUsayYAF";
                };
                class CFP_O_ALQAEDA {
                    name = "@CFP - Al Qaeda";
                    value = "CFP_O_ALQAEDA";
                };
                class CFP_O_ALSHABAAB {
                    name = "@CFP - Al-Shabaab";
                    value = "CFP_O_ALSHABAAB";
                };
                class CFP_O_ANSARALLAH {
                    name = "@CFP - Ansar Allah (Houthis)";
                    value = "CFP_O_ANSARALLAH";
                };
                class CFP_O_BOKOHARAM {
                    name = "@CFP - Boko Haram";
                    value = "CFP_O_BOKOHARAM";
                };
                class CFP_O_CFRebels {
                    name = "@CFP - Central African Rebels";
                    value = "CFP_O_CFRebels";
                };
                class CFP_O_CHDKZ_SNW {
                    name = "@CFP - Chernarussian movement of the Red Star Winter";
                    value = "CFP_O_CHDKZ_SNW";
                };
                class CFP_O_HAMAS {
                    name = "@CFP - Hamas Al Qassam Brigades";
                    value = "CFP_O_HAMAS";
                };
                class CFP_O_HEZBOLLAH {
                    name = "@CFP - Hezbollah";
                    value = "CFP_O_HEZBOLLAH";
                };
                class CFP_O_IQARMY {
                    name = "@CFP - Iraqi Army (Hussein Regime)";
                    value = "CFP_O_IQARMY";
                };
                class CFP_O_IRARMY {
                    name = "@CFP - Islamic Republic of Iran Army";
                    value = "CFP_O_IRARMY";
                };
                class CFP_O_IS {
                    name = "@CFP - Islamic State";
                    value = "CFP_O_IS";
                };
                class CFP_O_NKARMY {
                    name = "@CFP - Korean People's Army";
                    value = "CFP_O_NKARMY";
                };
                class CFP_O_RUARMY_DES {
                    name = "@CFP - Russian Ground forces (Arid / Desert)";
                    value = "CFP_O_RUARMY_DES";
                };
                class CFP_O_RUMVD {
                    name = "@CFP - Russian National Guard";
                    value = "CFP_O_RUMVD";
                };
                class CFP_O_SDARMY {
                    name = "@CFP - Sudanese Armed forces";
                    value = "CFP_O_SDARMY";
                };
                class CFP_O_SDMilitia {
                    name = "@CFP - Sudan Rapid Support forces / Janjaweed";
                    value = "CFP_O_SDMilitia";
                };
                class CFP_O_SorEBEL {
                    name = "@CFP - Somali Rebels";
                    value = "CFP_O_SorEBEL";
                };
                class CFP_O_SSREBELS {
                    name = "@CFP - Sudan People's Liberation movement";
                    value = "CFP_O_SSREBELS";
                };
                class CFP_O_SYARMY {
                    name = "@CFP - Syrian Arab Army";
                    value = "CFP_O_SYARMY";
                };
                class CFP_O_TBAN {
                    name = "@CFP - Taliban insurgents";
                    value = "CFP_O_TBAN";
                };
                class TEC_CSAT {
                    name = "@CSAT mod Project - CSAT (Iran, Mediterranean)";
                    value = "TEC_CSAT";
                };
                class TEC_CSAT_Pacific {
                    name = "@CSAT mod Project - CSAT (Iran, Pacific)";
                    value = "TEC_CSAT_Pacific";
                };
                class CUP_O_ChDKZ {
                    name = "@CUP - Chernarussian movement of the Red Star";
                    value = "CUP_O_ChDKZ";
                };
                class CUP_O_RU {
                    name = "@CUP - Russian Federation";
                    value = "CUP_O_RU";
                };
                class CUP_O_SLA {
                    name = "@CUP - Sahrani Liberation Army";
                    value = "CUP_O_SLA";
                };
                class CUP_O_TK {
                    name = "@CUP - Takistan Army";
                    value = "CUP_O_TK";
                };
                class CUP_O_TK_MILITIA {
                    name = "@CUP - Takistan Militia";
                    value = "CUP_O_TK_MILITIA";
                };
                class LIB_RKKA {
                    name = "@ifA3 - Red Army";
                    value = "LIB_RKKA";
                };
                class OPTRE_ins {
                    name = "@OPTRE - insurrectionists";
                    value = "OPTRE_ins";
                };
                class LOP_AFR_OPF {
                    name = "@Project opfor - African Militia";
                    value = "LOP_AFR_OPF";
                };
                class LOP_AM_OPF {
                    name = "@Project opfor - Middle eastern Militia";
                    value = "LOP_AM_OPF";
                };
                class LOP_BH {
                    name = "@Project opfor - Boko Haram";
                    value = "LOP_BH";
                };
                class LOP_ChDKZ {
                    name = "@Project opfor - ChDKZ";
                    value = "LOP_ChDKZ";
                };
                class LOP_IRA {
                    name = "@Project opfor - Irish Republican Army";
                    value = "LOP_IRA";
                };
                class LOP_ISTS_OPF {
                    name = "@Project opfor - Islamic State";
                    value = "LOP_ISTS_OPF";
                };
                class LOP_SLA {
                    name = "@Project opfor - Sahrani Liberation Army";
                    value = "LOP_SLA";
                };
                class LOP_TKA {
                    name = "@Project opfor - Takistani Armed forces";
                    value = "LOP_TKA";
                };
                class rhs_faction_msv {
                    name = "@RHS AFRF - Russia - MSV";
                    value = "rhs_faction_msv";
                };
                class rhs_faction_vdv {
                    name = "@RHS AFRF - Russia - VDV";
                    value = "rhs_faction_vdv";
                };
                class rhs_faction_vmf {
                    name = "@RHS AFRF - Russia - VMF";
                    value = "rhs_faction_vmf";
                };
                class rhsgref_faction_chdkz {
                    name = "@RHS GREF - ChDKZ insurgents";
                    value = "rhsgref_faction_chdkz";
                };
                class UNSUNG_E_NVA {
                    name = "@UNSUNG - NVA";
                    value = "UNSUNG_E_NVA";
                };
                class TBan_group {
                    name = "@Taliban RHS Config - Taliban";
                    value = "TBan_group";
                };
                class OPF_F {
                    name = "Vanilla - CSAT";
                    value = "OPF_F";
                };
                class OPF_T_F {
                    name = "Vanilla - CSAT (Pacific)";
                    value = "OPF_T_F";
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