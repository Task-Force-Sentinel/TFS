class TFS_moduleCommstower: module_F
{
    scope = 2;
    displayname = "Comms tower";
    icon = "\z\tfs\addons\media\images\icons\radiotower.paa";
    category = "TFS_CommandCentre";
    function = "TFS_fnc_moduleCommstower";
    functionpriority = 4;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Synched objects get turned into TFAR comms towers.",
            "You can sync as many objects to this module as you like, but it's likely not necessary to have more than one."
        };
        position = 0;
        // position is taken into effect
        direction = 0;
        // direction is taken into effect
        optional = 0;
        // Synced entity is optional
        duplicate = 1;
        // Multiple entities of this type can be synced
    };
};