class ctrlMenuStrip;
class display3DEN
{
    class Controls
    {
        class MenuStrip : ctrlMenuStrip
        {
            class Items
            {
                class TFS_Folder {
                    items[] += {"TFS_Spectator_Settings"};
                };
                class TFS_Spectator_Settings
                {
                    text = "TFS Spectator Settings";
                    action = "edit3DENMissionAttributes 'TFS_Spectator_Settings';";
                    picture = "\z\tfs\addons\media\images\Icons\icon_gear_ca.paa";
                };
            };
        };
    };
};