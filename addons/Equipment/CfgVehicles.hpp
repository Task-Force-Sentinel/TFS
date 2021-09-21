class CfgVehicles {
    // Box
    class NATO_Box_Base {
        class EventHandlers;
    };
    class CLASS(TFSRHS_resupply): NATO_Box_Base {
        scope = 2;
        author = AUTHOR;
        mapSize=1.53;
		class SimpleObject
		{
			eden=1;
			animate[]={};
			hide[]={};
			verticalOffset=0.79000002;
			verticalOffsetWorld=0;
			init="[this,10,true,true] call TFSRHS_fnc_AmmoCrate;";
		};
        displayName = "TFSRHS Resupply";
        model="A3\Weapons_F\Ammoboxes\AmmoVeh_F";
		icon="iconCrateVeh";
		slingLoadCargoMemoryPoints[]=
		{
			"SlingLoadCargo1",
			"SlingLoadCargo2",
			"SlingLoadCargo3",
			"SlingLoadCargo4"
		};
        class EventHandlers: EventHandlers
        {
		init = "[this,10,true,true] call TFSRHS_fnc_AmmoCrate;";
        };
        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
		_generalMacro="Box_NATO_AmmoVeh_F";
		hiddenSelectionsTextures[]=
		{
			"z\tfsrhs\addons\Equipment\data\tfsrhsbox_signs_ca.paa",
            "z\tfsrhs\addons\Equipment\data\ammotfsrhs_co.paa",
		};
        class TransportMagazines
		{
		};
		class TransportWeapons
		{
		};
		class TransportItems
		{
		};
		transportAmmo=30000;
		supplyRadius=10;
    };
	class CLASS(TFSRHS_arsenal): NATO_Box_Base {
        scope = 2;
        author = AUTHOR;
        mapSize=1.53;
		class SimpleObject
		{
			eden=1;
			animate[]={};
			hide[]={};
			verticalOffset=0.79000002;
			verticalOffsetWorld=0;
		};
        displayName = "TFSRHS Arsenal";
        model="A3\Weapons_F\Ammoboxes\AmmoVeh_F";
		icon="iconCrateVeh";
		slingLoadCargoMemoryPoints[]=
		{
			"SlingLoadCargo1",
			"SlingLoadCargo2",
			"SlingLoadCargo3",
			"SlingLoadCargo4"
		};
        class EventHandlers: EventHandlers
        {
        };
        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
		_generalMacro="Box_NATO_AmmoVeh_F";
		hiddenSelectionsTextures[]=
		{
            "z\tfsrhs\addons\Equipment\data\tfsrhsbox_signs_ca.paa",
			"z\tfsrhs\addons\Equipment\data\ammotfsrhsA_co.paa"
		};
        class TransportMagazines
		{
		};
		class TransportWeapons
		{
		};
		class TransportItems
		{
		};
		transportAmmo=30000;
		supplyRadius=10;
    };
	class CLASS(TFSRHS_Carsenal): NATO_Box_Base {
        scope = 2;
        author = AUTHOR;
        mapSize=1.53;
		class SimpleObject
		{
			eden=1;
			animate[]={};
			hide[]={};
			verticalOffset=0.79000002;
			verticalOffsetWorld=0;
		};
        displayName = "TFSRHS Casual Arsenal";
        model="A3\Weapons_F\Ammoboxes\AmmoVeh_F";
		icon="iconCrateVeh";
		slingLoadCargoMemoryPoints[]=
		{
			"SlingLoadCargo1",
			"SlingLoadCargo2",
			"SlingLoadCargo3",
			"SlingLoadCargo4"
		};
        class EventHandlers: EventHandlers
        {
        };
        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
		_generalMacro="Box_NATO_AmmoVeh_F";
		hiddenSelectionsTextures[]=
		{
            "z\tfsrhs\addons\Equipment\data\tfsrhsbox_signs_ca.paa",
			"z\tfsrhs\addons\Equipment\data\ammotfsrhsCA_co.paa"
		};
        class TransportMagazines
		{
		};
		class TransportWeapons
		{
		};
		class TransportItems
		{
		};
		transportAmmo=30000;
		supplyRadius=10;
    };
	class CLASS(TFSRHS_Iarsenal): NATO_Box_Base {
        scope = 2;
        author = AUTHOR;
        mapSize=1.53;
		class SimpleObject
		{
			eden=1;
			animate[]={};
			hide[]={};
			verticalOffset=0.79000002;
			verticalOffsetWorld=0;
			init="[this,10,true,true] call TFSRHS_fnc_AmmoCrate;";
		};
        displayName = "TFSRHS Incognito Arsenal";
        model="A3\Weapons_F\Ammoboxes\AmmoVeh_F";
		icon="iconCrateVeh";
		slingLoadCargoMemoryPoints[]=
		{
			"SlingLoadCargo1",
			"SlingLoadCargo2",
			"SlingLoadCargo3",
			"SlingLoadCargo4"
		};
        class EventHandlers: EventHandlers
        {
        };
        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
		_generalMacro="Box_NATO_AmmoVeh_F";
		hiddenSelectionsTextures[]=
		{
            "z\tfsrhs\addons\Equipment\data\tfsrhsbox_signs_ca.paa",
			"z\tfsrhs\addons\Equipment\data\ammotfsrhsIA_co.paa"
		};
        class TransportMagazines
		{
		};
		class TransportWeapons
		{
		};
		class TransportItems
		{
		};
		transportAmmo=30000;
		supplyRadius=10;
    };
	class ACE_Item_Vector;

    class TFSRHS_Item_Vector_Designator: ACE_Item_Vector {
        author = "NemessisRE";
        displayName = "[tfsrhs] ACE Vector Designator (NVG/TI)";
        class TransportItems {
            class TFSRHS_Vector_Designator {
                name="TFSRHS_Vector_Designator";
                count=1;
            };
        };
    };

    class TFSRHS_Item_Vector_Designator_NVG: TFSRHS_Item_Vector_Designator {
        displayName = "[tfsrhs] ACE Vector Designator (NVG)";
        class TransportItems {
            class TFSRHS_Vector_Designator {
                name="TFSRHS_Vector_Designator_NVG";
                count=1;
            };
        };
    };

    class Item_optic_Nightstalker;
    class TFSRHS_Item_optic_Nightstalker: Item_optic_Nightstalker {
        displayName="[tfsrhs] Nightstalker";
        author="NemesisRE";
        vehicleClass="WeaponAccessories";
        class TransportItems {
            class TFSRHS_optic_Nightstalker {
                name="TFSRHS_optic_Nightstalker";
                count=1;
            };
        };
    };

    class Item_optic_AMS;
    class TFSRHS_Item_optic_AMS: Item_optic_AMS {
        displayName="[tfsrhs] AMS (Black)";
        author="NemesisRE";
        class TransportItems {
            class TFSRHS_optic_AMS {
                name="TFSRHS_optic_AMS";
                count=1;
            };
        };
    };
    class TFSRHS_Item_optic_AMS_khk: TFSRHS_Item_optic_AMS {
        displayName="[tfsrhs] AMS (Khaki)";
        class TransportItems {
            class TFSRHS_optic_AMS_khk {
                name="TFSRHS_optic_AMS_khk";
                count=1;
            };
        };
    };
    class TFSRHS_Item_optic_AMS_snd: TFSRHS_Item_optic_AMS {
        displayName="[tfsrhs] AMS (Sand)";
        class TransportItems {
            class TFSRHS_optic_AMS_snd {
                name="TFSRHS_optic_AMS_snd";
                count=1;
            };
        };
    };
    class TFSRHS_Item_optic_AMSTI: Item_optic_AMS {
        displayName="[tfsrhs] AMS-TI (Black)";
        author="NemesisRE";
        class TransportItems {
            class TFSRHS_optic_AMS {
                name="TFSRHS_optic_AMSTI";
                count=1;
            };
        };
    };
    class TFSRHS_Item_optic_AMSTI_khk: TFSRHS_Item_optic_AMSTI {
        displayName="[tfsrhs] AMS-TI (Khaki)";
        class TransportItems {
            class TFSRHS_optic_AMS_khk {
                name="TFSRHS_optic_AMSTI_khk";
                count=1;
            };
        };
    };
    class TFSRHS_Item_optic_AMSTI_snd: TFSRHS_Item_optic_AMSTI {
        displayName="[tfsrhs] AMS-TI (Sand)";
        class TransportItems {
            class TFSRHS_optic_AMS_snd {
                name="TFSRHS_optic_AMSTI_snd";
                count=1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class TFSRHS_Vector_Designator {
                name="TFSRHS_Vector_Designator_NVG";
                count=3;
            };
        };
    };
};

