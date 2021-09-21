#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_low_fog_obj"];
private ["_re_iterate","_fog_low"];

while {alive _low_fog_obj} do {
	waitUntil {sleep 1; player distance _low_fog_obj < 2000};
	_re_iterate = 0;
	while {(player distance _low_fog_obj < 2000)and(alive _low_fog_obj)} do {
		_fog_low = "#particlesource" createVehicle getPosASL _low_fog_obj;
		_fog_low setParticleCircle [0,[0,0,0]];
		_fog_low setParticleRandom [0,[20+(random 30),20+(random 30),-1],[0,0,0],3,0,[0,0,0,0.3],0,0];
		_fog_low setParticleParams[["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,60,[0,0,-2],[0,0,0],13,10,7.843,0.005,[5,5,5],[[1,1,1,0],[1,1,1,0.3],[1,1,1,0]],[0,0],0,0,"","",_low_fog_obj];
		_fog_low setDropInterval 0.001;
		sleep 0.1;
		deleteVehicle _fog_low;
		_re_iterate = _re_iterate + 1;
		if (_re_iterate==50) then {
			sleep 30;
			_re_iterate = 0
		};
	};
};
