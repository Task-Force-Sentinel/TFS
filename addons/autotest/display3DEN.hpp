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
                    items[] += {"TFS_AutoTest"};
                };
                class TFS_AutoTest
                {
                    text = "TFS Autotest";
                    action = "edit3DENMissionAttributes 'TFS_AutoTestAttributes';";
                    //picture = "\z\tfs\addons\media\images\Icons\icon_gear_ca";
                };
            };
        };
    };
};