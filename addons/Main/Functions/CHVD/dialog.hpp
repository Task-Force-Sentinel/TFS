#define CHVD_GUI_GRID_X (0)
#define CHVD_GUI_GRID_Y (0)
#define CHVD_GUI_GRID_W (0.025)
#define CHVD_GUI_GRID_H (0.04)
#define CHVD_GUI_GRID_Wabs (1)
#define CHVD_GUI_GRID_Habs (1)

class CHVD_rscXSliderH
{
    style="0x400 + 0x10";
    shadow=0;
    x=0;
    y=0;
    h=0.029412;
    w=0.40000001;
    color[]={
        1, 1, 1, 0.60000002
    };
    colorActive[]={
        1, 1, 1, 1
    };
    colorDisabled[]={
        1, 1, 1, 0.2
    };
    arrowEmpty="\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull="\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border="\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb="\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
};
class CHVD_rscCheckbox
{
    type=77;
    style=0;
    checked=0;
    x="0.375 * safeZoneW + safeZoneX";
    y="0.36 * safeZoneH + safeZoneY";
    w="0.025 * safeZoneW";
    h="0.04 * safeZoneH";
    color[]={
        1, 1, 1, 0.69999999
    };
    colorFocused[]={
        1, 1, 1, 1
    };
    colorHover[]={
        1, 1, 1, 1
    };
    colorPressed[]={
        1, 1, 1, 1
    };
    colorDisabled[]={
        1, 1, 1, 0.2
    };
    colorBackground[]={
        0, 0, 0, 0
    };
    colorBackgroundFocused[]={
        0, 0, 0, 0
    };
    colorBackgroundHover[]={
        0, 0, 0, 0
    };
    colorBackgroundPressed[]={
        0, 0, 0, 0
    };
    colorBackgroundDisabled[]={
        0, 0, 0, 0
    };
    textureChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
    soundEnter[]=
    {
        "",
        0.1,
        1
    };
    soundPush[]=
    {
        "",
        0.1,
        1
    };
    soundClick[]=
    {
        "",
        0.1,
        1
    };
    soundEscape[]=
    {
        "",
        0.1,
        1
    };
};
class CHVD_rscButton
{
    type=16;
    style="0x02 + 0xC0";
    default=0;
    shadow=0;
    x=0;
    y=0;
    w=0.095588997;
    h=0.039216001;
    animtextureNormal="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureDisabled="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureOver="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureFocused="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtexturePressed="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtexturedefault="#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    colorBackground[]={
        0, 0, 0, 0.80000001
    };
    colorBackgroundFocused[]={
        1, 1, 1, 1
    };
    colorBackground2[]={
        0.75, 0.75, 0.75, 1
    };
    color[]={
        1, 1, 1, 1
    };
    colorFocused[]={
        0, 0, 0, 1
    };
    color2[]={
        0, 0, 0, 1
    };
    colortext[]={
        1, 1, 1, 1
    };
    colorDisabled[]={
        1, 1, 1, 0.25
    };
    period=1.2;
    periodFocus=1.2;
    periodover=1.2;
    size="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
    font="PuristaLight";
    class textPos
    {
        left="0.25 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
        top="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) - ( ( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right=0.0049999999;
        bottom=0;
    };
    class Attributes
    {
        font="PuristaLight";
        color="#E5E5E5";
        align="left";
        shadow="false";
    };
    class ShortcutPos
    {
        left="(6.25 * ( ((safeZoneW / safeZoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top=0.0049999999;
        w=0.022500001;
        h=0.029999999;
    };
    soundEnter[]=
    {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
        0.090000004,
        1
    };
    soundPush[]=
    {
        "\A3\ui_f\data\sound\RscButtonMenu\soundPush",
        0.090000004,
        1
    };
    soundClick[]=
    {
        "\A3\ui_f\data\sound\RscButtonMenu\soundClick",
        0.090000004,
        1
    };
    soundEscape[]=
    {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
        0.090000004,
        1
    };
    textureNoShortcut="#(argb, 8, 8, 3)color(0, 0, 0, 0)";
    class HitZone
    {
        left=0;
        top=0;
        right=0;
        bottom=0;
    };
    class Attributesimage
    {
        font="PuristaMedium";
        color="#E5E5E5";
        align="left";
    };
};
class CHVD_rsctext
{
    type = 0;
    x=0;
    y=0;
    h=0.037;
    w=0.30000001;
    style=0;
    shadow=0;
    colorShadow[]={
        0, 0, 0, 0.5
    };
    font="PuristaMedium";
    size="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    colortext[]={
        1, 1, 1, 1
    };
    colorBackground[]={
        0, 0, 0, 0
    };
    linespacing=1;
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
    text = "";
};
class CHVD_rsctextRight
{
    type = 0;
    x=0;
    y=0;
    h=0.037;
    w=0.30000001;
    style=0x01;
    shadow=0;
    colorShadow[]={
        0, 0, 0, 0.5
    };
    font="PuristaMedium";
    size="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    colortext[]={
        1, 1, 1, 1
    };
    colorBackground[]={
        0, 0, 0, 0
    };
    linespacing=1;
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
    text = "";
};
class CHVD_rscFrame
{
    type = 0;
    idc = -1;
    style = 0;
    shadow = 1;
    colorBackground[] =
    {
        0,
        0,
        0,
        0
    };
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};
class CHVD_rscXlistBox
{
    deletable = 0;
    fade = 0;
    idc = -1;
    type = 42;
    x = 0.1;
    y = 0.1;
    color[] = {
        1, 1, 1, 0.6
    };
    colorActive[] = {
        1, 1, 1, 1
    };
    colorDisabled[] = {
        1, 1, 1, 0.25
    };
    colorselect[] = {
        0.95, 0.95, 0.95, 1
    };
    colortext[] = {
        1, 1, 1, 1
    };
    soundselect[] = {
        "\A3\ui_f\data\sound\Rsclistbox\soundselect", 0.09, 1
    };
    colorpicture[] = {
        1, 1, 1, 1
    };
    colorpictureselected[] = {
        1, 1, 1, 1
    };
    colorpictudeDisabled[] = {
        1, 1, 1, 0.25
    };
    tooltipColortext[] = {
        1, 1, 1, 1
    };
    tooltipColorBox[] = {
        1, 1, 1, 1
    };
    tooltipColorShade[] = {
        0, 0, 0, 0.65
    };
    style = "0x400 + 0x02 + 0x10";
    shadow = 2;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    w = 0.14706;
    h = 0.039216;
    font = "PuristaMedium";
    sizeEx = "(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    colorpictureDisabled[] = {
        1, 1, 1, 1
    };
};
class CHVD_rscEdit
{
    type=2;
    style="0x40";
    autocomplete = "";
    font="PuristaMedium";
    shadow=2;
    sizeEx="(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    colorBackground[]={
        0, 0, 0, 1
    };
    colortext[]={
        0.94999999, 0.94999999, 0.94999999, 1
    };
    colorDisabled[]={
        1, 1, 1, 0.25
    };
    colorselection[]=
    {
        "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.69])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.75])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.5])",
        1
    };
    canmodify=1;
    tooltipColortext[]={
        1, 1, 1, 1
    };
    tooltipColorBox[]={
        1, 1, 1, 1
    };
    tooltipColorShade[]={
        0, 0, 0, 0.64999998
    };
    text = "";
};
class CHVD_dialog
{
    idd = 2900;
    movingEnable = false;
    moving = 1;
    onload = "[_this] call CHVD_fnc_localize";
    onUnload = "";
    
