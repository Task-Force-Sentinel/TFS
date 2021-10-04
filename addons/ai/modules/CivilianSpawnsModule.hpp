class TFS_modulecivilianspawns: module_F
{
    scope = 2;
    displayname = "AI spawn - civilian";
    icon = "\z\tfs\addons\media\images\Icons\AI CIV.paa";
    category = QUOTE(PREFIX);
    function = "TFS_fnc_modulecivilianspawns";
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
        class type: Combo
        {
            property = "TFS_AI_type";
            displayname = "civilian faction";
            tooltip = "civilian faction type for this module.";
            defaultValue = """CIV_F""";
            class values
            {
                class CIV_F {
                    name = "default civilians (Altis)";
                    value = "CIV_F";
                };
                class UK3CB_CHC_C {
                    name = "@3CB factions - civilians (Chernarus)";
                    value = "UK3CB_CHC_C";
                };
                class UK3CB_TKC_C {
                    name = "@3CB factions - civilians (Takustan)";
                    value = "UK3CB_TKC_C";
                };
                class CFP_C_AFG {
                    name = "@CFP - civilians (Afghanistan)";
                    value = "CFP_C_AFG";
                };
                class CFP_C_AFRCHRISTIAN {
                    name = "@CFP - civilians (African Christian)";
                    value = "CFP_C_AFRCHRISTIAN";
                };
                class CFP_C_AFRISLAMIC {
                    name = "@CFP - civilians (African Islamic)";
                    value = "CFP_C_AFRISLAMIC";
                };
                class CFP_C_ASIA {
                    name = "@CFP - civilians (Asian)";
                    value = "CFP_C_ASIA";
                };
                class CUP_C_CHERNARUS {
                    name = "@CUP - civilians (Chernarus)";
                    value = "CUP_C_CHERNARUS";
                };
                class CUP_C_SAHRANI {
                    name = "@CUP - civilians (Middle eastern)";
                    value = "CUP_C_SAHRANI";
                };
                class CUP_C_RU {
                    name = "@CUP - civilians (Russian)";
                    value = "CUP_C_RU";
                };
                class CUP_C_TK {
                    name = "@CUP - civilians (Takistan)";
                    value = "CUP_C_TK";
                };
            };
        };
        class side: Combo
        {
            property = "TFS_AI_side";
            displayname = "civilian side";
            tooltip = "side to spawn the civilians on.";
            defaultValue = """civilian""";
            class values
            {
                class civilian {
                    name = "civilian";
                    value = "civilian";
                };
                /*class west {
                    name = "blufor";
                    value = "west";
                };
                class east {
                    name = "opfor";
                    value = "east";
                };
                class independent {
                    name = "independent";
                    value = "independent";
                };
                */ // todo: make this work
            };
        };
        
        class Garrradius: Edit
        {
            property = "TFS_AI_Garradius";
            displayname = "Garrison radius";
            tooltip = "AI Garrison radius from this module.";
            typeName = "NUMBER";
            defaultValue = 200;
        };
        
        class Garrisonedunitsmin: Edit
        {
            property = "TFS_AI_Garrisonedunitsmin";
            displayname = "min Garrisoned units";
            description = "minimum Number of Garrisoned civilians to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class Garrisonedunitsmax: Edit
        {
            property = "TFS_AI_Garrisonedunitsmax";
            displayname = "max Garrisoned units";
            description = "maximum Number of Garrisoned civilians to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        
        class radius: Edit
        {
            property = "TFS_AI_radius";
            displayname = "Patrol radius";
            tooltip = "civilian spawn radius from this module.";
            typeName = "NUMBER";
            defaultValue = 500;
        };
        
        class CivPedPatrolsmin: Edit
        {
            property = "TFS_AI_CivPedPatrolsmin";
            displayname = "min Pedestrian Patrols";
            description = "minimum Number of Pedestrians to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class CivPedPatrolsmax: Edit
        {
            property = "TFS_AI_CivPedPatrolsmax";
            displayname = "max Pedestrian Patrols";
            description = "maximum Number of Pedestrians to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class CivVehPatrolsmin: Edit
        {
            property = "TFS_AI_CivVehPatrolsmin";
            displayname = "min vehicle Patrols";
            description = "minimum Number of vehicle Patrols to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class CivVehPatrolsmax: Edit
        {
            property = "TFS_AI_CivVehPatrolsmax";
            displayname = "max vehicle Patrols";
            description = "maximum Number of vehicle Patrols to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class CivVehParkedmin: Edit
        {
            property = "TFS_AI_CivVehParkedmin";
            displayname = "min Parked vehicles";
            description = "minimum Number of Parked vehicles to spawn";
            typeName = "Number";
            defaultValue = 0;
        };
        class CivVehParkedmax: Edit
        {
            property = "TFS_AI_CivVehPaarkedmax";
            displayname = "max Parked vehicle";
            description = "maximum Number of Parked vehicles to spawn";
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