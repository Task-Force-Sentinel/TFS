#include "script_component.hpp"

if (!hasInterface) exitWith {};
params ["_delay3"];
private ["_delayth3","_sound_only"];

while {alias_thunder_3} do {
	//if (!alias_thunder_3) then {waitUntil {alias_thunder_3}};
	waitUntil {overcast>0.3};
	_delayth3 = linearConversion [0.3,1,overcast,30+(random 120),0.1 + (random _delay3),true];
	_sound_only = selectRandom thunder_far_alias;
	[_sound_only] remoteExec ["playSound"];
	sleep _delayth3;
};
