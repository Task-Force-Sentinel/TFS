class TFS_moduleMultiScreen: module_F
{
    scope = 2;
    displayname = "setup Multi Screen";
    icon = "\z\tfs\addons\media\images\icons\MultiScreen.paa";
    category = "TFS_CommandCentre";
    function = "TFS_fnc_moduleMultiScreen";
    functionpriority = 4;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class MultiScreenCam: Checkbox
        {
            property = "TFS_MultiScreenCam";
            displayname = "Allow Helmet Cams";
            tooltip = "Allow/Disallow viewing Helmet Cams through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class MultiScreenDrone: Checkbox
        {
            property = "TFS_MultiScreenDrone";
            displayname = "Allow Drone Cams";
            tooltip = "Allow/Disallow viewing Drone Cams through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class MultiScreenSat: Checkbox
        {
            property = "TFS_MultiScreenSat";
            displayname = "Allow Satellite View";
            tooltip = "Allow/Disallow viewing Satellite imagery through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class MultiScreenselections: Edit
        {
            property = "TFS_MultiScreenselections";
            displayname = "Screen texture selections";
            tooltip = "texture selections of the multiple screens. Enter as comma-separated list, eg: '1, 2, 3'";
            defaultValue = """1, 2, 3""";
        };
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Sync multi-screen objects to this module to turn them into Command Centre screens.",
            "You can select which modules of the command centre can be viewed on the screen.",
            "You can sync as many screens to this module as you like."
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