#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params["_fullmapwindow"];

// Render Triggers
{
    (triggerArea _x) params ["_a", "_b", "_angle", "_isRectangle", "_c"];
    private _pos = getPos _x;
    
    private _color = [0, 0, 1, 0.6];
    (triggerActivation _x) params ["_by", "_type", "_repeating"];
    private _activated = triggerActivated _x;
    
    if (GVAR(adminEyeselectedobj) isEqualto _x) then {
        _color = [1, 0, 0, 1];
        // selected Go Red.
        (triggerTimeout _x) params ["_min", "_mid", "_max", "_interuptable"];
        
        private _text = format["%1 - %2 - (Repeat: %3) (On Act %4)", _by, _type, _repeating, triggertype _x];
        
        if (_max == 0) then {
            private _timeout = triggerTimeoutCurrent _x;
            if (_timeout != -1) then {
                _text = _text + format[" (%5/[%1 - %2 - %3] interupable: %4)", _min, _mid, _max, _interuptable, _timeout];
            } else {
                _text = _text + format[" ([%1 - %2 - %3] interupable: %4)", _min, _mid, _max, _interuptable];
            };
        };
        if (GVAR(adminEyeselectedobj) isEqualto _x) then {
            _text = _text + " (T to Trigger)";
        };
        _fullmapwindow drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, 26, 26, 0, _text, 2, 0.035, 'PuristaSemibold', 'right'];
    };
    
    // if Activated.
    if (!_repeating && _activated) then {
        _color = [0, 0, 0, 0.4];
    };
    
    if (_isRectangle) then {
        _fullmapwindow drawRectangle [_pos, _a, _b, _angle, _color, ""];
    } else {
        _fullmapwindow drawEllipse [_pos, _a, _b, _angle, _color, ""];
    };
    
    // Render Trigger Icon on top.
    _fullmapwindow drawIcon ["\a3\ui_f\data\map\markers\military\flag_ca.paa", _color, _pos, 19, 19, getDir (vehicle _x), "", 0];
} forEach GVAR(Triggers);

// Wave spawners
{
    private _pos = getPos _x;
    
    // background
    private _color = [1, 1, 1, 0.5];
    if (GVAR(adminEyeselectedobj) isEqualto _x) then {
        _color = [1, 0, 0, 0.75];
    };
    _fullmapwindow drawIcon ["\a3\3DEN\data\cfg3den\logic\texturebackgroundmodule_ca.paa", _color, _pos, 26, 26, 0];
    _fullmapwindow drawIcon ["\z\tfs\addons\media\images\TFSlogO@0.25x.paa", [0, 0, 0, 0.5], _pos, 20, 20, 0];
    
    private _text = "";
    private _wavesRemaining = _x getVariable ["waves", 1];
    if (_wavesRemaining > 0) then {
        _text = format["%1 waves remaining", _wavesRemaining];
        if (GVAR(adminEyeselectedobj) isEqualto _x) then {
            _text = _text + " (T to Trigger)";
        };
    } else {
        _text = "All waves spawned";
    };
    
    // Render linked units of selected wave spawner.
    if (GVAR(adminEyeselectedobj) isEqualto _x) then {
        private _data = _x getVariable [QEGVAR(ai, waveadminData), []];
        {
            _x params ["_type", "_entityPos", "_dir"];
            private _icon = gettext (configFile >> "Cfgvehicles" >> _type >> "icon");
            _fullmapwindow drawLine [_pos, _entityPos, [1, 1, 0, 0.4]];
            _fullmapwindow drawIcon [_icon, [1, 1, 0, 0.3], _entityPos, 19, 19, _dir, "", 0];
        } forEach _data;
    };
    
    _fullmapwindow drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, 26, 26, 0, _text, 2, 0.035, 'PuristaSemibold', 'right'];
    
    {
        private _color = [0, 0, 1, 0.3];
        if (GVAR(adminEyeselectedobj) isEqualto _x) then {
            _color = [1, 0, 0, 0.3];
        };
        _fullmapwindow drawLine [_pos, getPos _x, _color];
    } forEach (synchronizedObjects _x);
} forEach GVAR(wavespawners);

// Garrison.
{
    private _pos = getPos _x;
    
    // Render area.
    (_x getVariable ["objectArea", [0, 0, 0, false, 0]]) params ["_a", "_b", "_angle", "_isRectangle"];
    if (_isRectangle) then {
        _fullmapwindow drawRectangle [_pos, _a, _b, _angle, [0, 0, 0, 0.6], ""];
    } else {
        _fullmapwindow drawEllipse [_pos, _a, _b, _angle, [0, 0, 0, 0.6], ""];
    };
    
    // background
    _fullmapwindow drawIcon ["\a3\3DEN\data\cfg3den\logic\texturebackgroundmodule_ca.paa", [1, 1, 1, 0.5], _pos, 26, 26, 0];
    _fullmapwindow drawIcon ["\z\tfs\addons\media\images\TFSlogO@0.25x.paa", [0, 0, 0, 0.5], _pos, 20, 20, 0];
    
    private _text = format["Garrison (Quantity: %1)", _x getVariable ["ainumbertospawn", 0]];
    
    // text.
    _fullmapwindow drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, 26, 26, 0, _text, 2, 0.035, 'PuristaSemibold', 'right'];
    
    // Render synchoncized
    {
        private _color = [0, 0, 1, 0.3];
        if (GVAR(adminEyeselectedobj) isEqualto _x) then {
            _color = [1, 0, 0, 0.3];
        };
        _fullmapwindow drawLine [_pos, getPos _x, _color];
    } forEach (synchronizedObjects _x);
} forEach GVAR(Garrison);

