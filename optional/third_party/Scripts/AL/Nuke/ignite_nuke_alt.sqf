#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_obj_nuke_c"];
private ["_light_poz", "_fum_miez", "_picior", "_black_foot", "_effect_screen_gr"];

enableCamShake true;
_light_poz = "land_helipadempty_f" createVehiclelocal getPosATL _obj_nuke_c;
_light_poz setPosATL [getPosATL _obj_nuke_c select 0,getPosATL _obj_nuke_c select 1,2000];

[_light_poz] spawn {
	params ["_poz_lum"];
	private ["_li2", "_i"];

	_li2 = "#lightpoint" createVehicle getPosATL _poz_lum;
	_li2 lightAttachObject [_poz_lum, [0,0,0]];
	_li2 setLightAttenuation [80,-1,10,10000,3000,5000];
	_li2 setLightBrightness 20000;
	_li2 setLightDayLight true;
	_li2 setLightFlareSize 50;
	_li2 setLightFlareMaxDistance 10000;
	_li2 setLightAmbient[1,0.7,0.1];
	_li2 setLightColor[1,0.7,0.1];

	_i = 20000;
	while {_i > 0} do {
		_li2 setLightBrightness _i;
		_i = _i - 3;
		sleep 0.001;
	};
};

[] spawn {
	cutText ["", "WHITE OUT", 1];
	sleep 0.1;
	titleCut ["", "WHITE IN", 1];
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [40];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 10;
	sleep 10;
	"dynamicBlur" ppEffectEnable false;
};

[_obj_nuke_c] spawn {
	params ["_obj_sec_sound"];
	private ["_schimb_c", "_diam", "_val"];
	alpha_c=1;
	while {alpha_c >0} do {
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust[ 1, 1, alpha_c, [0.16, 0.38, 4.94, -1.65],[4.71, 2.68, 5, -0.29],[0.99, 0.81, -1.04, -1.76]];
		"colorCorrections" ppEffectCommit 0;
		sleep 0.01;
		alpha_c = alpha_c - 0.05;
	};

	a4=-1.65;
	b4=-0.29;
	c4=-1.76;
	_schimb_c = false;

	while {!_schimb_c} do {
		a4=a4+0.0025;
		b4=b4+0.003;
		c4=c4+0.0025;
		sleep 0.001;

		if (b4<0.86) then {
			"colorCorrections" ppEffectAdjust[1, 1, 0, [0.16, 0.38, 4.94, a4],[4.71, 2.68, 5, b4],[0.99, 0.81, -1.04, c4]];
			"colorCorrections" ppEffectCommit 0;
		} else {
			_diam=500;
			_val = "#particlesource" createVehicleLocal getPos _obj_sec_sound;
			_val setParticleCircle [_diam,[0,0,0]];
			_val setParticleRandom [2,[30,30,0],[0,0,0],5,0.1,[0,0,0,0.1],0,0];
			_val setParticleParams [["\A3\data_f\cl_basic",1,0,1],"","Billboard",1,5,[0,0,30],[0,0,0],15,7,1,1,[100,200],[[0,0,0,1],[0.1,0.05,0.01,0]],[1],0,0, "", "", _obj_sec_sound];
			_val setDropInterval 0.001;
			addCamShake [10, 7, 27];
			playsound "impact_nuke_dist_1";
			cutText ["", "WHITE OUT", 1];
			sleep 0.1;
			titleCut ["", "WHITE IN", 1];
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [60];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 10;
			"dynamicBlur" ppEffectEnable false;
			"colorCorrections" ppEffectAdjust[1,1,0,[-0.2,0.1,0.23,-0.2],[0.76,-0.4,0.86,0.86],[-0.57,0.81,-1.2,0.88]];
			"colorCorrections" ppEffectCommit 0;
			_schimb_c=true;
			[] spawn {
				sleep 3;
				addCamShake [0.5,150,37];
			};
			startfog = true; publicVariable "startfog";
			while {_diam<2000} do {
				_val setParticleCircle [_diam,[0,0,0]];
				_diam = _diam+100;
				sleep 0.3;
			};
			deleteVehicle _val;
		};
	};
};

_fum_miez = "#particlesource" createVehicleLocal getPos _obj_nuke_c;
_fum_miez setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal",16,7,48,1],"", "Billboard",1,52,[0,0,400],[0,0,0],17,1,1,0.01,[50,350,200],[[1,0.8,0.1,0.5],[0.8,0.5,0.2,0.5],[0.8,0.5,0.2,0]],[0.5],0,0,"","",_obj_nuke_c];
_fum_miez setParticleRandom [1,[300,300,0],[0,0,0],13,0,[0,0,0,0.5],0,0];
_fum_miez setParticleCircle [0,[0,0,0]];
_fum_miez setDropInterval 0.0025;
[_fum_miez] spawn {
	params ["_val_de_sters"];
	sleep 1;
	deleteVehicle _val_de_sters;
};
sleep 1;

_picior = "#particlesource" createVehicleLocal getPos _obj_nuke_c;
_picior setParticleCircle [50, [0, 0, 0]];
_picior setParticleRandom [0,[25,25,0],[0.175,0.175,0],63,0.1,[0,0,0,0.1],0,0];
_picior setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 50], 3, 9, 7.9, 0, [150,150,150,100,100,100,150], [[1, 1, 1, 0.5], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 1]], [1], 1, 0, "", "", _obj_nuke_c];
_picior setDropInterval 0.01;
[_picior] spawn {
	params ["_val_de_sters"];
	sleep 25;
	deleteVehicle _val_de_sters
};

_black_foot = "#particlesource" createVehicleLocal getPos _obj_nuke_c;
_black_foot setParticleParams [["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 7, 48,1], "", "Billboard", 1, 10, [0, 0, 0],[0, 0, 130], 13, 1, 2, 0.01, [200,100,100,100,100],[[0, 0, 0, 0.5],[0, 0, 0, 1], [0.3, 0.3, 0.3, 1],[0, 0, 0, 0.5],[0, 0, 0, 0]],[0.25],1,0, "", "", _obj_nuke_c];
_black_foot setParticleRandom [2,[30,30,30],[0,0,0],0,0,[0,0,0,0.1],1, 0];
_black_foot setParticleCircle [100,[-5,-5,0]];
_black_foot setDropInterval 0.02;
[_black_foot] spawn {
	params ["_val_de_sters"];
	sleep 35;
	deleteVehicle _val_de_sters
};

sleep 0.3;
_obj_nuke_c say3d ["nuke_2",5000];
[] spawn {
	sleep 0.3;
	addCamShake [10, 7, 27]
};


_effect_screen_gr = ppEffectCreate ["FilmGrain", 2000];
_effect_screen_gr ppEffectEnable true;
_effect_screen_gr ppEffectAdjust [1,5,2,3,3,true];
_effect_screen_gr ppEffectCommit 0;

[] spawn {
	private ["_sunet_eko"];
	sleep 3;
	_sunet_eko = "land_helipadempty_f" createVehiclelocal [getPosATL player select 0,getPosATL player select 1,(getPosATL player select 2) + 1];
	playsound "nuke_3";
	_sunet_eko say3d ["nuke_3",5000];
	playsound "wind_strong";
	playsound "murmur";
	sleep 8;
	deleteVehicle _sunet_eko;
};

sleep 20;
_black_foot setDropInterval 0.01;
deleteVehicle _light_poz;

sleep 120;
ppEffectDestroy _effect_screen_gr;
