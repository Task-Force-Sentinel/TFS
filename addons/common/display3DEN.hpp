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
                items[] += {"TFSRHS_Folder"};
                class TFSRHS_Folder {
                    text = "TFSRHS";
                    items[] = {"TFSRHS_Documentation"};
                };
                class TFSRHS_Documentation
                {
                    text = "TFSRHS Wiki (WIP)"; // engine adds ... to links
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
                class TFSRHS_Toolbar_Controls : ctrlControlsGroupNoScrollbars {
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
                            onLoad="uiNamespace setVariable [""TFSRHS_common_GarrisonControl"",_this select 0]; tfsrhs_common_Garrison = false";
                            x="0 *     (    5 * (pixelW * pixelGrid *     0.50))";
                            y=0;
                            h="(    5 * (pixelH * pixelGrid *     0.50))";
                            w="(    5 * (pixelW * pixelGrid *     0.50))";
                            tooltip="TFSRHS: Toggle garrison on dragging units";
                            textureChecked="\z\tfsrhs\addons\media\images\logo_tfsrhs_small_glow_ca.paa";
                            textureUnchecked="\z\tfsrhs\addons\media\images\logo_sm_ca.paa";
                            textureFocusedChecked="\z\tfsrhs\addons\media\images\logo_tfsrhs_small_glow_ca.paa";
                            textureFocusedUnchecked="\z\tfsrhs\addons\media\images\logo_sm_ca.paa";
                            textureHoverChecked="\z\tfsrhs\addons\media\images\logo_tfsrhs_small_glow_ca.paa";
                            textureHoverUnchecked="\z\tfsrhs\addons\media\images\logo_sm_ca.paa";
                            texturePressedChecked="\z\tfsrhs\addons\media\images\logo_tfsrhs_small_glow_ca.paa";
                            texturePressedUnchecked="\z\tfsrhs\addons\media\images\logo_sm_ca.paa";
                            textureDisabledChecked="\z\tfsrhs\addons\media\images\logo_tfsrhs_small_glow_ca.paa";
                            textureDisabledUnchecked="\z\tfsrhs\addons\media\images\logo_sm_ca.paa";
                        };
                    };
                };
            };
        };
    };
};


