class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    #define MACRO_TFS_CLASS_COMMON \
    dlc = QUOTE(PREFIX);
    \
    scope = 2;
    \
    side = 1;
    \
    faction = QUOTE(PREFIX);
    \
    show = "true";
    \
    uniformClass = "USP_G3C_MC";
    \
    class EventHandlers : EventHandlers {
        class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};
    };
    \
    
    class rhsusf_army_ocp_officer {
        class EventHandlers;
    };
    class rhsusf_army_ocp_jfo {
        class EventHandlers;
    };
    class rhsusf_army_ocp_medic {
        class EventHandlers;
    };
    class rhsusf_army_ocp_squadleader {
        class EventHandlers;
    };
    class rhsusf_army_ocp_teamleader {
        class EventHandlers;
    };
    class rhsusf_army_ocp_grenadier {
        class EventHandlers;
    };
    class rhsusf_army_ocp_rifleman {
        class EventHandlers;
    };
    class rhsusf_army_ocp_autorifleman {
        class EventHandlers;
    };
    class rhsusf_army_ocp_helipilot {
        class EventHandlers;
    };
    class rhsusf_infantry_socom_marsoc_base {
        class EventHandlers;
    };
    class rhsusf_army_ocp_marksman {
        class EventHandlers;
    };
    class rhsusf_army_ocp_engineer {
        class EventHandlers;
    };
    
    class CLASS(officer): rhsusf_army_ocp_officer {
        MACRO_TFS_CLASS_COMMON
        displayname = "Staff Officer";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(staff): rhsusf_army_ocp_officer {
        MACRO_TFS_CLASS_COMMON
        displayname = "Staff agent";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(platoon_leader): rhsusf_army_ocp_officer {
        MACRO_TFS_CLASS_COMMON
        displayname = "Platoon leader";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(platoon_sgt): rhsusf_army_ocp_officer {
        MACRO_TFS_CLASS_COMMON
        displayname = "Platoon Sergeant";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(platoon_rto): rhsusf_army_ocp_jfo {
        MACRO_TFS_CLASS_COMMON
        displayname = "Platoon Rto";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(platoon_jfire): rhsusf_army_ocp_jfo {
        MACRO_TFS_CLASS_COMMON
        displayname = "Platoon Jfire";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(platoon_medic): rhsusf_army_ocp_medic {
        MACRO_TFS_CLASS_COMMON
        displayname = "Platoon Medic";
        backpack = "USP_45L_RUCKSACK_MC";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs", "FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs", "FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(squad_leader): rhsusf_army_ocp_squadleader {
        MACRO_TFS_CLASS_COMMON
        displayname = "Squad leader";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(squad_medic): rhsusf_army_ocp_medic {
        MACRO_TFS_CLASS_COMMON
        displayname = "Squad Medic";
        backpack = "USP_45L_RUCKSACK_MC";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs", "FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs", "FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(teamleader): rhsusf_army_ocp_teamleader {
        MACRO_TFS_CLASS_COMMON
        displayname = "Team leader";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(rifleman): rhsusf_army_ocp_rifleman {
        MACRO_TFS_CLASS_COMMON
        displayname = "Rifleman";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(grenadier): rhsusf_army_ocp_grenadier {
        MACRO_TFS_CLASS_COMMON
        displayname = "Grenadier";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_WEAPON_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_WEAPON_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(autorifleman): rhsusf_army_ocp_autorifleman {
        MACRO_TFS_CLASS_COMMON
        displayname = "Auto Rifleman";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_LIGHT_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_LIGHT_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(Engineer): rhsusf_army_ocp_engineer {
        MACRO_TFS_CLASS_COMMON
        displayname = "Engineer";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(Marksman): rhsusf_army_ocp_marksman {
        MACRO_TFS_CLASS_COMMON
        displayname = "Marksman";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        linkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(helipilot): rhsusf_army_ocp_helipilot {
        dlc = QUOTE(PREFIX);
        scope = 2;
        side = 1;
        faction = QUOTE(PREFIX);
        show = "true";
        role = "default";
        displayname = "pilot";
        uniformClass = "U_B_HelipilotCoveralls";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        class EventHandlers : EventHandlers {
            class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};
        };
        linkeditems[] = {
            "USP_CRYE_CPC_MC", "rhsusf_hgu56p", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_CPC_MC", "rhsusf_hgu56p", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""
        };
    };
    
    class CLASS(socom): rhsusf_infantry_socom_marsoc_base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        side = 1;
        faction = QUOTE(PREFIX);
        show = "true";
        role = "default";
        displayname = "Operator";
        uniformClass = "USP_G3C_CU_KP_MX_MC";
        items[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        respawnitems[] = {
            "ACE_Maptools", "TFS_FirstAid", "ACE_EarPlugs"
        };
        class EventHandlers : EventHandlers {
            class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};
        };
        linkeditems[] = {
            "USP_CRYE_JPC_ASLTB_CBR", "USP_IHPS_COV_CT3_tan_MC", "rhs_ess_black", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_su230", "", "", "", "", ""
        };
        respawnLinkeditems[] = {
            "USP_CRYE_JPC_ASLTB_CBR", "USP_IHPS_COV_CT3_tan_MC", "rhs_ess_black", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_su230", "", "", "", "", ""
        };
    };
};