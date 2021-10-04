class TFS_moduleIED: module_F
{
    scope = 2;
    displayname = "Create IED";
    icon = "a3\ui_f\data\GUI\Cfg\hints\IEDs_CA.paa";
    // todo: find better icon
    category = "Task force Sentinel";
    function = "TFS_fnc_moduleMakeIED";
    functionpriority = 2;
    isGlobal = 1;
    istriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 0;
    class Attributes: AttributesBase
    {
        class Dettime: Edit
        {
            property = "TFS_IED_Dettime";
            displayname = "Detonation Delay";
            tooltip = "time in seconds until the IED explodes after being triggered";
            typeName = "NUMBER";
            defaultValue = 120;
        };
        
        class Proxradius: Edit
        {
            property = "TFS_IED_Proxradius";
            displayname = "Trigger Proximity radius";
            description = "radius in m around the IED where players will trigger the detonation timer";
            typeName = "Number";
            defaultValue = 20;
        };
        class Secondaries: Checkbox
        {
            property = "TFS_IED_Secondaries";
            displayname = "Secondary explosions";
            description = "Enable/disable random secondary explosives around the IED";
            defaultValue = true;
        };
        class Announce: Checkbox
        {
            property = "TFS_IED_Announce";
            displayname = "Announcements";
            description = "Enable/disable announcements when the IED is triggered, when it explodes and in certain intervals during the detonation countdown (see Announce interval)";
            defaultValue = false;
        };
        class Anninterval: Edit
        {
            property = "TFS_IED_Anninterval";
            displayname = "Announce interval";
            description = "interval in seconds between announcements, ignore if 'Announcements' are disabled";
            typeName = "Number";
            defaultValue = 30;
        };
        class ReqDefKit: Checkbox
        {
            property = "TFS_IED_ReqDefKit";
            displayname = "Require Defusal Kit";
            description = "if enabled, players require an ACE defusal kit in order to be able to defuse the IED";
            defaultValue = true;
        };
        
        class moduleDescription: moduleDescription{};
    };
    class moduleDescription: moduleDescription
    {
        description[] = {
            "Place this module to turn synched objects into IEDs",
            "Multiple objects can be synched to this module",
            "ACE3 is required for this system to work",
            "The IEDs can be detected using an ACE3 mine detector"
        };
        position = 0;
        direction = 0;
        optional = 1;
        duplicate = 1;
    };
};