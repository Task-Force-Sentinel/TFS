class CfgVehicles {
    // Box
    class NATO_Box_Base {
        class EventHandlers;
    };
    class CLASS(TFS_resupply): NATO_Box_Base {
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
			init="[this,10,true,true] call TFS_fnc_AmmoCrate;";
		};
        displayName = "TFS Resupply";
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
		init = "[this,10,true,true] call TFS_fnc_AmmoCrate;";
        };
        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Box_NATO_AmmoVeh_F.jpg";
		_generalMacro="Box_NATO_AmmoVeh_F";
		hiddenSelectionsTextures[]=
		{
			"z\tfs\addons\Equipment\data\ammobox_signs_ca.paa",
            "z\tfs\addons\Equipment\data\ammotfs_co.paa",
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
	class CLASS(TFS_arsenal): NATO_Box_Base {
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
        displayName = "TFS Arsenal";
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
            "z\tfs\addons\Equipment\data\ammobox_signs_caa.paa",
			"z\tfs\addons\Equipment\data\ammotfsA_co.paa"
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

    class TFS_Item_Vector_Designator: ACE_Item_Vector {
        author = "NemessisRE";
        displayName = "[tfs] ACE Vector Designator (NVG/TI)";
        class TransportItems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator";
                count=1;
            };
        };
    };

    class TFS_Item_Vector_Designator_NVG: TFS_Item_Vector_Designator {
        displayName = "[tfs] ACE Vector Designator (NVG)";
        class TransportItems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator_NVG";
                count=1;
            };
        };
    };

    class Item_optic_Nightstalker;
    class TFS_Item_optic_Nightstalker: Item_optic_Nightstalker {
        displayName="[tfs] Nightstalker";
        author="NemesisRE";
        vehicleClass="WeaponAccessories";
        class TransportItems {
            class TFS_optic_Nightstalker {
                name="TFS_optic_Nightstalker";
                count=1;
            };
        };
    };

    class Item_optic_AMS;
    class TFS_Item_optic_AMS: Item_optic_AMS {
        displayName="[tfs] AMS (Black)";
        author="NemesisRE";
        class TransportItems {
            class TFS_optic_AMS {
                name="TFS_optic_AMS";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMS_khk: TFS_Item_optic_AMS {
        displayName="[tfs] AMS (Khaki)";
        class TransportItems {
            class TFS_optic_AMS_khk {
                name="TFS_optic_AMS_khk";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMS_snd: TFS_Item_optic_AMS {
        displayName="[tfs] AMS (Sand)";
        class TransportItems {
            class TFS_optic_AMS_snd {
                name="TFS_optic_AMS_snd";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI: Item_optic_AMS {
        displayName="[tfs] AMS-TI (Black)";
        author="NemesisRE";
        class TransportItems {
            class TFS_optic_AMS {
                name="TFS_optic_AMSTI";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI_khk: TFS_Item_optic_AMSTI {
        displayName="[tfs] AMS-TI (Khaki)";
        class TransportItems {
            class TFS_optic_AMS_khk {
                name="TFS_optic_AMSTI_khk";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI_snd: TFS_Item_optic_AMSTI {
        displayName="[tfs] AMS-TI (Sand)";
        class TransportItems {
            class TFS_optic_AMS_snd {
                name="TFS_optic_AMSTI_snd";
                count=1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator_NVG";
                count=3;
            };
        };
    };
};

