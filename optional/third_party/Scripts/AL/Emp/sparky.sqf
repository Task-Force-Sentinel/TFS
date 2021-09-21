#include "script_component.hpp"

params ["_lamp"];
private ["_pauza_intre_sclipiri","_sclipiri","_nr"];

if (!hasInterface) exitWith {};

sleep (0.1 + (random 0.1));
_sclipiri = 1+ floor (random 5);
_nr = 0;
while {_nr < _sclipiri} do {
	_pauza_intre_sclipiri = 0.1+ (random 2);
	[
		[_lamp,_pauza_intre_sclipiri],
		QPATHTOF(Scripts\AL\Emp\spark_effect.sqf)
	] remoteExec ["execvm"];
	sleep _pauza_intre_sclipiri;
	_nr = _nr+1;
};
