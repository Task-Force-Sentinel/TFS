class CfgWeapons {
    
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore: CBA_MiscItem {};
    
    // MEDICAL AREA
    
    class TFS_MedicArea: ACE_ItemCore {
        scope = 2;
        author = "$STR_TFS_Area_Author";
        displayName = "$STR_TFS_Area_DisplayName";
        descriptionShort = "$STR_TFS_Area_Description";
        editorPreview = "\z\tfs\addons\medical\area\data\previews\medical_area.jpg";
        picture = "\z\tfs\addons\medical\area\data\ui\medical_area_ca.paa";
        model = "\a3\weapons_f\items\medikit.p3d";
        icon = "iconObject_1x1";
        mapSize = 0.015;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };
    
};
