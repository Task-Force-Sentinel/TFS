#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* name: TFS_spectator_fnc_drawgroupMarker
* Author: Head
*
* Arguments:
* mapControl, grp, sideColor, pos
*
* Return:
* N/A
*/
params ['_map', '_grp', '_color', '_pos'];
private _tfsGrpMarkerData = [_x] call EFUNC(orbat, getgroupMarkerData);
// if we have a framework orbat marker, use it.
if (count _tfsGrpMarkerData >= 3) then {
    _tfsGrpMarkerData params ["_grptexture", "_gname", "_grptexturesize"];
    _map drawIcon [_grptexture, [1, 1, 1, 1], _pos, 32, 32, 0, "", 2, 0.04, MAP_FONT];
    _map drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, 32, 32, 0, _gname, 0, 0.04, MAP_FONT];
    if (_grptexturesize != "") then {
        _map drawIcon [_grptexturesize, [1, 1, 1, 1], _pos, 32, 32, 0, "", 0, 0.04, MAP_FONT];
    };
} else {
    // here we draw the default icons if TW grp makers arent present
    _map drawIcon ["\A3\ui_f\data\map\markers\nato\b_unknown.paa", _color, _pos, 32, 32, 0, "", 0, 0.04, MAP_FONT];
    _map drawIcon ["#(argb, 8, 8, 3)color(0, 0, 0, 0)", [1, 1, 1, 1], _pos, 32, 32, 0, groupid _x, 0, 0.04, MAP_FONT];
};