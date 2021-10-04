class TFS_modulesingleScreen: module_F
{
    scope = 2;
    displayname = "setup single Screen";
    icon = "\z\tfs\addons\media\images\icons\singleScreen.paa";
    category = "TFS_CommandCentre";
    function = "TFS_fnc_modulesingleScreen";
    functionpriority = 4;
    isGlobal = 0;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class singleScreenCam: Checkbox
        {
            property = "TFS_singleScreenCam";
            displayname = "Allow Helmet Cams";
            tooltip = "Allow/Disallow viewing Helmet Cams through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class singleScreenDrone: Checkbox
        {
            property = "TFS_singleScreenDrone";
            displayname = "Allow Drone Cams";
            tooltip = "Allow/Disallow viewing Drone Cams through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class singleScreenSat: Checkbox
        {
            property = "TFS_singleScreenSat";
            displayname = "Allow Satellite View";
            tooltip = "Allow/Disallow viewing Satellite imagery through the screen.";
            typeName = "BOOL";
            defaultValue = true;
        };
        class singleScreenselection: Edit
        {
            property = "TFS_singleScreenselection";
            displayname = "Screen texture selection";
            tooltip = "texture selection of the screen, usually '0', at least for vanilla screens.";
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Sync screens to this module to turn them into Command Centre screen.",
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