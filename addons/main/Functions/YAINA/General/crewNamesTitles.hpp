class Rscstructuredtext {
    x=0;
    y=0;
    h=0.035;
    w=0.1;
    text="";
    size="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    colortext[]={
        1, 1, 1, 1
    };
    shadow=1;
    class Attributes {
        font="RobotoCondensed";
        color="#ffffff";
        colorLink="#D09B43";
        align="left";
        shadow=1;
    };
};

class RscTitles {
    class Hudnames {
        idd = -1;
        fadeout=0;
        fadein=0;
        duration = 0.1;
        name= "Hudnames";
        onload = "uiNamespace setVariable ['Hudnames', _this select 0]";
        
        class controlsBackground {
            class Hudnames_1 : Rscstructuredtext
            {
                idc = 99999;
                type = 13;
                sizeEx = 0.040;
                style = 0x00;
                x = (safeZoneX + 0.015);
                y = (safeZoneY + 0.485);
                w = 0.4;
                h = 0.65;
                colortext[] = {
                    1, 1, 1, 1
                };
                lineSpacing = 3;
                colorBackground[] = {
                    0, 0, 0, 0
                };
                text = "";
                font = "PuristaLight";
                shadow = 2;
                class Attributes {
                    align = "left";
                };
            };
        };
    };
};