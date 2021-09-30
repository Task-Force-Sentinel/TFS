class CfgVehicles {
    class Flag_White_F;
    class TFS_Flag_White: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\tfs\addons\media\images\TFSFLAG1.paa";
        _generalMacro="TFS_Flag_White";
        displayName="Flag (Last Resort Gaming, White)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\tfs\addons\media\images\TFSFLAG1.paa""";
        };
    };
    class TFS_Flag_Black: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\tfs\addons\media\images\TFSFLAG1.paa";
        _generalMacro="TFS_Flag_Black";
        displayName="Flag (Last Resort Gaming, Black)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\tfs\addons\media\images\TFSFLAG1.paa""";
        };
    };
};
