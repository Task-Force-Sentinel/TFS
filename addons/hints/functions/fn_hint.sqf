/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\hints\functions\fn_hint.sqf
* by Ojemineh
*
* extended hint system
*
* Arguments:
* 0: text - <strinG>
* 1: color - <COLor> (index 0-2 or Array [0, 0, 1, 1])
* 2: sound - <NUMBER> (index 0-4)
* 3: delay - <NUMBER> (Seconds 5-30)
* 1: position - <NUMBER> (0 top right, 1 top left, 2 bottom left, 3 bottom right)
*
* Return:
* nothing
*
* Example:
* [ format [hint_tpl_default, "Hello World"] ] call TFS_fnc_hint;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_text", "_color", "_delay", "_sound", "_position"];

_text = [_this, 0, "", [""]] call BIS_fnc_param;
_color = [_this, 1, -1, [0, []]] call BIS_fnc_param;
_sound = [_this, 2, -1, [0]] call BIS_fnc_param;
_delay = [_this, 3, -1, [0]] call BIS_fnc_param;
_position = [_this, 4, -1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_text isEqualto "") exitwith {};

[_text, _color, _sound, _delay, _position] spawn {
    params ["_text", "_color", "_sound", "_delay", "_position"];
    
    private ["_display", "_bwidth", "_spacer", "_alpha", "_stack", "_queue", "_width", "_height",
        "_posX", "_posY", "_scrolldown", "_barLeft", "_barcolor", "_rgb_r", "_rgb_g", "_rgb_b", "_rgb_a",
        "_Content", "_contentWidth", "_contentHeight", "_contentPosX", "_contentPosY", "_ColorBar",
        "_barWidth", "_barHeight", "_barPosX", "_barPosY", "_totalY", "_activenotifications",
    "_ctrlContent", "_ctrlBar", "_contentH", "_contentY"];
    
    private _hint_enabled = (missionnamespace getVariable ["tfs_hint_enabled", true]);
    private _hint_position = (missionnamespace getVariable ["tfs_hint_position", 0]);
    private _hint_duration = (missionnamespace getVariable ["tfs_hint_duration", 15]);
    private _hint_sound = (missionnamespace getVariable ["tfs_hint_sound", 1]);
    private _hint_color_bg = (missionnamespace getVariable ["tfs_hint_color_background", [0.000, 0.000, 0.000, 0.5]]);
    private _hint_color_0 = (missionnamespace getVariable ["tfs_hint_color_default", [0.000, 0.824, 0.000, 1]]);
    private _hint_color_1 = (missionnamespace getVariable ["tfs_hint_color_info", [0.824, 0.824, 0.000, 1]]);
    private _hint_color_2 = (missionnamespace getVariable ["tfs_hint_color_alert", [0.824, 0.000, 0.000, 1]]);
    private _hint_queue_size = (missionnamespace getVariable ["tfs_hint_queue_size", 3]);
    private _hint_queue_alpha = (missionnamespace getVariable ["tfs_hint_queue_alpha", 0.4]);
    
    if (!_hint_enabled) exitwith {};
    
    if (_color isEqualtype 0) then {
        switch (_color) do {
            case -1: {
                _rgb_r = profileNamespace getVariable ["GUI_BCG_RGB_R", 0];
                _rgb_g = profileNamespace getVariable ["GUI_BCG_RGB_G", 0];
                _rgb_b = profileNamespace getVariable ["GUI_BCG_RGB_B", 0];
                _rgb_a = profileNamespace getVariable ["GUI_BCG_RGB_A", 1];
                _color = [_rgb_r, _rgb_g, _rgb_b, _rgb_a];
            };
            case 1: {
                _color = _hint_color_1;
            };
            case 2: {
                _color = _hint_color_2;
            };
            default {
                _color = _hint_color_0;
            };
        };
    };
    
    if (_sound < 0) then {
        _sound = _hint_sound;
    };
    if (_delay < 0) then {
        _delay = round _hint_duration;
    };
    if (_position < 0) then {
        _position = _hint_position;
    };
    
    disableSerialization;
    
    // _display = findDisplay 46;
    _display = uiNamespace getVariable "TFS_ctrlhint";
    
    _bwidth = 0.003 * safeZoneW;
    _spacer = 1.5 * (0.01 * safeZoneH);
    _alpha = 0.8;
    _stack = _hint_queue_size;
    _queue = [];
    
    switch (_position) do {
        case 1: {
            _width = 0.15 * safeZoneW;
            _height = 0.15 * safeZoneH;
            _posX = 0.012 * safeZoneW + safeZoneX;
            _posY = 0.13 * safeZoneH + safeZoneY;
            _scrolldown = true;
            _barLeft = true;
            _queue = uiNamespace getVariable ["tfs_hint_queue_1", []];
        };
        case 2: {
            _width = 0.15 * safeZoneW;
            _height = 0.15 * safeZoneH;
            _posX = 0.012 * safeZoneW + safeZoneX;
            _posY = safeZoneY + safeZoneH - (0.13 * safeZoneH);
            _scrolldown = false;
            _barLeft = true;
            _queue = uiNamespace getVariable ["tfs_hint_queue_2", []];
        };
        case 3: {
            _width = 0.15 * safeZoneW;
            _height = 0.15 * safeZoneH;
            _posX = safeZoneX + safeZoneW - _width - (0.012 * safeZoneW);
            _posY = safeZoneY + safeZoneH - (0.13 * safeZoneH);
            _scrolldown = false;
            _barLeft = false;
            _queue = uiNamespace getVariable ["tfs_hint_queue_3", []];
        };
        default {
            _width = 0.15 * safeZoneW;
            _height = 0.15 * safeZoneH;
            _posX = safeZoneX + safeZoneW - _width - (0.012 * safeZoneW);
            _posY = 0.13 * safeZoneH + safeZoneY;
            _scrolldown = true;
            _barLeft = false;
            _queue = uiNamespace getVariable ["tfs_hint_queue_0", []];
        };
    };
    
    switch (_sound) do {
        case 1: {
            playSound ["hintexpand", true];
        };
        case 2: {
            playSound ["hint", true];
        };
        case 3: {
            playSound ["taskCreated", true];
        };
        case 4: {
            playSound ["Tacticalping4", true];
        };
        default {};
    };
    
    if (_text isEqualtype "") then {
        _text = parsetext _text;
    };
    
    _Content = _display ctrlCreate ["Rscstructuredtext", -1];
    _Content ctrlsetstructuredtext _text;
    _Content ctrlsetPosition [0, 0, _width, 0.5];
    _Content ctrlCommit 0;
    _contentWidth = _width;
    _contentHeight = ((ctrltextHeight _Content) + (0.002 * safeZoneH));
    _contentPosX = _posX;
    if (_scrolldown) then {
        _contentPosY = _posY;
    } else {
        _contentPosY = _posY - _contentHeight;
    };
    _Content ctrlsetPosition [_contentPosX, _contentPosY, _contentWidth, _contentHeight];
    // _Content ctrlsetBackgroundColor [0, 0, 0, _alpha];
    _Content ctrlsetBackgroundColor _hint_color_bg;
    _Content ctrlsetFade 1;
    _Content ctrlCommit 0;
    _Content ctrlsetFade 0;
    _Content ctrlCommit 0.25;
    
    _ColorBar = _display ctrlCreate ["Rsctext", -1];
    _barWidth = _bwidth;
    _barHeight = _contentHeight;
    if (_barLeft) then {
        _barPosX = _posX - _bwidth;
    } else {
        _barPosX = _posX + _contentWidth;
    };
    if (_scrolldown) then {
        _barPosY = _posY;
    } else {
        _barPosY = _posY - _contentHeight;
    };
    _ColorBar ctrlsetPosition [_barPosX, _barPosY, _barWidth, _barHeight];
    _ColorBar ctrlsetBackgroundColor _color;
    _ColorBar ctrlsetFade 1;
    _ColorBar ctrlCommit 0;
    _ColorBar ctrlsetFade 0;
    _ColorBar ctrlCommit 0.25;
    
    [_Content, _ColorBar, _delay] spawn {
        disableSerialization;
        private _Content = _this select 0;
        private _ColorBar = _this select 1;
        private _delay = _this select 2;
        uiSleep _delay;
        _Content ctrlsetFade 1;
        _Content ctrlCommit 0.5;
        _ColorBar ctrlsetFade 1;
        _ColorBar ctrlCommit 0.5;
        uiSleep 0.5;
        ctrlDelete _Content;
        ctrlDelete _ColorBar;
    };
    
    if (_scrolldown) then {
        _totalY = _contentPosY + _contentHeight + _spacer;
    } else {
        _totalY = _contentPosY;
    };
    
    if (count _queue > 0) then {
        _activenotifications = 0;
        {
            _ctrlContent = _x select 0;
            _ctrlBar = _x select 1;
            if (!isNull _ctrlContent && !isNull _ctrlBar) then {
                _contentH = (ctrlposition (_ctrlContent)) select 3;
                _contentY = (ctrlposition (_ctrlContent)) select 1;
                if (!_scrolldown) then {
                    _totalY = _totalY - _contentH - _spacer;
                };
                _ctrlContent ctrlsetPosition [_contentPosX, _totalY];
                _ctrlContent ctrlsetFade _hint_queue_alpha;
                _ctrlContent ctrlCommit 0.25;
                _ctrlBar ctrlsetPosition [_barPosX, _totalY];
                _ctrlBar ctrlsetFade _hint_queue_alpha;
                _ctrlBar ctrlCommit 0.25;
                if (_scrolldown) then {
                    _totalY = _totalY + _contentH + _spacer;
                };
                if (_activenotifications >= _stack) then {
                    _ctrlContent ctrlsetFade 1;
                    _ctrlContent ctrlCommit 0.25;
                    _ctrlBar ctrlsetFade 1;
                    _ctrlBar ctrlCommit 0.2;
                };
                _activenotifications = _activenotifications + 1;
            };
        } forEach _queue;
    };
    
    _queue = ([[_Content, _ColorBar]] + _queue) select {
        !isNull (_x select 0) && !isNull (_x select 1)
    };
    
    switch (_position) do {
        case 0: {
            uiNamespace setVariable ["tfs_hint_queue_0", _queue];
        };
        case 1: {
            uiNamespace setVariable ["tfs_hint_queue_1", _queue];
        };
        case 2: {
            uiNamespace setVariable ["tfs_hint_queue_2", _queue];
        };
        case 3: {
            uiNamespace setVariable ["tfs_hint_queue_3", _queue];
        };
    };
};