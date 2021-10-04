class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_Iteminfo;
    class ACE_ItemCore: CBA_MiscItem {};
    
    // MEDICAL SUPPLIES
    
    class TFS_FirstAid: ACE_ItemCore {
        scope = 2;
        author = AUTHOR;
        displayname = "$str_TFS_Supplies_Displayname";
        descriptionShort = "$str_TFS_Supplies_Description";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\firstaid.jpg";
        picture = "\z\tfs\addons\medical\supplies\data\ui\firstaid_ca.paa";
        model = "\a3\weapons_f\ammo\mag_firstaidkit.p3d";
        icon = "iconObject_1x1";
        mapsize = 0.015;
        class Iteminfo: CBA_MiscItem_Iteminfo {
            mass = 10;
        };
    };
    
    class TFS_MedicKit: ACE_ItemCore {
        scope = 2;
        author = AUTHOR;
        displayname = "$str_TFS_Supplies_MedicKitDisplayName";
        descriptionShort = "$str_TFS_Supplies_MedicKitDescription";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\medickit.jpg";
        picture = "\z\tfs\addons\medical\supplies\data\ui\medickit_ca.paa";
        model = "\a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
        icon = "iconObject_1x1";
        mapsize = 0.015;
        class Iteminfo: CBA_MiscItem_Iteminfo {
            mass = 50;
        };
    };
};