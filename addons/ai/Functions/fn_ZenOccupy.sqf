/*
Function: derp_fnc_ZenOccupy

Description:
Teleports the units to random windows of the building(s) within the distance
faces units in the right direction and orders them to stand up or crouch on a roof
units will only fill the building to as many positions as are at windows
Multiple buildings can be filled either evenly or to the limit of each sequentially

Released under Creative Commons Attribution-NonCommercial 4.0 international (CC BY-NC 4.0)
http:// creativecommons.org/licenses/by-nc/4.0/

Arguments:
_center - Buildings nearest to this position and within the radius will be used <position 3D>
_units - The units that shall be garrisoned <ARRAY OF units>
_buildingradius - radius in which to fill buildings, -1 to only use nearest building <SCALAR>
_putonRoof - Put units on roofs of buildings? <BOOLEAN>
_fillEvenly - Fill buildings evenly or one by one? <BOOLEAN>
_mode - mode setting, 1 for "by class name", 0 for normal <SCALAR 0/1>
_classRef - Class name of buildings to garrison <strinG>
Return Value:
Array of units that were not garrisoned <ARRAY OF units>

Example:
nothing to see here

Author:
Zenophon, modified by Mokka
*/
#define I(X) X = X + 1;
#define EYE_HEIGHT 1.53
#define CHECK_distance 5
#define FOV_ANGLE 10
#define ROOF_CHECK 4
#define ROOF_EDGE 2

private [
    "_center",
    "_units",
    "_buildingradius",
    "_putonRoof",
    "_fillEvenly",
    "_Zen_Extendposition",
    "_buildingsArray",
    "_buildingPosArray",
    "_buildingpositions",
    "_posArray",
    "_unitindex", "_j",
    "_building",
    "_posArray",
    "_randomindex",
    "_housePos",
    "_startangle", "_i",
    "_checkPos",
    "_hitcount",
    "_isRoof",
    "_edge", "_k",
    "_unUsedunits"
];

_center = _this select 0;
_units = _this select 1;
_buildingradius = _this select 2;
_putonRoof = _this select 3;
_fillEvenly = _this select 4;
_mode = _this select 5;
// if (_mode == 1) then {
    _classRef = _this select 6;
// };

_Zen_Extendposition = {
    private ["_center", "_dist", "_phi"];
    
    _center = _this select 0;
    _dist = _this select 1;
    _phi = _this select 2;
    
    ([(_center select 0) + (_dist * (cos _phi)), (_center select 1) + (_dist * (sin _phi)), (_this select 3)])
};
_buildingsArray = [];

switch (_mode) do {
    case 1: {
        if (_buildingradius < 0) then {
            _buildingsArray = [nearestBuilding _center];
        } else {
            _buildingsArray = nearestobjects [_center, _classRef, _buildingradius];
        };
    };
    default {
        if (_buildingradius < 0) then {
            _buildingsArray = [nearestBuilding _center];
        } else {
            _buildingsArray = nearestobjects [_center, ["building"], _buildingradius];
        };
    };
};

_buildingPosArray = [];
{
    _buildingpositions = 0;
    for "_i" from 0 to 100 do {
        if ((_x buildingPos _buildingpositions) isEqualto [0, 0, 0]) exitwith {};
        I(_buildingpositions)
    };
    
    _posArray = [];
    for "_i" from 0 to (_buildingpositions - 1) do {
        _posArray set [_i, _i];
    };
    
    _buildingPosArray set [_forEachindex, _posArray];
} forEach _buildingsArray;

