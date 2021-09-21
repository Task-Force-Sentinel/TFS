#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_delay2"];
private ["_delayth2","_poz_f_1","_tip_tunet","_numar_sclipiri","_sound_tunet"];

waitUntil {!isNil "hunt_alias"};

while {alias_thunder_2} do {
	//if (!alias_thunder_2) then {waitUntil {alias_thunder_2}};
	waitUntil {overcast>0.3};
	_delayth2 = linearConversion [0.3,1,overcast,30+(random 120),0.1+(random _delay2),true];
	if (player == hunt_alias) then {
		if (!alias_thunder_2) then {
			waitUntil {alias_thunder_2};
		};
		_poz_f_1 = player getRelPos [700+random 1300, random 360];
		_tip_tunet = selectRandom ["lumina","sunet","lumina","sunet_lumina","lumina","lumina"];
		_numar_sclipiri = floor (1+random 3);
		_sound_tunet = selectRandom thunder_far_alias;
		[
			[
				[_poz_f_1 select 0,_poz_f_1 select 1,800],
				_tip_tunet,
				_numar_sclipiri,
				_sound_tunet
			],
			QPATHTOF(Scripts\AL\Thunder\alias_thunder_two_effect_SFX.sqf)
		] remoteExec ["execVM"];
	};
	sleep _delayth2;
};
