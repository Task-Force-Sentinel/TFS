class CfgVehicles {
    class Flag_White_F;
    class TFSRHS_Flag_White: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\tfsrhs\addons\media\images\tpflag.paa";
        _generalMacro="TFSRHS_Flag_White";
        displayName="Flag (Last Resort Gaming, White)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\tfsrhs\addons\media\images\tpflag.paa""";
        };
    };
    class TFSRHS_Flag_Black: Flag_White_F
    {
        author="Mokka";

        editorPreview="\z\tfsrhs\addons\media\images\tpflag.paa";
        _generalMacro="TFSRHS_Flag_Black";
        displayName="Flag (Last Resort Gaming, Black)";
        class EventHandlers
        {
            init="(_this select 0) setFlagTexture ""\z\tfsrhs\addons\media\images\tpflag.paa""";
        };
    };
};
