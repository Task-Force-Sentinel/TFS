#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Original Author: Larrow (BI Forum)
 * marks the given object on the map
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * this call TFSRHS_common_fnc_objectMarkers;
 *
 */


if ( !isServer ) exitWith {};

params ["_object"];
private ["_pos","_boundingBox","_bmin","_direction","_markerName","_marker"];

_pos = getPosATL _object;
_boundingBox = 0 boundingBoxReal _object;
_bmin = _boundingBox select 0;
_direction = getDir _object;

_markerName = format[ "bound_%1", netId _object ];
_marker = createMarker [_markerName, _pos];
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSize [_bmin select 0, _bmin select 1];
_marker setMarkerDir _direction;