// units
{
    if (alive _x) then {
        if (vehicle _x != _x && crew (vehicle _x) select 0 == _x || vehicle _x == _x) then {
            private _icon = (vehicle _x getVariable ["f_cam_icon", ""]);
            if (_icon == "") then {
                _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _x) >> "icon");
                (vehicle _x) setVariable ["f_cam_icon", _icon];
            };
            
            private _color = (side _x) call tfs_common_fnc_sidetoColor;
            
            private _pos = getPos _x;
            private _sizeX = 20;
            private _sizeY = 20;
            
            private _name = "";
            
            if (leader _x == _x && {
                isplayer _x
            } count units _x > 0) then {
                _name = format["%1 - %2", toString(toArray(groupid (group _x)) - [45]), _name]
            };
            
            if (isplayer _x) then {
                _name = name _x;
            } else {
                _color set [3, 0.6];
                // Alpha for AI.
            };
            if (_name != "") then {
                // orbat style
                // _fullmapwindow drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, _sizeX, _sizeY, 0, _name, 2, 0.035, 'PuristaSemibold', 'right'];
                // Spectator
                _fullmapwindow drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", _color, _pos, 19, 19, 0, _name, 1, 0.02, "EtelkaMonospacePro"];
            };
            
            // _fullmapwindow drawIcon [_icon, _color, _pos, 19, 19, getDir (vehicle _x), "", 0, 0.02, "EtelkaMonospacePro"];
            
            // Draw Icon
            // _fullmapwindow drawIcon [_texture1, _color, _pos, _sizeX, _sizeY, 0];
            _fullmapwindow drawIcon [_icon, _color, _pos, 19, 19, getDir (vehicle _x), "", 0];
        };
    };
} forEach allunits;

// todo - Spectator map already has markers without having to render them manually like this.
{
    private _markerShape = markerShape _x;
    private _markerPos = getmarkerPos _x;
    private _markersize = getmarkersize _x;
    private _markerColor = (configFile >> "CfgmarkerColors" >> getmarkerColor _x >> "color") call BIS_fnc_colorConfigtorGBA;
    private _markerDir = markerDir _x;
    
    switch (_markerShape) do {
        case "RECtanGLE": {
            private _markerBrush = gettext (configFile >> "cfgmarkerBrushes" >> markerBrush _x >> "texture");
            _fullmapwindow drawRectangle [_markerPos, _markersize select 0, _markersize select 1, _markerDir, _markerColor, _markerBrush]
        };
        case "ELLIPSE": {
            private _markerBrush = gettext (configFile >> "cfgmarkerBrushes" >> markerBrush _x >> "texture");
            _fullmapwindow drawEllipse [_markerPos, _markersize select 0, _markersize select 1, _markerDir, _markerColor, _markerBrush]
        };
        case "ICON": {
            private _markertype = getmarkertype _x;
            if (_markertype != "Empty") then {
                _multiplier = 20;
                _markerIcon = gettext (configFile >> "CfgMarkers" >> _markertype >> "icon");
                _markertext = markertext _x;
                _fullmapwindow drawIcon [_markerIcon, _markerColor, _markerPos, (_markersize select 0) * _multiplier, (_markersize select 1) * _multiplier, _markerDir, _markertext, 1];
            };
        };
    };
} forEach allMapMarkers;

private _mousePos = GVAR(respawnMousePos);
private _i = 1;
while {true} do {
    private _var = missionnamespace getVariable[format["TFS_respawnPoint%1", _i], objNull];
    if (isNull _var) exitwith {};
    private _pos = (position _var);
    
    if (_i isEqualto _mousePos) then {
        _fullmapwindow drawIcon ["\A3\ui_f\data\map\markers\military\start_CA.paa", [1, 0, 0, 0.5], _pos, 40, 40, 0];
    };
    _fullmapwindow drawIcon ["\A3\ui_f\data\map\markers\military\start_CA.paa", [1, 1, 0, 1], _pos, 32, 32, 0, format["Respawn point %1", _i], 1];
    
    _i = _i + 1;
};

if (_mousePos isEqualtype []) then {
    if (count _mousePos > 1) then {
        private _text = "User selected respawn location";
        if (GVAR(respawnHalo)) then {
            _text = "User selected respawn location (HALO)";
        };
        _fullmapwindow drawIcon ["\A3\ui_f\data\map\markers\military\start_CA.paa", [1, 0, 0, 1], _mousePos, 20, 20, 0, _text, 1];
    };
};