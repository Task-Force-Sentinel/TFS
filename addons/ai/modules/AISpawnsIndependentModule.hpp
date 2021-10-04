class TFS_moduleAIspawnsindependent: module_F
{
    scope = 2;
    displayname = "AI spawn - independent";
    icon = "\z\tfs\addons\media\images\icons\AI inDEP.paa";
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
            defaultValue = """inD_C_F""";
            class values
            {
                class UK3CB_CCM_I {
                    name = "@3CB factions - Chernarus Nationalist Militia";
                    value = "UK3CB_CCM_I";
                };
                class UK3CB_TKA_I {
                    name = "@3CB factions - Takistan National Army";
                    value = "UK3CB_TKA_I";
                };
                class UK3CB_TKM_I {
                    name = "@3CB factions - Takistan Tribal Fighters";
                    value = "UK3CB_TKM_I";
                };
                class UK3CB_TKP_I {
                    name = "@3CB factions - Takistan National Police";
                    value = "UK3CB_TKP_I";
                };
                class UK3CB_UN_I {
                    name = "@3CB factions - UN Peacekeepers";
                    value = "UK3CB_UN_I";
                };
                class CFP_I_AlnUSRA {
                    name = "@CFP - al-Nusra Front";
                    value = "CFP_I_AlnUSRA";
                };
                class CFP_I_IS {
                    name = "@CFP - Islamic State";
                    value = "CFP_I_IS";
                };
                class CFP_I_SDRebels {
                    name = "@CFP - Sudan People's Liberation movement North";
                    value = "CFP_I_SDRebels";
                };
                class CFP_I_SDRebelsrf {
                    name = "@CFP - Sudan Revolutionary Front";
                    value = "CFP_I_SDRebelsrf";
                };
                class CFP_I_SSArmy {
                    name = "@CFP - South Sudan People's Defense force";
                    value = "CFP_I_SSArmy";
                };
                class CFP_I_TUAREG {
                    name = "@CFP - Tuareg Rebels";
                    value = "CFP_I_TUAREG";
                };
                class CFP_I_westUltra {
                    name = "@CFP - western Ultranationalists";
                    value = "CFP_I_westUltra";
                };
                class CUP_I_NAPA {
                    name = "@CUP - National Part of Chernarus";
                    value = "CUP_I_NAPA";
                };
                class CUP_I_PMC_ION {
                    name = "@CUP - ION PMC";
                    value = "CUP_I_PMC_ION";
                };
                class CUP_I_RACS {
                    name = "@CUP - Royal Army Corps of Sahrani";
                    value = "CUP_I_RACS";
                };
                class CUP_I_TK_GUE {
                    name = "@CUP - Takistani locals";
                    value = "CUP_I_TK_GUE";
                };
                class CUP_I_UN {
                    name = "@CUP - United Nations";
                    value = "CUP_I_UN";
                };
                class LIB_US_ARMY {
                    name = "@ifA3 - US Army";
                    value = "LIB_US_ARMY";
                };
                class LOP_IRAN {
                    name = "@Project opfor - Iranian Armed forces";
                    value = "LOP_IRAN";
                };
                class LOP_NAPA {
                    name = "@Project opfor - Chernarussian National insurgents";
                    value = "LOP_NAPA";
                };
                class LOP_PESH_inD {
                    name = "@Project opfor - Kurdish Peshmerga forces";
                    value = "LOP_PESH_inD";
                };
                class LOP_PMC {
                    name = "@Project opfor - private Military Company";
                    value = "LOP_PMC";
                };
                class LOP_RACS {
                    name = "@Project opfor - Royal Army Corps of Sahrani";
                    value = "LOP_RACS";
                };
                class LOP_UA {
                    name = "@Project opfor - Ultranationalists";
                    value = "LOP_UA";
                };
                class LOP_UKR {
                    name = "@Project opfor - Ukrainian Armed forces";
                    value = "LOP_UKR";
                };
                class LOP_UN {
                    name = "@Project opfor - United Nations";
                    value = "LOP_UN";
                };
                class LOP_UVF {
                    name = "@Project opfor - Ulster Volunteer force";
                    value = "LOP_UVF";
                };
                class rhsgref_faction_cdf_ground {
                    name = "@RHS GREF - Chernarus (Ground forces)";
                    value = "rhsgref_faction_cdf_ground";
                };
                class rhsgref_faction_chdkz_g {
                    name = "@RHS GREF - ChDKZ insurgents";
                    value = "rhsgref_faction_chdkz_g";
                };
                class rhsgref_faction_nationalist {
                    name = "@RHS GREF - Nationalist Militia";
                    value = "rhsgref_faction_nationalist";
                };
                class rhssaf_faction_army {
                    name = "@RHS SAF - SAF (KOV)";
                    value = "rhssaf_faction_army";
                };
                class rhssaf_faction_un {
                    name = "@RHS SAF - SAF (UN Peacekeepers)";
                    value = "rhssaf_faction_un";
                };
                class inD_F {
                    name = "Vanilla - AAF";
                    value = "inD_F";
                };
                class inD_C_F {
                    name = "Vanilla - Syndikat";
                    value = "inD_C_F";
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