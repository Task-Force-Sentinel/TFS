#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (alias_rain_drops) then {
	[] spawn {
		while {alias_rain_drops} do {
			private ["_rain_ini","_alias_rain_drop_factor","_pos_rd","_alias_drop_r","_alias_drop_sec"];
			//if (!alias_rain_drops)then {waitUntil {alias_rain_drops};};
			_rain_ini = rain;
			_alias_rain_drop_factor=linearConversion [0.1,1,rain,0.1,0.005,true];

			while {(abs(rain - _rain_ini)<0.1) and (rain>0)} do {
				if (rain > 0.02) then {
					_pos_rd = [getPosASLVisual (vehicle player) select 0,getPosASLVisual (vehicle player) select 1,0.01];
					_alias_drop_r = "#particlesource" createVehiclelocal _pos_rd;
					_alias_drop_r setParticleCircle [20,[0,0,0]];
					_alias_drop_r setParticleRandom [0,[15,15,0],[0,0,0.1],0,0.4,[0,0,0,0.1],1,0];
					_alias_drop_r setParticleParams [["\A3\Data_F_Mark\ParticleEffects\Universal\waterBallonExplode_01",4,0,16,0],"","Billboard",1,0.2,[0,0,150],[0,0,0.1],0,12,7,0,[0.1,0.5],[[1,1,1,1],[0.25,0.25,0.25,0]],[1],1,0,"","",player,0,true];
					_alias_drop_r setDropInterval _alias_rain_drop_factor;

					_alias_drop_sec = "#particlesource" createVehiclelocal _pos_rd;
					_alias_drop_sec setParticleCircle [20,[0,0,0]];
					_alias_drop_sec setParticleRandom [0.1,[15,15,0],[0,0,0.1],0,0.15,[0,0,0,0.1],1,0];
					_alias_drop_sec setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,0.2,[0,0,150],[0,0,0.1],0,15,7,0,[0.1,0.5],[[1,1,1,1],[0.2,0.2,0.2,0.5]],[100],1,0,"","",player,0,true];
					_alias_drop_sec setDropInterval _alias_rain_drop_factor;
					sleep 5;
					deleteVehicle _alias_drop_r;
					deleteVehicle _alias_drop_sec;
				};
			};
			sleep 5;
		};
	};
};

if (alias_wind_debris) then {
	[] spawn {
		private ["_xx_speed","_yy_speed","_alias_drop_factor","_Leaves_Green_interval","_Leaves_leaf_interval","_WoodParts_interval","_Leaves_Green","_Leaves_leaf","_WoodParts"];
		while {alias_wind_debris} do {
			//if (!alias_wind_debris) then {waitUntil {alias_wind_debris}};
			if (screen_effect!="none") then {
				waitUntil {!(missionNamespace getVariable ["under_cover_rain", false])};
			};
			_xx_speed = wind select 0 + 0.01;
			_yy_speed = wind select 1 + 0.01;
			_alias_drop_factor = [_xx_speed,_yy_speed] call BIS_fnc_greatestNum;
			_Leaves_Green_interval	= 2/(_alias_drop_factor*20) + 0.1;
			_Leaves_leaf_interval	= 2/(_alias_drop_factor*20) + 0.1;
			_WoodParts_interval		= 2/(_alias_drop_factor*20) + 0.1;

			_Leaves_Green = "#particlesource" createVehicleLocal (getpos player);
			_Leaves_Green setParticleCircle [0,[0,0,0]];
			_Leaves_Green setParticleRandom [0,[10,10,7],[4,4,0],0,0.01,[0,0,0,0.1],1,0.5];
			_Leaves_Green setParticleParams [["\A3\data_f\ParticleEffects\Hit_Leaves\Leaves_Green.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,1,0.1,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",player];

			_Leaves_leaf = "#particlesource" createVehicleLocal (getpos player);
			_Leaves_leaf setParticleCircle [0,[0,0,0]];
			_Leaves_leaf setParticleRandom [0,[10,10,7],[4,4,0],0,0.01,[0,0,0,0.1],1,0.5];
			_Leaves_leaf setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,1,0.1,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",player];

			_WoodParts = "#particlesource" createVehicleLocal (getpos player);
			_WoodParts setParticleCircle [0.0, [0, 0, 0]];
			_WoodParts setParticleRandom [0, [10, 10, 7], [4, 4, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
			_WoodParts setParticleParams [["\A3\data_f\ParticleEffects\Universal\WoodParts_01.p3d", 1, 0, 1],"","SpaceObject",1,7,[0,-3,5],[_xx_speed,_yy_speed,0],1,1,0.1,1.4,[1+random 0.5],[[0.68,0.68,0.68,1]],[0,1],0.2,1.2,"","",player];

			_Leaves_Green setDropInterval _Leaves_Green_interval;
			_Leaves_leaf setDropInterval _Leaves_leaf_interval;
			_WoodParts setDropInterval _WoodParts_interval;
			sleep 5;
			deleteVehicle _Leaves_Green;
			deleteVehicle _Leaves_leaf;
			deleteVehicle _WoodParts;
		};
	};
};

if (alias_local_fog) then {
	[] spawn {
		private ["_alias_drop_fog_factor","_alias_local_fog"];
		while {alias_local_fog} do {
			//if (!alias_local_fog) then {waitUntil {alias_local_fog}};
			if (screen_effect!="none") then {
				waitUntil {!(missionNamespace getVariable ["under_cover_rain", false])};
			};
			_alias_drop_fog_factor=linearConversion [0,1,rain,10,0.1,true];
			_alias_local_fog = "#particlesource" createVehicleLocal (getposATL player);
			_alias_local_fog setParticleCircle [10,[0,0,0]];
			_alias_local_fog setParticleRandom [10,[1,1,0],[0,0,0],1,1,[0,0,0,0.1],1,0];
			_alias_local_fog setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,12,[0,0,0],[0,0,0],3,10.15,7.9,0.1,[10,10,10],[[0.5,0.5,0.5,0],[0.5,0.5,0.5,0.1],[1,1,1,0]],[1],1,0,"","",player,0,true];
			_alias_local_fog setDropInterval _alias_drop_fog_factor;
			sleep 5;
			deleteVehicle _alias_local_fog;
			waitUntil {rain>0.1};
		};
	};
};
