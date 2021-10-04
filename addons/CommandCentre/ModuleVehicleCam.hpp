class TFS_modulevehicleCam: module_F
{
    scope = 2;
    displayname = "Add vehicle Camera";
    icon = "\z\tfs\addons\media\images\icons\Camera.paa";
    category = "TFS_CommandCentre";
    function = "TFS_fnc_modulevehicleCam";
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
            "Synched vehicle can be viewed from the Command Center screens.",
            "You can sync as many vehicles to this module as you like."
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