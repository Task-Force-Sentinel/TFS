class CfgWeapons {
    
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore: CBA_MiscItem {};
    
    // MEDICAL SUPPLIES
    
    class TFS_FirstAid: ACE_ItemCore {
        scope = 2;
        author = "$STR_TFS_Medical_Supplies_Author";
        displayName = "$STR_TFS_Item_Medical_FirstAid_DisplayName";
        descriptionShort = "$STR_TFS_Item_Medical_FirstAid_Description";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\firstaid.jpg";
        picture = "\z\tfs\addons\medical\supplies\data\ui\firstaid_ca.paa";
        model = "\a3\weapons_f\ammo\mag_firstaidkit.p3d";
        icon = "iconObject_1x1";
        mapSize = 0.015;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    
    class TFS_MedicKit: ACE_ItemCore {
        scope = 2;
        author = "$STR_TFS_Medical_Supplies_Author";
        displayName = "$STR_TFS_Item_Medical_MedicKit_DisplayName";
        descriptionShort = "$STR_TFS_Item_Medical_MedicKit_Description";
        editorPreview = "\z\tfs\addons\medical\supplies\data\previews\medickit.jpg";
        picture = "\z\tfs\addons\medical\supplies\data\ui\medickit_ca.paa";
        model = "\a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
        icon = "iconObject_1x1";
        mapSize = 0.015;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };
    
};
