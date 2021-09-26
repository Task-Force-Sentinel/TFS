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
                    items[] += {"TFS_Briefing"};
                };
                class TFS_Briefing
                {
                    text = "TFS Briefing Settings";
                    action = "edit3DENMissionAttributes 'TFS_MissionBriefingAttributes';";
                    //picture = "\z\tfs\addons\media\images\Icons\icon_gear_ca";
                };
            };
        };
    };
};