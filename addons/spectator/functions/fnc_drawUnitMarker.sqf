#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* name: TFS_spectator_fnc_drawUnitMarker
* Author: Head
*
* Arguments:
* mapControl, grp, sideColor, pos
*
* Return:
* N/A
*/
params ["_map", "_unit", "_color", "_grpPos"];
private _pos = (getPosVisual _unit);
private _icon = _unit getVariable [QGVAR(mapicon), ""];
private _size = 19;
if (_icon == "") then {
    _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _unit) >> "icon");
    _unit setVariable [QGVAR(mapicon), _icon];
};

_map drawIcon [_icon, _color, _pos, _size, _size, getDir _unit, "", 0, 0.04, MAP_FONT];
if (isplayer _unit) then {
    _map drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, _size, _size, 0, name _x, 1, 0.04, MAP_FONT];
};
if (GVAR(showlines)) then {
    _map drawLine [_pos, _grpPos, _color]
};