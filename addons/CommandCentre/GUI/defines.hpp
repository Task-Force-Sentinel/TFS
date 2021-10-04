// Styles

// Control types
#define CT_STATIC 0
#define CT_BUTtoN 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_listBOX 5
#define CT_toOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVEtext 11
#define CT_TREE 12
#define CT_strUCTURED_text 13
#define CT_CONtext_MENU 14
#define CT_CONTROLS_group 15
#define CT_SHorTCUTBUTtoN 16
#define CT_XKEYDESC 40
#define CT_XBUTtoN 41
#define CT_XlistBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_animateD_textURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAinER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_lineBreak 98
#define CT_USER 99
#define CT_MAP 100
#define CT_MAP_MAin 101
#define CT_listNBOX 102
#define CT_CHECKBOX 77

// Static styles
#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_doWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0C

#define ST_type 0xF0
#define ST_sinGLE 0x00
#define ST_MULTI 0x10
#define ST_TITLE_BAR 0x20
#define ST_piCTURE 0x30
#define ST_FRAME 0x40
#define ST_BACKGround 0x50
#define ST_group_BOX 0x60
#define ST_group_BOX2 0x70
#define ST_HUD_BACKGround 0x80
#define ST_TILE_piCTURE 0x90
#define ST_with_RECT 0xA0
#define ST_LinE 0xB0

#define ST_SHAdoW 0x100
#define ST_NO_RECT 0x200
#define ST_KEEP_ASPECT_RATIO 0x800

#define ST_TITLE ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HorZ 0x400

#define SL_textURES 0x10

// progress bar
#define ST_VERTICAL 0x01
#define ST_HorIZONTAL 0

// listbox styles
#define LB_textURES 0x10
#define LB_MULTI 0x20

// Tree styles
#define TR_SHOWROOT 1
#define TR_AUtoCOLLAPSE 2

// MessageBox styles
#define MB_BUTtoN_OK 1
#define MB_BUTtoN_CANCEL 2
#define MB_BUTtoN_USER 4

#define GUI_GRID_CENTER_X ((safeZoneX + (safeZoneW - ((safeZoneW / safeZoneH) min 1.2))/2))
#define GUI_GRID_CENTER_Y ((safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2))
#define GUI_GRID_CENTER_W ((((safeZoneW / safeZoneH) min 1.2) / 40))
#define GUI_GRID_CENTER_H (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))
#define GUI_GRID_CENTER_Wabs (((safeZoneW / safeZoneH) min 1.2))
#define GUI_GRID_CENTER_Habs ((((safeZoneW / safeZoneH) min 1.2) / 1.2))

// Base Classes

