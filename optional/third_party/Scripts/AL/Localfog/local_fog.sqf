#include "script_component.hpp"

if (!isServer) exitwith {};
params ["_obj_fog","_fog_type"];

if ((_fog_type!="low") && (_fog_type!="high") && (_fog_type!="medium")) exitwith {hint "Wrong value for the fog type!"};

if (_fog_type=="low") then {
	if (!isNil {_obj_fog getVariable "is_ON"}) exitwith {};
	_obj_fog setVariable ["is_ON",true,true];
	[[_obj_fog],QPATHTOF(Scripts\AL\Localfog\low_fog.sqf)] remoteExec ["execVM",0,true]
};

if (_fog_type=="high") then {
	if (!isNil {_obj_fog getVariable "is_ON"}) exitwith {};
	_obj_fog setVariable ["is_ON",true,true];
	[[_obj_fog],QPATHTOF(Scripts\AL\Localfog\high_fog.sqf)] remoteExec ["execVM",0,true]
};

if (_fog_type=="medium") then {
	[QPATHTOF(Scripts\AL\Localfog\medium_fog.sqf)] remoteExec ["execVM",0,true]
};
