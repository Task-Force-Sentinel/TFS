#include "script_component.hpp"

#define MAP_TYPES_BUILDING			["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
#define MAP_TYPES_VEGETATION		["TREE","SMALL TREE","BUSH"]
#define MAP_TYPES_WALL				["WALL","FENCE"]
#define MAP_TYPES_MISC				["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]
#define CUSTOM_TYPES_MISC			["HOUSE","MAN","CAR","TANK","PLANE","HELICOPTER"]
#define HIDE_OBJ					["Land_MilOffices_V1_F","Land_dp_smallFactory_F"]

all_obj = MAP_TYPES_BUILDING+MAP_TYPES_WALL+MAP_TYPES_VEGETATION+MAP_TYPES_MISC;

params ["_mark_x","_radius_x"];
private ["_npos"];

_npos = position _mark_x;
obj_x = nearestTerrainObjects [_npos,all_obj,_radius_x,false];
c_obj = nearestObjects [_npos,CUSTOM_TYPES_MISC, _radius_x];
obj_x = obj_x + c_obj;
{
	if (_x !=_mark_x) then {
		if (typeof _x in HIDE_OBJ) then {
			_x hideObjectGlobal true
		} else {
			_x setDamage [1,false]
		};
		sleep 0.01
	}
} foreach obj_x;
