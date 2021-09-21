class ctrlMenuStrip;
class display3DEN
{
    class Controls
    {
        class MenuStrip : ctrlMenuStrip
        {
            class Items
            {
                class TFSRHS_Folder {
                    items[] += {"TFSRHS_Spectator_Settings"};
                };
                class TFSRHS_Spectator_Settings
                {
                    text = "TFSRHS Spectator Settings";
                    action = "edit3DENMissionAttributes 'TFSRHS_Spectator_Settings';";
                    picture = "\z\tfsrhs\addons\media\images\Icons\icon_gear_ca.paa";
                };
            };
        };
    };
};