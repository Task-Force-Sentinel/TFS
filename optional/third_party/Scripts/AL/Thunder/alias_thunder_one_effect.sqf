#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_type1_detect"];

waitUntil {!isNil "hunt_alias"};
while {alias_thunder_1} do {
	//if (!alias_thunder_1) then {waitUntil {alias_thunder_1}};
	private _delayth1 = linearConversion [0.3,1,overcast,15+(random 15),0.1+(random _type1_detect),true];
	if (player == hunt_alias) then {
		waitUntil {overcast>0.3};
		waitUntil {!isNil "alias_thunder_1"};
		private _jeton_poz = player getRelPos [50+random 1000, random 360];
		private _poz_obj_fulger1 = [_jeton_poz select 0,_jeton_poz select 1,(getPosATL player select 2)+1000+(random 500)];
		private _sound_sync = selectRandom thunder_close_alias;
		private _sound_echo = selectRandom thunder_far_alias;
		private _tip_fulger = selectRandom tip_fulger;
		[_poz_obj_fulger1] spawn _tip_fulger;
		private _flick_screen = ceil (1+(random 3));
		[
			[_poz_obj_fulger1,_sound_sync,_sound_echo,_flick_screen],
			QPATHTOF(Scripts\AL\Thunder\alias_thunder_one_SFX.sqf)
		] remoteExec ["execVM"];
	};
	sleep _delayth1;
}
