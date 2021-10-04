class TFS_moduleStationaryradio: module_F
{
    scope = 2;
    displayname = "setup Stationary radio";
    icon = "\z\tfs\addons\media\images\icons\Stationaryradio.paa";
    // todo: proper icon
    category = "TFS_CommandCentre";
    function = "TFS_fnc_moduleStationaryradio";
    functionpriority = 4;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class StationaryradioOn: Checkbox
        {
            property = "TFS_StationaryradioOn";
            displayname = "Turn radio On";
            tooltip = "if enabled, the radio will be turned on on Mission Start.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class StationaryradioCh1: Edit
        {
            property = "TFS_StationaryradioCh1";
            displayname = "Channel 1 Freq.";
            tooltip = "default frequency for Channel 1. Can be changed later.";
            typeName = "NUMBER";
            defaultValue = 30;
        };
        class StationaryradioCh2: Edit
        {
            property = "TFS_StationaryradioCh2";
            displayname = "Channel 2 Freq.";
            tooltip = "default frequency for Channel 2. Can be changed later.";
            typeName = "NUMBER";
            defaultValue = 40;
        };
        class StationaryradioVol: Edit
        {
            property = "TFS_StationaryradioVol";
            displayname = "speaker Volume";
            tooltip = "default volume of the radio. Can be changed later. Value between 1 and 10.";
            typeName = "NUMBER";
            defaultValue = 7;
        };
        class StationaryradioClass: Edit
        {
            property = "TFS_StationaryradioClass";
            displayname = "radio Class name";
            tooltip = "classname of the radio to spawn in, only change this when you want the radio to work with non-blufor nets.";
            defaultValue = """TFAR_anarc210""";
        };
        class StationaryradioCode: Edit
        {
            property = "TFS_StationaryradioCode";
            displayname = "radio Encryption Code";
            tooltip = "Encryption code of the radio. Only change this if you know what you're doing.";
            defaultValue = """_bluefor""";
        };
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Synched objects will turn into a stationary radio which allows monitoring frequencies over speaker.",
            "You can set the starting parameters for the radio, but they can be changed later.",
            "You can sync multiple objects to this module."
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