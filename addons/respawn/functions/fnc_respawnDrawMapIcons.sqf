#include "\z\tfs\addons\respawn\script_component.hpp"

disableSerialization;
params["_fullmapwindow"];

{
    if (alive _x) then {
        private _name = "";
        if (isplayer _x) then {
            _name = name _x
        };
        if(leader _x == _x && {
            isplayer _x
        } count units _x > 0) then {
            _name = format["%1 - %2", toString(toArray(groupid (group _x)) - [45]), _name]
        };
        if (vehicle _x != _x && crew (vehicle _x) select 0 == _x || vehicle _x == _x) then {
            private _icon = (vehicle _x getVariable ["f_cam_icon", ""]);
            if (_icon == "") then {
                _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _x) >> "icon");
                vehicle _x setVariable ["f_cam_icon", _icon]
            };
            private _color = (side _x) call tfs_common_fnc_sidetoColor;
            _fullmapwindow drawIcon [_icon, _color, getPos _x, 19, 19, getDir (vehicle _x), _name, 1];
        };
    };
} forEach allunits;

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