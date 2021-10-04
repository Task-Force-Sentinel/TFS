class TFS_moduleSafeZone: module_F
{
    scope = 2;
    displayname = "Safe Zone";
    icon = "\z\tfs\addons\media\images\icons\Safe_Zone.paa";
    category = "Task force Sentinel";
    function = "TFS_fnc_moduleSafeZone";
    functionpriority = 4;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class SafeZoneEnable: Checkbox
        {
            property = "TFS_SafeZoneEnable";
            displayname = "Enabled";
            tooltip = "Enable/Disable this Safe Zone module.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class SafeZonesize: Edit
        {
            property = "TFS_SafeZonesize";
            displayname = "size";
            tooltip = "Area of Safe Zone around this module in meters";
            typeName = "NUMBER";
            defaultValue = 150;
        };
        class SafeZoneDuration: Edit
        {
            property = "TFS_SafeZoneDuration";
            displayname = "Duration";
            tooltip = "How long should the safe zone be active. 0 means permanent.";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Place this module to create a Safe Zone around the module location.",
            "players will be forbidden from shooting weapons/vehicle Turrets within the safe zone area",
            "Multiple Safe Zone modules can be used with different durations."
        };
        position = 1;
        // position is taken into effect
        direction = 0;
        // direction is taken into effect
        optional = 1;
        // Synced entity is optional
        duplicate = 1;
        // Multiple entities of this type can be synced
    };
};