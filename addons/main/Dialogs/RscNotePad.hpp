class RscNotePad
{
    idd = 20306;
    enableSimulation = 1;
    closeOnMissionEnd = 0;
    scriptName = "RscNotePad";
    scriptPath = "TFSDisplays";
    onload = "[""onload"", _this, ""RscNotePad"", 'TFSDisplays'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay')";
    onUnload = "[""onUnload"", _this, ""RscNotePad"", 'TFSDisplays'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay')";
    onMouseButtondown = "\
    if ((_this select 1) != 0) exitwith {\
        _ctrl = ((_this select 0) displayCtrl 1004); \
        _ctrlEnabled = ctrlEnabled _ctrl; \
        _ctrl ctrlEnable (not _ctrlEnabled); \
    };\
    ";
    onKeydown = "\
    params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""];\
    _ctrl = _displayorcontrol displayCtrl 1004;\
    if (ctrlEnabled _ctrl) exitwith {};\
    [_this, ""keydown""] call CBA_events_fnc_keyHandler;\
    ";
    onKeyUp = "\
    params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
    _ctrl = _displayorcontrol displayCtrl 1004; \
    if (ctrlEnabled _ctrl) exitwith {}; \
    [_this, ""keyUp""] call CBA_events_fnc_keyHandler; \
    ";
    able = true;
    
    class Controls
    {
        class notePad: RscEdit
        {
            idc = 1004;
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
            if !(uiNamespace getVariable [""1004_dragged"", false]) exitwith {}; \
            \
            (ctrlposition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
            \
            _control ctrlsetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
            \
            _control ctrlCommit 0; \
            \
            _ctrl = (findDisplay 20306) displayCtrl 1201; \
            _ctrl ctrlsetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
            _ctrl ctrlCommit 0; \
            ";
            onMouseButtondown = "\
            uiNamespace setVariable [""1004_dragged"", true]; \
            ";
            onMouseButtonUp = "\
            uiNamespace setVariable [""1002_dragged"", false]; \
            ";
        };
    };
    
    class controlsBackground
    {
        class notePadBackground: Rscpicture
        {
            idc = 1201;
            text = "z\tfs\addons\media\images\cuecards\notepad_CA.paa";
            x = 0.288594 * safeZoneW + safeZoneX;
            y = 0.093 * safeZoneH + safeZoneY;
            w = 0.31 * safeZoneW;
            h = 0.754 * safeZoneH;
            moving = 1;
        };
    };
};