#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* name: TFS_spectator_fnc_drawvehicleMarker
* Author: Head
*
* Arguments:
* mapControl, grp, sideColor, pos
*
* Return:
* N/A
*/
params ["_map", "_veh", "_color", "_grpPos"];
private _pos = (getPosVisual _veh);
private _size = 19;
private _icon = _veh getVariable [QGVAR(mapicon), ""];
if (_icon == "") then {
    _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _veh) >> "icon");
    _veh setVariable [QGVAR(mapicon), _icon];
};
private _vehiclename = _veh getVariable [QGVAR(_vehiclename), ""];
if (_vehiclename == "") then {
    _vehiclename = gettext (configFile >> "Cfgvehicles" >> typeOf _veh >> "displayname");
    _veh setVariable [QGVAR(_vehiclename), _vehiclename];
};
if (isplayer (effectiveCommander _veh)) then {
    _vehiclename = name (effectiveCommander _veh);
};
private _name = format ["%1 [%2]", _vehiclename, count crew _veh];
_map drawIcon [_icon, _color, _pos, _size, _size, getDir _veh, "", 0, 0.04, MAP_FONT];
_map drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, _size, _size, 0, _name, 0, 0.04, MAP_FONT];
if (GVAR(showlines)) then {
    _map drawLine [_pos, _grpPos, _color]
};