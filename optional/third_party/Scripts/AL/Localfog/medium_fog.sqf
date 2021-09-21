#include "script_component.hpp"

if (!hasInterface) exitWith {};
private ["_alias_local_fog"];

if (!isNil {player getVariable "is_ON"}) exitwith {};
player setVariable ["is_ON",true,true];

while {!isNull player} do {
	_alias_local_fog = "#particlesource" createVehicleLocal (getpos vehicle player);
	_alias_local_fog setParticleCircle [10,[3,3,0]];
	_alias_local_fog setParticleRandom [6,[0.25,0.25,0],[1,1,0],1,1,[0,0,0,0.1],0,0];
	_alias_local_fog setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard",1,8,[0,0,0],[-1,-1,0],3,10.15,7.9,0.01,[10,10,20],[[0.5,0.5,0.5,0],[0.5,0.5,0.5,0.1],[1,1,1,0]], [0.08], 1, 0, "", "", vehicle player];
	_alias_local_fog setDropInterval 0.01;
	waitUntil {sleep 2; player != vehicle player};
	deleteVehicle _alias_local_fog;
};
