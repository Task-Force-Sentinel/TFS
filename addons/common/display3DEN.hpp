class ctrlMenuStrip;
class ctrlControlsGroupNoScrollbars;
class ctrlCheckboxToolbar;
class Separator1;

class display3DEN
{
    class Controls
    {
        class MenuStrip : ctrlMenuStrip
        {
            class Items
            {
                items[] += {"TFS_Folder"};
                class TFS_Folder {
                    text = "TFS";
                    items[] = {"TFS_Documentation"};
                };
                class TFS_Documentation
                {
                    text = "TFS Wiki (WIP)"; // engine adds ... to links
                    data = "HelpFeedback";
                    picture = "\a3\3DEN\Data\Controls\ctrlMenu\link_ca.paa";
                    weblink = "https://armadocs.purplesmoke.info/";
                    opensNewWindow = 1;
                };
            };
        };
        class Toolbar : ctrlControlsGroupNoScrollbars{
            class Controls {
                class Separator3: Separator1
                {
                    colorBackground[]={0,0,0,0.5};
                    x="33.5 *     (    5 * (pixelW * pixelGrid *     0.50))";
                    y="1 * (pixelH * pixelGrid *     0.50)";
                    w="pixelW";
                    h="(    5 * (pixelH * pixelGrid *     0.50))";
                };
                class TFS_Toolbar_Controls : ctrlControlsGroupNoScrollbars {
                    idc=-1;
                    x="34.5 * (5 * (pixelW * pixelGrid *     0.50))";
                    y="1 * (pixelH * pixelGrid *     0.50)";
                    w="5 *     (    5 * (pixelW * pixelGrid *     0.50))";
                    h="(    5 * (pixelH * pixelGrid *     0.50))";
                    class Controls
                    {
                        class Garrison: ctrlCheckboxToolbar
                        {
                            idc=-1;
                            onCheckedChanged=QUOTE(GVAR(Garrison) = !GVAR(Garrison));
                            onLoad="uiNamespace setVariable [""TFS_common_GarrisonControl"",_this select 0]; tfs_common_Garrison = false";
                            x="0 *     (    5 * (pixelW * pixelGrid *     0.50))";
                            y=0;
                            h="(    5 * (pixelH * pixelGrid *     0.50))";
                            w="(    5 * (pixelW * pixelGrid *     0.50))";
                            tooltip="TFS: Toggle garrison on dragging units";
                            textureChecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureUnchecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureFocusedChecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureFocusedUnchecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureHoverChecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureHoverUnchecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            texturePressedChecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            texturePressedUnchecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureDisabledChecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                            textureDisabledUnchecked="\z\tfs\addons\media\images\TFSLOGO@0.25x.paa";
                        };
                    };
                };
            };
        };
    };
};


