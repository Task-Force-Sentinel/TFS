class Cfgweapons {
    class CBA_MiscItem;
    class CBA_MiscItem_Iteminfo;
    class ACE_ItemCore: CBA_MiscItem {};
    
    // MEDICAL AREA
    
    class TFS_MedicArea: ACE_ItemCore {
        scope = 2;
        author = "$str_TFS_Area_Author";
        displayname = "$str_TFS_Area_Displayname";
        descriptionShort = "$str_TFS_Area_Description";
        editorPreview = "\z\tfs\addons\medical\area\data\previews\medical_area.jpg";
        picture = "\z\tfs\addons\medical\area\data\ui\medical_area_ca.paa";
        model = "\a3\weapons_f\items\medikit.p3d";
        icon = "iconObject_1x1";
        mapsize = 0.015;
        class Iteminfo: CBA_MiscItem_Iteminfo {
            mass = 20;
        };
    };
};