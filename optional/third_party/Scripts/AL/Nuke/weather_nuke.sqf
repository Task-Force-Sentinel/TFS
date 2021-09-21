#include "script_component.hpp"

if (!hasInterface) exitWith {};
private ["_Leaves_Green", "_Leaves_leaf", "_WoodParts", "_leaves_p"];

sleep 32;
_Leaves_Green = "#particlesource" createVehicleLocal (getpos player);
_Leaves_Green attachto [player];
_Leaves_Green setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
_Leaves_Green setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
_Leaves_Green setParticleCircle [0.0, [0, 0, 0]];
_Leaves_Green setDropInterval 0.01 + random 0.3;

_Leaves_leaf = "#particlesource" createVehicleLocal (getpos player);
_Leaves_leaf attachto [player];
_Leaves_leaf setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
_Leaves_leaf setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
_Leaves_leaf setParticleCircle [0.0, [0, 0, 0]];
_Leaves_leaf setDropInterval 0.01 + random 0.3;

_WoodParts = "#particlesource" createVehicleLocal (getpos player);
_WoodParts attachto [player];
_WoodParts setParticleParams [["\A3\data_f\ParticleEffects\Universal\WoodParts_01.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,0,0],[0,0,0],1,0.000001,0,1.4,[1],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",vehicle player];
_WoodParts setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
_WoodParts setParticleCircle [0.0, [0, 0, 0]];
_WoodParts setDropInterval 0.01 + random 0.3;

_leaves_p  = "#particlesource" createVehicleLocal (getpos player);
_leaves_p attachto [player];
_leaves_p setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
_leaves_p setParticleCircle [100, [0, 0, 0]];
_leaves_p setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1], "", "SpaceObject", 1,27,[0,0,0],[50,50,10],2,0.000001,0.0,0.1,[0.5+random 5],[[0.68,0.68,0.68,1]],[1.5,1],13,13,"","",vehicle player];
_leaves_p setDropInterval 3 + random 51;

[_Leaves_Green,_Leaves_leaf,_WoodParts,_leaves_p] spawn {
	params ["_Leaves_Green","_Leaves_leaf","_WoodParts","_leaves_p"];
	sleep 600;
	deleteVehicle _Leaves_Green;
	deleteVehicle _Leaves_leaf;
	deleteVehicle _WoodParts;
	deleteVehicle _leaves_p;
};
