#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_obj_emp","_rang_emp","_viz_eff","_player_viz","_dam_unit",["_destroyElectronic", true]];

if (!isNil {_obj_emp getVariable "is_ON"}) exitwith {};

_obj_emp setVariable ["is_ON",true,true];

emp_dam = _dam_unit; publicVariable "emp_dam";

if (_viz_eff or _player_viz) then {
	[
		[_obj_emp,_viz_eff,_player_viz],
		QPATHTOF(Scripts\AL\Emp\viz_eff_emp.sqf)
	] remoteExec ["execVM"];
};
[_obj_emp,_rang_emp] execvm QPATHTOF(Scripts\AL\Emp\config_obj.sqf);
waitUntil {!isNil "special_launchers_emp"};
waitUntil {!isNil "emp_dam"};
[_destroyElectronic] execvm QPATHTOF(Scripts\AL\Emp\emp_effect.sqf);