    class controlsBackground
    {
        class CHVD_rscBackground: CHVD_rscFrame
        {
            idc = 1800;
            
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 1.1 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 24.5 * CHVD_GUI_GRID_W;
            h = 22.4 * CHVD_GUI_GRID_H;
            colorBackground[] = {
                0, 0, 0, 0.7
            };
        };
        class CHVD_rscTitle: CHVD_rsctext
        {
            idc = 1000;
            
            text = "VIEW distance setTinGS";
            // --- todo: localize;
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 0 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 24.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
            colorBackground[] = {
                "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A', 0.7])"
            };
        };
        class CHVD_rscFootHeadertext: CHVD_rsctextRight
        {
            idc = 1001;
            
            text = "ON FOOT";
            // --- todo: localize;
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 1.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 7 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
            colorBackground[] = {
                0, 0, 0, 1
            };
        };
        class CHVD_rscFootViewtext: CHVD_rsctextRight
        {
            idc = 1002;
            
            text = "VIEW:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 2.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootobjtext: CHVD_rsctextRight
        {
            idc = 1003;
            
            text = "OBJECT:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 4.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootTerraintext: CHVD_rsctextRight
        {
            idc = 1005;
            
            text = "TERrain:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 7.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarHeadertext: CHVD_rsctextRight
        {
            idc = 1008;
            
            text = "in CAR";
            // --- todo: localize;
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 8.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 7 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
            colorBackground[] = {
                0, 0, 0, 1
            };
        };
        class CHVD_rscCarViewtext: CHVD_rsctextRight
        {
            idc = 1010;
            
            text = "VIEW:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 10 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirObjtext: CHVD_rsctextRight
        {
            idc = 1011;
            
            text = "OBJECT:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 18.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarTerraintext: CHVD_rsctextRight
        {
            idc = 1012;
            
            text = "TERrain:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 14.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirHeadertext: CHVD_rsctextRight
        {
            idc = 1015;
            
            text = "in AIR";
            // --- todo: localize;
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 16 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 7 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
            colorBackground[] = {
                0, 0, 0, 1
            };
        };
        class CHVD_rscAirViewtext: CHVD_rsctextRight
        {
            idc = 1016;
            
            text = "VIEW:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 17.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirTerraintext: CHVD_rsctextRight
        {
            idc = 1019;
            
            text = "TERrain:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 21.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarObjtext: CHVD_rsctextRight
        {
            idc = 1021;
            
            text = "OBJECT:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 11.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootSynctext: CHVD_rsctextRight
        {
            idc = 1403;
            
            text = "SYNC modE:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 5.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarSynctext: CHVD_rsctextRight
        {
            idc = 1405;
            
            text = "SYNC modE:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 13 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirSynctext: CHVD_rsctextRight
        {
            idc = 1407;
            
            text = "SYNC modE:";
            // --- todo: localize;
            x = 7.5 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 20.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 6.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
    };
    class controls
    {
        class CHVD_rscFootViewSlider: CHVD_rscXSliderH
        {
            idc = 1900;
            type = 43;
            onSliderPosChanged = "['CHVD_foot', _this select 0, _this select 1, 1006, 'CHVD_footobj', 1901, 1007, 'CHVD_footSyncmode', 'CHVD_footSyncPercentage'] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 2.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootobjSlider: CHVD_rscXSliderH
        {
            idc = 1901;
            type = 43;
            onSliderPosChanged = "['CHVD_footobj', _this select 0, _this select 1, 1007] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 4.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarViewSlider: CHVD_rscXSliderH
        {
            idc = 1902;
            type = 43;
            onSliderPosChanged = "['CHVD_car', _this select 0, _this select 1, 1013, 'CHVD_carObj', 1903, 1014, 'CHVD_carSyncmode', 'CHVD_carSyncPercentage'] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 10 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarObjSlider: CHVD_rscXSliderH
        {
            idc = 1903;
            type = 43;
            onSliderPosChanged = "['CHVD_carObj', _this select 0, _this select 1, 1014] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 11.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirViewSlider: CHVD_rscXSliderH
        {
            idc = 1904;
            type = 43;
            onSliderPosChanged = "['CHVD_air', _this select 0, _this select 1, 1017, 'CHVD_airObj', 1905, 1018, 'CHVD_airSyncmode', 'CHVD_airSyncPercentage'] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 17.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirObjSlider: CHVD_rscXSliderH
        {
            idc = 1905;
            type = 43;
            onSliderPosChanged = "['CHVD_airObj', _this select 0, _this select 1, 1018] call CHVD_fnc_onSliderChange";
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 18.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootviewDistance: CHVD_rscEdit
        {
            idc = 1006;
            onKeydown = "['CHVD_foot', 1900, _this select 0, 'CHVD_footobj', 1901, 1007, 'CHVD_footSyncmode', 'CHVD_footSyncPercentage'] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 2.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscFootobjdistance: CHVD_rscEdit
        {
            idc = 1007;
            onKeydown = "['CHVD_footobj', 1901, _this select 0] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 4.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarviewDistance: CHVD_rscEdit
        {
            idc = 1013;
            onKeydown = "['CHVD_car', 1902, _this select 0, 'CHVD_carObj', 1903, 1014, 'CHVD_carSyncmode', 'CHVD_carSyncPercentage'] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 10 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscCarObjdistance: CHVD_rscEdit
        {
            idc = 1014;
            onKeydown = "['CHVD_carObj', 1903, _this select 0] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 11.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirviewDistance: CHVD_rscEdit
        {
            idc = 1017;
            onKeydown = "['CHVD_air', 1904, _this select 0, 'CHVD_airObj', 1905, 1018, 'CHVD_airSyncmode', 'CHVD_airSyncPercentage'] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 17.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscAirObjdistance: CHVD_rscEdit
        {
            idc = 1018;
            onKeydown = "['CHVD_airObj', 1905, _this select 0] call CHVD_fnc_onEBinput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 18.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_rscClose: CHVD_rscButton
        {
            idc = 1612;
            onButtonClick = "closedialog 2900";
            
            text = "Close";
            // --- todo: localize;
            x = 7 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 23.53 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 24.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_footTerrainlistbox: CHVD_rscXlistBox
        {
            idc = 1500;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 7.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_carTerrainlistbox: CHVD_rscXlistBox
        {
            idc = 1501;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 14.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_airTerrainlistbox: CHVD_rscXlistBox
        {
            idc = 1502;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 21.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        
        class CHVD_footTerrainEdit: CHVD_rscEdit
        {
            idc = 1400;
            onKeydown = "['CHVD_footTerrain', 1400, 1500] call CHVD_fnc_onEBterraininput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 7.2 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_carTerrainEdit: CHVD_rscEdit
        {
            idc = 1401;
            onKeydown = "['CHVD_carTerrain', 1401, 1501] call CHVD_fnc_onEBterraininput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 14.5 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_airTerrainEdit: CHVD_rscEdit
        {
            idc = 1402;
            onKeydown = "['CHVD_airTerrain', 1402, 1502] call CHVD_fnc_onEBterraininput";
            maxChars = 5;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 21.9 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_footSynclistbox: CHVD_rscXlistBox
        {
            idc = 1404;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 5.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_carSynclistbox: CHVD_rscXlistBox
        {
            idc = 1406;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 13 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_airSynclistbox: CHVD_rscXlistBox
        {
            idc = 1408;
            
            x = 14 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 20.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 12.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_footSyncEdit: CHVD_rscEdit
        {
            idc = 1410;
            maxChars = 4;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 5.7 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_carSyncEdit: CHVD_rscEdit
        {
            idc = 1409;
            maxChars = 4;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 13 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
        class CHVD_airSyncEdit: CHVD_rscEdit
        {
            idc = 1411;
            maxChars = 4;
            
            x = 27 * CHVD_GUI_GRID_W + CHVD_GUI_GRID_X;
            y = 20.4 * CHVD_GUI_GRID_H + CHVD_GUI_GRID_Y;
            w = 3.5 * CHVD_GUI_GRID_W;
            h = 1 * CHVD_GUI_GRID_H;
        };
    };
};