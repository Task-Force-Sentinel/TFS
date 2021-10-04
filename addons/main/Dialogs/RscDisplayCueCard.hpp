class RscDisplayCueCard
{
    idd = 20305;
    enableSimulation = 1;
    closeOnMissionEnd = 0;
    scriptName = "RscDisplayCueCard";
    scriptPath = "TFSDisplays";
    onload = "[""onload"", _this, ""RscDisplayCueCard"", 'TFSDisplays'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay')";
    onUnload = "[""onUnload"", _this, ""RscDisplayCueCard"", 'TFSDisplays'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay')";
    movingEnable = true;
    
    class Controls
    {
        class picture: RscpictureKeepAspect
        {
            idc = 1001;
            text = "#(argb, 8, 8, 3)color(1, 0, 0, 0.2)";
            x = "safeZoneX + 5 * (((safeZoneW / safeZoneH) min 1.2) / 40)";
            y = "safeZoneY + 5 * (((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)";
            w = "safeZoneW * 0.26";
            h = "safeZoneH * 0.52";
            moving = 1;
            onMouseMoving = "\
            params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
            \
            if !(uiNamespace getVariable [""1001_dragged"", false]) exitwith {}; \
            \
            (ctrlposition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
            \
            _control ctrlsetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
            \
            _control ctrlCommit 0; \
            ";
            onMouseButtondown = "\
            if ((_this select 1) != 0) exitwith {}; \
            uiNamespace setVariable [""1001_dragged"", true];\
            ";
            onMouseButtonUp = "\
            if ((_this select 1) != 0) exitwith {};\
            uiNamespace setVariable [""1001_dragged"", false]; \
            ";
            onKeydown = "\
            params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
            [_this, ""keydown""] call CBA_events_fnc_keyHandler;\
            ";
            onKeyUp = "\
            params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""];\
            [_this, ""keyUp""] call CBA_events_fnc_keyHandler;\
            ";
        };
        
        class notePad: RscEdit
        {
            idc = 1002;
            x = 0.288594 * safeZoneW + safeZoneX;
            y = 0.093 * safeZoneH + safeZoneY;
            w = 0.31 * safeZoneW;
            h = 0.754 * safeZoneH;
            // multiline:
            text = "";
            style = 16;
            lineSpacing = 1;
            colortext[] = {
                0, 0, 0, 1
            };
            sizeEx = 0.05;
            onMouseMoving= "\
            params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
            if !(uiNamespace getVariable [""1002_dragged"", false]) exitwith {}; \
            \
            (ctrlposition _control) params [""_x"", ""_y"", ""_w"", ""_h""];\
            \
            _control ctrlsetPosition [_XPos - _w / 2, _yPos - _h / 2];\
            \
            _control ctrlCommit 0; \
            \
            _ctrl = (findDisplay 20305) displayCtrl 1200; \
            _ctrl ctrlsetPosition [_XPos - _w / 2, _yPos - _h / 2];\
            _ctrl ctrlCommit 0;\
            ";
            onMouseButtondown = "\
            if ((_this select 1) != 0) exitwith {}; \
            uiNamespace setVariable [""1002_dragged"", true];\
            ";
            onMouseButtonUp = "\
            if ((_this select 1) != 0) exitwith {};\
            uiNamespace setVariable [""1002_dragged"", false];\
            ";
        };
    };
    
    class controlsBackground
    {
        class notePadBackground: Rscpicture
        {
            idc = 1200;
            text = "z\tfs\addons\media\images\cuecards\notepad_CA.paa";
            x = 0.288594 * safeZoneW + safeZoneX;
            y = 0.093 * safeZoneH + safeZoneY;
            w = 0.31 * safeZoneW;
            h = 0.754 * safeZoneH;
            moving = 0;
        };
    };
};