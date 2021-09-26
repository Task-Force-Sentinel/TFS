class CBA_Extended_EventHandlers_base;

class CfgVehicles {
	#define MACRO_TFS_CLASS_COMMON \
	dlc = QUOTE(PREFIX); \
	scope = 2; \
	side = 1; \
	faction = QUOTE(PREFIX); \
	show = "true"; \
	uniformClass = "USP_G3C_MC"; \
	class EventHandlers : EventHandlers {class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};}; \

	class rhsusf_army_ocp_officer;
	class rhsusf_army_ocp_jfo;
	class rhsusf_army_ocp_medic;
	class rhsusf_army_ocp_squadleader;
	class rhsusf_army_ocp_teamleader;
	class rhsusf_army_ocp_grenadier;
	class rhsusf_army_ocp_rifleman;
	class rhsusf_army_ocp_autorifleman;
	class rhsusf_army_ocp_helipilot;
	class rhsusf_infantry_socom_marsoc_base;

	//////////////////////////////////////////

	class CLASS(officer): rhsusf_army_ocp_officer {
		MACRO_TFS_CLASS_COMMON
		displayName = "Staff Officer";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(staff): rhsusf_army_ocp_officer {
		MACRO_TFS_CLASS_COMMON
		displayName = "Staf Agent";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	/////////////////////////////////////////

	class CLASS(platoon_leader): rhsusf_army_ocp_officer {
		MACRO_TFS_CLASS_COMMON
		displayName = "Platoon Leader";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(platoon_sgt): rhsusf_army_ocp_officer {
		MACRO_TFS_CLASS_COMMON
		displayName = "Platoon Sergeant";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(platoon_rto): rhsusf_army_ocp_jfo {
		MACRO_TFS_CLASS_COMMON
		displayName = "Platoon RTO";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_COMMS_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(platoon_medic): rhsusf_army_ocp_medic {
		MACRO_TFS_CLASS_COMMON
		displayName = "Platoon Medic";
		backpack = "USP_45L_RUCKSACK_MC";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs","FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"};
		respawnitems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs","FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"};
		linkedItems[] = {"USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	//////////////////////////////////////////////////////////////

	class CLASS(squad_leader): rhsusf_army_ocp_squadleader {
		MACRO_TFS_CLASS_COMMON
		displayName = "Squad Leader";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(squad_medic): rhsusf_army_ocp_medic {
		MACRO_TFS_CLASS_COMMON
		displayName = "Squad Medic";
		backpack = "USP_45L_RUCKSACK_MC";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs","FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"};
		respawnitems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs","FirstAidKit", "rhsusf_patrolcap_ocp", "Medikit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_aatKit", "kat_accuvac", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "ACE_adenosine", "kat_X_AED", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_elasticBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "ACE_quikclot", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "kat_chestSeal", "TFS_MedicArea", "ACE_EarPlugs", "ACE_EarPlugs", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "ACE_epinephrine", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_guedel", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "kat_larynx", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "ACE_morphine", "kat_Pulseoximeter", "ACE_salineIV", "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_salineIV_250", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet", "ACE_tourniquet"};
		linkedItems[] = {"USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_MEDIC_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	///////////////////////////////////

	class CLASS(teamleader): rhsusf_army_ocp_teamleader {
		MACRO_TFS_CLASS_COMMON
		displayName = "Team Leader";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LEAD_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(rifleman): rhsusf_army_ocp_rifleman {
		MACRO_TFS_CLASS_COMMON
		displayName = "Rifleman";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_FAST_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(grenadier): rhsusf_army_ocp_grenadier {
		MACRO_TFS_CLASS_COMMON
		displayName = "Grenadier";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_WEAPON_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_WEAPON_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	class CLASS(autorifleman): rhsusf_army_ocp_autorifleman {
		MACRO_TFS_CLASS_COMMON
		displayName = "Auto Rifleman";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"}; 
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		linkedItems[] = {"USP_CRYE_CPC_LIGHT_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_LIGHT_BELT_MC", "USP_IHPS_COV_BLK_MC", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_rf7800str", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};

	//////////////////////////////////////
	class CLASS(helipilot): rhsusf_army_ocp_helipilot {
		dlc = QUOTE(PREFIX);
		scope = 2;
		side = 1;
		faction = QUOTE(PREFIX);
		show = "true";
		role = "Default";
		displayName = "Pilot";
		uniformClass = "U_B_HeliPilotCoveralls";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
				class EventHandlers : EventHandlers {
			class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {
			};
		};
		linkedItems[] = {"USP_CRYE_CPC_MC", "rhsusf_hgu56p", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_CPC_MC", "rhsusf_hgu56p", "", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_ACOG2", "rhsusf_acc_kac_grip", "", "", "", ""};
	};   

	////////////////////////////////////
	class CLASS(socom): rhsusf_infantry_socom_marsoc_base {
		dlc = QUOTE(PREFIX);
		scope = 2;
		side = 1;
		faction = QUOTE(PREFIX);
		show = "true";
		role = "Default";
		displayName = "Operator";
		uniformClass = "USP_G3C_CU_KP_MX_MC";
		items[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		respawnItems[] = {"ACE_MapTools","TFS_FirstAid","ACE_EarPlugs"};
		class EventHandlers : EventHandlers {
			class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {
			};
		};
		linkedItems[] = {"USP_CRYE_JPC_ASLTB_CBR", "USP_IHPS_COV_CT3_TAN_MC", "rhs_ess_black", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_su230", "", "", "", "", ""};
		respawnLinkedItems[] = {"USP_CRYE_JPC_ASLTB_CBR", "USP_IHPS_COV_CT3_TAN_MC", "rhs_ess_black", "ItemMap", "ItemCompass", "ItemWatch", "TFAR_anprc152", "", "rhsusf_acc_anpeq15", "rhsusf_acc_su230", "", "", "", "", ""};
	}; 
};

