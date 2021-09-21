#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_high_fog"];
private ["_re_iterate","_fog_high"];

while {alive _high_fog} do {
	waitUntil {sleep 1; player distance _high_fog < 4000};
	_re_iterate = 0;
	while {(player distance _high_fog < 4000)and(alive _high_fog)} do {
		_fog_high = "#particlesource" createVehicle getPosASL _high_fog;
		_fog_high setParticleCircle [0,[0,0,0]];
		_fog_high setParticleRandom [0,[60+(random 100),60+(random 100),1+(random 4)],[0,0,0],0,0,[0,0,0,0],0,0];
		_fog_high setParticleParams[["\A3\data_f\cl_basic", 1, 0, 1],"","Billboard",1,60,[0,0,-35],[0,0,0],13,10,7.843,0,[20,20,25],[[1,1,1,0],[1,1,1,0.1],[1,1,1,0]],[0,0],0,0,"","",_high_fog];
		_fog_high setDropInterval 0.001;
		sleep 0.1;
		deleteVehicle _fog_high;
		_re_iterate = _re_iterate + 1;
		if (_re_iterate==50) then {
			sleep 29;
			_re_iterate = 0
		};
	};
};
