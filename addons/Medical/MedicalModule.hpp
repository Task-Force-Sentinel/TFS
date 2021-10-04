class TFS_moduleMedical: module_F
{
    scope = 2;
    displayname = "Medical Facility";
    icon = "\z\tfs\addons\media\images\icons\Medical Area.paa";
    category = "Task force Sentinel";
    function = "TFS_fnc_moduleMedicalFacility";
    functionpriority = 4;
    isGlobal = 1;
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
            "Sync this module to a building/object to create an Emergency Medical Facility within that location.",
            "The module will heal/revive anyone that enters the object area.",
            "This module is designed to be used with @ACE.",
            "This module can be synced to multiple objects or multiple modules can be used."
        };
        position = 0;
        // position is taken into effect
        direction = 0;
        // direction is taken into effect
        optional = 1;
        // Synced entity is optional
        duplicate = 1;
        // Multiple entities of this type can be synced
    };
};