class TFS_CC_Rsctext
{
    deletable = 0;
    fade = 0;
    type = 0;
    idc = -1;
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
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 0;
    shadow = 1;
    colorShadow[] =
    {
        0,
        0,
        0,
        0.5
    };
    font = "RobotoCondensed";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
};
class TFS_CC_Rscstructuredtext
{
    deletable = 0;
    fade = 0;
    type = 13;
    idc = -1;
    style = 0;
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    class Attributes
    {
        font = "RobotoCondensed";
        color = "#ffffff";
        colorLink = "#D09B43";
        align = "left";
        shadow = 1;
    };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(( ( ((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 1;
};
class TFS_CC_Rscpicture
{
    deletable = 0;
    fade = 0;
    type = 0;
    idc = -1;
    style = 48;
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
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
};
class TFS_CC_RscEdit
{
    deletable = 0;
    fade = 0;
    type = 2;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] =
    {
        0,
        0,
        0,
        0
    };
    colortext[] =
    {
        0.95,
        0.95,
        0.95,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorselection[] =
    {
        "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",
        1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    style = "0x00 + 0x40";
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    canmodify = 1;
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
};
class TFS_CC_RscCombo
{
    deletable = 0;
    fade = 0;
    type = 4;
    colorselect[] =
    {
        0,
        0,
        0,
        1
    };
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    colorBackground[] =
    {
        0,
        0,
        0,
        1
    };
    colorScrollbar[] =
    {
        1,
        0,
        0,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorpicture[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureselected[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorpictureRight[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureRightselected[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureRightDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colortextRight[] =
    {
        1,
        1,
        1,
        1
    };
    colorselectRight[] =
    {
        0,
        0,
        0,
        1
    };
    colorselect2Right[] =
    {
        0,
        0,
        0,
        1
    };
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
    maxHistoryDelay = 1;
    class ComboScrollBar
    {
        color[] =
        {
            1,
            1,
            1,
            1
        };
    };
    style = "0x10 + 0x200";
    font = "RobotoCondensed";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    colorselectBackground[] =
    {
        1,
        1,
        1,
        0.7
    };
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45;
    colorActive[] =
    {
        1,
        0,
        0,
        1
    };
};
class TFS_CC_RsclistBox
{
    deletable = 0;
    fade = 0;
    type = 5;
    rowHeight = 0;
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorScrollbar[] =
    {
        1,
        0,
        0,
        0
    };
    colorselect[] =
    {
        0,
        0,
        0,
        1
    };
    colorselect2[] =
    {
        0,
        0,
        0,
        1
    };
    colorselectBackground[] =
    {
        0.95,
        0.95,
        0.95,
        1
    };
    colorselectBackground2[] =
    {
        1,
        1,
        1,
        0.5
    };
    colorBackground[] =
    {
        0,
        0,
        0,
        0.3
    };
    autoScrollspeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    arrowFull = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    colorpicture[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureselected[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorpictureRight[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureRightselected[] =
    {
        1,
        1,
        1,
        1
    };
    colorpictureRightDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colortextRight[] =
    {
        1,
        1,
        1,
        1
    };
    colorselectRight[] =
    {
        0,
        0,
        0,
        1
    };
    colorselect2Right[] =
    {
        0,
        0,
        0,
        1
    };
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
    class listScrollBar
    {
        color[] =
        {
            1,
            1,
            1,
            1
        };
        autoScrollEnabled = 1;
    };
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
    style = 16;
    font = "RobotoCondensed";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 0;
    colorShadow[] =
    {
        0,
        0,
        0,
        0.5
    };
    period = 1.2;
    maxHistoryDelay = 1;
};
class TFS_CC_RscButton
{
    deletable = 0;
    fade = 0;
    type = 1;
    text = "";
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorBackground[] =
    {
        0,
        0,
        0,
        0.5
    };
    colorBackgroundDisabled[] =
    {
        0,
        0,
        0,
        0.5
    };
    colorBackgroundActive[] =
    {
        0,
        0,
        0,
        1
    };
    colorFocused[] =
    {
        0,
        0,
        0,
        1
    };
    colorShadow[] =
    {
        0,
        0,
        0,
        0
    };
    colorBorder[] =
    {
        0,
        0,
        0,
        1
    };
    idc = -1;
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "RobotoCondensed";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    url = "";
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    bordersize = 0;
};
class TFS_CC_RscShortcutButton
{
    deletable = 0;
    fade = 0;
    type = 16;
    x = 0.1;
    y = 0.1;
    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos
    {
        left = 0;
        top = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20) - (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        w = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        h = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    };
    class textPos
    {
        left = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        top = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20) - (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0;
    };
    shortcuts[] =
    {};
    textureNoShortcut = "#(argb, 8, 8, 3)color(0, 0, 0, 0)";
    color[] =
    {
        1,
        1,
        1,
        1
    };
    colorFocused[] =
    {
        1,
        1,
        1,
        1
    };
    color2[] =
    {
        0.95,
        0.95,
        0.95,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    colorBackground[] =
    {
        "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",
        1
    };
    colorBackgroundFocused[] =
    {
        "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",
        1
    };
    colorBackground2[] =
    {
        1,
        1,
        1,
        1
    };
    class Attributes
    {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    idc = -1;
    style = 0;
    default = 0;
    shadow = 1;
    w = 0.183825;
    h = "((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20)";
    textSecondary = "";
    colorSecondary[] =
    {
        1,
        1,
        1,
        1
    };
    colorFocusedSecondary[] =
    {
        1,
        1,
        1,
        1
    };
    color2Secondary[] =
    {
        0.95,
        0.95,
        0.95,
        1
    };
    colorDisabledSecondary[] =
    {
        1,
        1,
        1,
        0.25
    };
    sizeExSecondary = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    fontSecondary = "RobotoCondensed";
    animtexturedefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animtextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animtextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animtextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
    animtextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
    animtexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
    periodFocus = 1.2;
    periodover = 0.8;
    period = 0.4;
    font = "RobotoCondensed";
    size = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    url = "";
    action = "";
    class Attributesimage
    {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "left";
    };
};
class TFS_CC_RscShortcutButtonMain
{
    idc = -1;
    style = 0;
    default = 0;
    w = 0.313726;
    h = 0.104575;
    color[] =
    {
        1,
        1,
        1,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos
    {
        left = 0.0145;
        top = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20) - (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        w = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
        h = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2)";
    };
    class textPos
    {
        left = "(((safeZoneW / safeZoneH) min 1.2) / 32) * 1.5";
        top = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20)*2 - (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        right = 0.005;
        bottom = 0;
    };
    animtextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    animtextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
    animtextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
    animtextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
    animtexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
    animtexturedefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    period = 0.5;
    font = "RobotoCondensed";
    size = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2)";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1.2)";
    text = "";
    action = "";
    class Attributes
    {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class Attributesimage
    {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "false";
    };
};
class TFS_CC_RscFrame
{
    type = 0;
    idc = -1;
    deletable = 0;
    style = 64;
    shadow = 2;
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
    font = "RobotoCondensed";
    sizeEx = 0.02;
    text = "";
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
};
class TFS_CC_RscSlider
{
    deletable = 0;
    fade = 0;
    type = 3;
    style = 1024;
    color[] =
    {
        1,
        1,
        1,
        0.8
    };
    colorActive[] =
    {
        1,
        1,
        1,
        1
    };
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.025;
};
class IGUIBack
{
    type = 0;
    idc = 124;
    style = 128;
    text = "";
    colortext[] =
    {
        0,
        0,
        0,
        0
    };
    font = "RobotoCondensed";
    sizeEx = 0;
    shadow = 0;
    x = 0.1;
    y = 0.1;
    w = 0.1;
    h = 0.1;
    colorbackground[] =
    {
        "(profileNamespace getVariable ['IGUI_BCG_RGB_R', 0])",
        "(profileNamespace getVariable ['IGUI_BCG_RGB_G', 1])",
        "(profileNamespace getVariable ['IGUI_BCG_RGB_B', 1])",
        "(profileNamespace getVariable ['IGUI_BCG_RGB_A', 0.8])"
    };
};
class TFS_CC_RscCheckBox
{
    idc = -1;
    type = 77;
    deletable = 0;
    style = 0;
    checked = 0;
    x = "0.375 * safeZoneW + safeZoneX";
    y = "0.36 * safeZoneH + safeZoneY";
    w = "0.025 * safeZoneW";
    h = "0.04 * safeZoneH";
    color[] =
    {
        1,
        1,
        1,
        0.7
    };
    colorFocused[] =
    {
        1,
        1,
        1,
        1
    };
    colorHover[] =
    {
        1,
        1,
        1,
        1
    };
    colorPressed[] =
    {
        1,
        1,
        1,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.2
    };
    colorBackground[] =
    {
        0,
        0,
        0,
        0
    };
    colorBackgroundFocused[] =
    {
        0,
        0,
        0,
        0
    };
    colorBackgroundHover[] =
    {
        0,
        0,
        0,
        0
    };
    colorBackgroundPressed[] =
    {
        0,
        0,
        0,
        0
    };
    colorBackgroundDisabled[] =
    {
        0,
        0,
        0,
        0
    };
    textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
    soundEnter[] =
    {
        "",
        0.1,
        1
    };
    soundPush[] =
    {
        "",
        0.1,
        1
    };
    soundClick[] =
    {
        "",
        0.1,
        1
    };
    soundEscape[] =
    {
        "",
        0.1,
        1
    };
};
class TFS_CC_RsctextCheckBox
{
    idc = -1;
    type = 7;
    style = 0;
    x = "0.375 * safeZoneW + safeZoneX";
    y = "0.36 * safeZoneH + safeZoneY";
    w = "0.025 * safeZoneW";
    h = "0.04 * safeZoneH";
    colortext[] =
    {
        1,
        0,
        0,
        1
    };
    color[] =
    {
        0,
        0,
        0,
        0
    };
    colorBackground[] =
    {
        0,
        0,
        0,
        0
    };
    colortextselect[] =
    {
        0,
        0.8,
        0,
        1
    };
    colorselectedBg[] =
    {
        "(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])",
        "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",
        1
    };
    colorselect[] =
    {
        0,
        0,
        0,
        1
    };
    colortextDisable[] =
    {
        0.4,
        0.4,
        0.4,
        1
    };
    colorDisable[] =
    {
        0.4,
        0.4,
        0.4,
        1
    };
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
    font = "RobotoCondensed";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 0.8)";
    rows = 1;
    columns = 1;
    strings[] =
    {
        "UNCHECKED"
    };
    checked_strings[] =
    {
        "CHECKED"
    };
};
class TFS_CC_RscButtonMenu
{
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animtextureNormal = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureDisabled = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureOver = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtextureFocused = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtexturePressed = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    animtexturedefault = "#(argb, 8, 8, 3)color(1, 1, 1, 1)";
    colorBackground[] =
    {
        0,
        0,
        0,
        0.8
    };
    colorBackgroundFocused[] =
    {
        1,
        1,
        1,
        1
    };
    colorBackground2[] =
    {
        0.75,
        0.75,
        0.75,
        1
    };
    color[] =
    {
        1,
        1,
        1,
        1
    };
    colorFocused[] =
    {
        0,
        0,
        0,
        1
    };
    color2[] =
    {
        0,
        0,
        0,
        1
    };
    colortext[] =
    {
        1,
        1,
        1,
        1
    };
    colorDisabled[] =
    {
        1,
        1,
        1,
        0.25
    };
    textSecondary = "";
    colorSecondary[] =
    {
        1,
        1,
        1,
        1
    };
    colorFocusedSecondary[] =
    {
        0,
        0,
        0,
        1
    };
    color2Secondary[] =
    {
        0,
        0,
        0,
        1
    };
    colorDisabledSecondary[] =
    {
        1,
        1,
        1,
        0.25
    };
    sizeExSecondary = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    fontSecondary = "PuristaLight";
    period = 1.2;
    periodFocus = 1.2;
    periodover = 1.2;
    size = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)";
    tooltipColortext[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorBox[] =
    {
        1,
        1,
        1,
        1
    };
    tooltipColorShade[] =
    {
        0,
        0,
        0,
        0.65
    };
    class textPos
    {
        left = "0.25 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
        top = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) - (((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0;
    };
    class Attributes
    {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class ShortcutPos
    {
        left = "5.25 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
        top = 0;
        w = "1 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
        h = "1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
    };
};
class TFS_CC_RscButtonMenuOK
{
    idc = 1;
    shortcuts[] =
    {
        "0x00050000 + 0",
        28,
        57,
        156
    };
    default = 1;
    text = "OK";
};
class TFS_CC_RscButtonMenuCancel
{
    idc = 2;
    shortcuts[] =
    {
        "0x00050000 + 1"
    };
    text = "Cancel";
};
class TFS_CC_RscControlsgroup
{
    deletable = 0;
    fade = 0;
    class VScrollbar
    {
        color[] =
        {
            1,
            1,
            1,
            1
        };
        width = 0.021;
        autoScrollEnabled = 1;
    };
    class HScrollbar
    {
        color[] =
        {
            1,
            1,
            1,
            1
        };
        height = 0.028;
    };
    class Controls
    {};
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 16;
};