#include "script_component.hpp"

if (!isServer) exitWith {};
params ["_obj_nuke","_radius","_damage_buildings_units","_weather_effect","_radiation","_fallout","_emp_range"];

if (!isNil {_obj_nuke getVariable "is_ON"}) exitwith {};
_obj_nuke setVariable ["is_ON",true,true];

[[_obj_nuke,_radius],QPATHTOF(Scripts\AL\Nuke\ignite_nuke_alt.sqf)] remoteExec ["execVM"];

if (_fallout) then {
	[[],QPATHTOF(Scripts\AL\Nuke\ash_nuke.sqf)] remoteExec ["execVM",0,true];
	[_obj_nuke] execvm QPATHTOF(Scripts\AL\Nuke\falling_nuke.sqf)
};

if (_weather_effect) then {
	[[],QPATHTOF(Scripts\AL\Nuke\weather_nuke.sqf)] remoteExec ["execVM",0,true];
	[] execvm QPATHTOF(Scripts\AL\Nuke\fog_nuke.sqf)
};

if (_damage_buildings_units) then {
	sleep 1;
	[_obj_nuke,_radius] execvm QPATHTOF(Scripts\AL\Nuke\damage_nuke.sqf)
};

if (_radiation) then {
	[[_obj_nuke,_radius],QPATHTOF(Scripts\AL\Nuke\rad_nuke.sqf)] remoteExec ["execVM",0,true];
};

if (_emp_range>0) then {
	[[_obj_nuke,_emp_range],QPATHTOF(Scripts\AL\Nuke\emp_nuke.sqf)] remoteExec ["execVM"];
};

enableEnvironment [false,false];
sleep 120;
deleteVehicle _obj_nuke;
sleep 300;
enableEnvironment [true,true];