_unitindex = 0;
for [{
    _j = 0
}, {
    (_unitindex < count _units) && {
        (count _buildingPosArray > 0)
    }
}, {
    I(_j)
}] do {
scopeName "for";

_building = _buildingsArray select (_j % (count _buildingsArray));
_posArray = _buildingPosArray select (_j % (count _buildingsArray));

if (count _posArray == 0) then {
    _buildingsArray set [(_j % (count _buildingsArray)), 0];
    _buildingPosArray set [(_j % (count _buildingPosArray)), 0];
    _buildingsArray = _buildingsArray - [0];
    _buildingPosArray = _buildingPosArray - [0];
};

while {(count _posArray) > 0} do {
    scopeName "while";
    if (_unitindex >= count _units) exitwith {};
    
    _randomindex = floor random count _posArray;
    _housePos = _building buildingPos (_posArray select _randomindex);
    _housePos = [(_housePos select 0), (_housePos select 1), (_housePos select 2) + (getTerrainHeightASL _housePos) + EYE_HEIGHT];
    
    _posArray set [_randomindex, _posArray select (count _posArray - 1)];
    _posArray resize (count _posArray - 1);
    
    _startangle = (round random 10) * (round random 36);
    for "_i" from _startangle to (_startangle + 350) step 10 do {
        _checkPos = [_housePos, CHECK_distance, (90 - _i), (_housePos select 2)] call _Zen_Extendposition;
        if !(lineIntersects [_checkPos, [_checkPos select 0, _checkPos select 1, (_checkPos select 2) + 25], objNull, objNull]) then {
            if !(lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
                _checkPos = [_housePos, CHECK_distance, (90 - _i), (_housePos select 2) + (CHECK_distance * sin FOV_ANGLE / cos FOV_ANGLE)] call _Zen_Extendposition;
                if !(lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
                    _hitcount = 0;
                    for "_k" from 30 to 360 step 30 do {
                        _checkPos = [_housePos, 20, (90 - _k), (_housePos select 2)] call _Zen_Extendposition;
                        if (lineIntersects [_housePos, _checkPos, objNull, objNull]) then {
                            I(_hitcount)
                        };
                        
                        if (_hitcount >= ROOF_CHECK) exitwith {};
                    };
                    
                    _isRoof = (_hitcount < ROOF_CHECK) && {
                        !(lineIntersects [_housePos, [_housePos select 0, _housePos select 1, (_housePos select 2) + 25], objNull, objNull])
                    };
                    if (!(_isRoof) || {
                        ((_isRoof) && {
                            (_putonRoof)
                        })
                    }) then {
                        if (_isRoof) then {
                            _edge = false;
                            for "_k" from 30 to 360 step 30 do {
                                _checkPos = [_housePos, ROOF_EDGE, (90 - _k), (_housePos select 2)] call _Zen_Extendposition;
                                _edge = !(lineIntersects [_checkPos, [(_checkPos select 0), (_checkPos select 1), (_checkPos select 2) - EYE_HEIGHT - 1], objNull, objNull]);
                                
                                if (_edge) exitwith {
                                    _i = _k;
                                };
                            };
                        };
                        
                        if (!(_isRoof) || {
                            _edge
                        }) then {
                            (_units select _unitindex) setPosASL [(_housePos select 0), (_housePos select 1), (_housePos select 2) - EYE_HEIGHT];
                            (_units select _unitindex) setDir (_i);
                            
                            if (_isRoof) then {
                                (_units select _unitindex) setunitPos "UP";
                            } else {
                                (_units select _unitindex) setunitPos "UP";
                            };
                            
                            (_units select _unitindex) doWatch ([_housePos, CHECK_distance, (90 - _i), (_housePos select 2) - (getTerrainHeightASL _housePos)] call _Zen_Extendposition);
                            // dostop (_units select _unitindex);
                            // (_units select _unitindex) disableAI "move";
                            (_units select _unitindex) forcespeed 0;
                            
                            I(_unitindex)
                            if (_fillEvenly) then {
                                breakto "for";
                            } else {
                                breakto "while";
                            };
                        };
                    };
                };
            };
        };
    };
};
};

_unUsedunits = [];

for [{
    _i = _unitindex
}, {
    _i < count _units
}, {
    I(_i)
}] do {
_unUsedunits set [(count _unUsedunits), (_units select _i)];
};

(_unUsedunits)