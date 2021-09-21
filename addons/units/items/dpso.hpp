#define MACRO_TFSRHS_CLASS_COMMON \
    dlc = QUOTE(PREFIX); \
    scope = 2; \
    side = 1; \
    faction = QUOTE(PREFIX); \
    role = "SpecialOperative"; \
    items[] = {"ACE_MapTools","TFSRHS_FirstAid","ACE_EarPlugs"}; \
    respawnItems[] = {"ACE_MapTools","TFSRHS_FirstAid","ACE_EarPlugs"}; \
    identityTypes[] = {"LanguageENG_F", "Head_NATO", "Head_TK", "Head_Greek"}; \
    genericNames = QUOTE(PREFIX); \
    class EventHandlers : EventHandlers {class CBA_Extended_EventHandlers : CBA_Extended_EventHandlers_base {};}; \
    modelSides[] = {6}; \
    model = "\A3\Characters_F\Common\basicbody.p3d";

class B_Soldier_base_F_OCimport_01 : B_Soldier_base_F { scope = 0; class EventHandlers; };
class B_Soldier_base_F_OCimport_02 : B_Soldier_base_F_OCimport_01 { class EventHandlers; };

class CLASS(Unit_Combat_TFSRHS_Base): B_Soldier_base_F_OCimport_02 {
    MACRO_TFSRHS_CLASS_COMMON
    weapons[] = {QCLASS(MX_BlackCamo_ACO), QCLASS(hgun_P07_blk_F), "Binocular", "Throw", "Put"};
    respawnWeapons[] = {QCLASS(MX_BlackCamo_ACO), QCLASS(hgun_P07_blk_F), "Binocular", "Throw", "Put"};
    magazines[] = {ITEMS_8(30Rnd_65x39_caseless_black_mag), ITEMS_3(16Rnd_9x21_Mag), "SmokeShell", ITEMS_4(HandGrenade)};\
    respawnMagazines[] = {ITEMS_8(30Rnd_65x39_caseless_black_mag), ITEMS_3(16Rnd_9x21_Mag), "SmokeShell", ITEMS_4(HandGrenade)};\
    nakedUniform = QCLASS(Underwear_GreenLogo);
    hiddenSelectionsMaterials[] = {QPATHTOF(data\uniform_combat.rvmat)};
};

class CLASS(Unit_Combat_TFSRHS_Pilot): B_Soldier_base_F_OCimport_02 {
    MACRO_TFSRHS_CLASS_COMMON
    weapons[] = {"SMG_01_Holo_F", QCLASS(hgun_P07_blk_F), "Binocular", "Throw", "Put"};
    respawnWeapons[] = {"SMG_01_Holo_F", QCLASS(hgun_P07_blk_F), "Binocular", "Throw", "Put"};
    magazines[] = {ITEMS_8(30Rnd_45ACP_Mag_SMG_01), ITEMS_3(16Rnd_9x21_Mag), "SmokeShell", ITEMS_4(HandGrenade)};\
    respawnMagazines[] = {ITEMS_8(30Rnd_45ACP_Mag_SMG_01), ITEMS_3(16Rnd_9x21_Mag), "SmokeShell", ITEMS_4(HandGrenade)};\
    nakedUniform = QCLASS(Underwear_GreenLogo);
    hiddenSelectionsMaterials[] = {QPATHTOF(data\uniform_combat.rvmat)};
};

class CLASS(operator_990) : CLASS(Unit_Combat_TFSRHS_Base) {
	author = AUTHOR;
    scope = 2;
	displayName = "Operator 990";
	uniformClass = "TFSRHS_U_CombatUniformMC";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier1_brn990), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};

class CLASS(operator_991) : CLASS(Unit_Combat_TFSRHS_Base) {
	author = AUTHOR;
    scope = 2;
	displayName = "Operator 991";
	uniformClass = "TFSRHS_U_CombatUniformMC";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier1_brn991), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};

class CLASS(operator_992) : CLASS(Unit_Combat_TFSRHS_Base) {
	author = AUTHOR;
    scope = 2;
	displayName = "Operator 992";
	uniformClass = "TFSRHS_U_CombatUniformMC";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier1_brn992), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};

class CLASS(operator_993) : CLASS(Unit_Combat_TFSRHS_Base) {
	author = AUTHOR;
    scope = 2;
	displayName = "Operator 993";
	uniformClass = "TFSRHS_U_CombatUniformMC";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier1_brn993), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};

class CLASS(operator_995) : CLASS(Unit_Combat_TFSRHS_Base) {
	author = AUTHOR;
    scope = 2;
	displayName = "Operator 995";
	uniformClass = "TFSRHS_U_CombatUniformMC";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier1_brn995), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};

class CLASS(flight_crew_999) : CLASS(Unit_Combat_TFSRHS_Pilot) {
	author = AUTHOR;
    scope = 2;
	displayName = "Pilot 999";
	uniformClass = "TFSRHS_B_HeliPilotCoveralls";
    linkedItems[] = {QCLASS(Item_Vest_PlateCarrier_Black999), QCLASS(Cap_Earpiece_BlackLogo), "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};
    respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "TFAR_rf7800str"};

	headgearList[] = {
        QCLASS(Cap_BlackLogo), 1
        QCLASS(Cap_TanLogo), 1
        QCLASS(Cap_Backwards_BlackLogo), 1
        QCLASS(Cap_Backwards_TanLogo), 1
        QCLASS(Cap_Blackcow), 1
        QCLASS(Cap_Tancow), 1
    };

    CBA_facewearList[] = {
        "", 0.5,
        "G_Shades_Black", 0.25,
        "G_Aviator", 0.25,
        "G_Spectacles_Tinted", 0.25,
        "G_Lowprofile", 0.25
    };

	class EventHandlers: EventHandlers {
        init = "if (local (_this select 0)) then {[(_this select 0), [], []] call BIS_fnc_unitHeadgear;};";
    };
};


        