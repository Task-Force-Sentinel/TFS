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
                    items[] += {"TFSRHS_Briefing"};
                };
                class TFSRHS_Briefing
                {
                    text = "TFSRHS Briefing Settings";
                    action = "edit3DENMissionAttributes 'TFSRHS_MissionBriefingAttributes';";
                    //picture = "\z\tfsrhs\addons\media\images\Icons\icon_gear_ca";
                };
            };
        };
    };
};