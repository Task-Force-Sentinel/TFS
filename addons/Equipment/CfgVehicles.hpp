class Cfgvehicles {
    // Box
    class NAto_Box_Base {
        class EventHandlers;
    };
    class CLASS(TFS_resupply): NAto_Box_Base {
        scope = 2;
        author = AUTHor;
        mapsize=1.53;
        class SimpleObject
        {
            eden=1;
            animate[]={};
            hide[]={};
            verticalOffset=0.79000002;
            verticalOffsetWorld=0;
            init="[this, 10, true, true] call TFS_fnc_ammoCrate;
            ";
        };
        displayname = "TFS Resupply";
        model="A3\weapons_F\ammoboxes\ammoveh_F";
        icon="iconCrateVeh";
        slingloadCargoMemoryPoints[]=
        {
            "SlingloadCargo1",
            "SlingloadCargo2",
            "SlingloadCargo3",
            "SlingloadCargo4"
        };
        class EventHandlers: EventHandlers
        {
            init = "[this, 10, true, true] call TFS_fnc_ammoCrate;
            ";
        };
        editorPreview="\A3\EditorPreviews_F\Data\Cfgvehicles\Box_NAto_ammoveh_F.jpg";
        _generalMacro="Box_NAto_ammoveh_F";
        hiddenselectionstextures[]=
        {
            "z\tfs\addons\Equipment\data\ammobox_signs_ca.paa",
            "z\tfs\addons\Equipment\data\ammotfs_co.paa",
        };
        class Transportmagazines
        {};
        class Transportweapons
        {};
        class Transportitems
        {};
        transportammo=30000;
        supplyradius=10;
    };
    class CLASS(TFS_arsenal): NAto_Box_Base {
        scope = 2;
        author = AUTHor;
        mapsize=1.53;
        class SimpleObject
        {
            eden=1;
            animate[]={};
            hide[]={};
            verticalOffset=0.79000002;
            verticalOffsetWorld=0;
        };
        displayname = "TFS Arsenal";
        model="A3\weapons_F\ammoboxes\ammoveh_F";
        icon="iconCrateVeh";
        ace_dragging_candrag = 0;
        ace_dragging_canCarry = 0;
        slingloadCargoMemoryPoints[]=
        {
            "SlingloadCargo1",
            "SlingloadCargo2",
            "SlingloadCargo3",
            "SlingloadCargo4"
        };
        class EventHandlers: EventHandlers
        {};
        editorPreview="\A3\EditorPreviews_F\Data\Cfgvehicles\Box_NAto_ammoveh_F.jpg";
        _generalMacro="Box_NAto_ammoveh_F";
        hiddenselectionstextures[]=
        {
            "z\tfs\addons\Equipment\data\ammobox_signs_caa.paa",
            "z\tfs\addons\Equipment\data\ammotfsA_co.paa"
        };
        class Transportmagazines
        {};
        class Transportweapons
        {};
        class Transportitems
        {};
        transportammo=30000;
        supplyradius=10;
    };
    
    class ACE_Item_Vector;
    
    class TFS_Item_Vector_Designator: ACE_Item_Vector {
        author = "NemessisRE";
        displayname = "[tfs] ACE Vector Designator (NVG/TI)";
        class Transportitems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator";
                count=1;
            };
        };
    };
    
    class TFS_Item_Vector_Designator_NVG: TFS_Item_Vector_Designator {
        displayname = "[tfs] ACE Vector Designator (NVG)";
        class Transportitems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator_NVG";
                count=1;
            };
        };
    };
    
    class Item_optic_Nightstalker;
    class TFS_Item_optic_Nightstalker: Item_optic_Nightstalker {
        displayname="[tfs] Nightstalker";
        author="NemesisRE";
        vehicleClass="weaponAccessories";
        class Transportitems {
            class TFS_optic_Nightstalker {
                name="TFS_optic_Nightstalker";
                count=1;
            };
        };
    };
    
    class Item_optic_AMS;
    class TFS_Item_optic_AMS: Item_optic_AMS {
        displayname="[tfs] AMS (Black)";
        author="NemesisRE";
        class Transportitems {
            class TFS_optic_AMS {
                name="TFS_optic_AMS";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMS_khk: TFS_Item_optic_AMS {
        displayname="[tfs] AMS (Khaki)";
        class Transportitems {
            class TFS_optic_AMS_khk {
                name="TFS_optic_AMS_khk";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMS_snd: TFS_Item_optic_AMS {
        displayname="[tfs] AMS (Sand)";
        class Transportitems {
            class TFS_optic_AMS_snd {
                name="TFS_optic_AMS_snd";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI: Item_optic_AMS {
        displayname="[tfs] AMS-TI (Black)";
        author="NemesisRE";
        class Transportitems {
            class TFS_optic_AMS {
                name="TFS_optic_AMSTI";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI_khk: TFS_Item_optic_AMSTI {
        displayname="[tfs] AMS-TI (Khaki)";
        class Transportitems {
            class TFS_optic_AMS_khk {
                name="TFS_optic_AMSTI_khk";
                count=1;
            };
        };
    };
    class TFS_Item_optic_AMSTI_snd: TFS_Item_optic_AMSTI {
        displayname="[tfs] AMS-TI (Sand)";
        class Transportitems {
            class TFS_optic_AMS_snd {
                name="TFS_optic_AMSTI_snd";
                count=1;
            };
        };
    };
    
    class Box_NAto_Support_F;
    class ACE_Box_Misc: Box_NAto_Support_F {
        class Transportitems {
            class TFS_Vector_Designator {
                name="TFS_Vector_Designator_NVG";
                count=3;
            };
        };
    };
};