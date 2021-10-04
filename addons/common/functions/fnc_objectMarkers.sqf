#include "script_component.hpp"
/*
* Author: NemesisRE
* original Author: Larrow (BI forum)
* marks the given object on the map
*
* Arguments:
* 0: Object <OBJECT>
*
* Return Value:
* None
*
* Example:
* this call TFS_common_fnc_objectMarkers;
*
*/

if (!isServer) exitwith {};

params ["_object"];
private ["_pos", "_boundingBox", "_bmin", "_direction", "_markername", "_marker"];

_pos = getPosATL _object;
_boundingBox = 0 boundingBoxReal _object;
_bmin = _boundingBox select 0;
_direction = getDir _object;

_markername = format[ "bound_%1", netId _object ];
_marker = createMarker [_markername, _pos];
_marker setMarkerShape "RECtanGLE";
_marker setMarkersize [_bmin select 0, _bmin select 1];
_marker setMarkerDir _direction;