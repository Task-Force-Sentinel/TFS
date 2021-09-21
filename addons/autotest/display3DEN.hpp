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
                    items[] += {"TFSRHS_AutoTest"};
                };
                class TFSRHS_AutoTest
                {
                    text = "TFSRHS Autotest";
                    action = "edit3DENMissionAttributes 'TFSRHS_AutoTestAttributes';";
                    //picture = "\z\tfsrhs\addons\media\images\Icons\icon_gear_ca";
                };
            };
        };
    };
};