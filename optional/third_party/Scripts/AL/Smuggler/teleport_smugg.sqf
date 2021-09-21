#include "script_component.hpp"

fnc_teleportSFX_AI = {
	params ["_unit"];
	private ["_ind"];
	_ind = 3;
	while {_ind>0} do {
		_unit hideObjectGlobal true; sleep 0.2; _unit hideObjectGlobal false;sleep 0.2;_ind = _ind-1
	};
};

if (!isserver) exitWith {};
params ["_obj_teleporter",""];
private ["_list_teleport","_list_vek_teleport"];
_list_teleport=[];
_list_vek_teleport=[];

while {alive _obj_teleporter} do {
	_list_teleport = (position _obj_teleporter) nearEntities ["CAManBase",15];
	if (protection_smug !="") then {
		if (count _list_teleport>0) then {
			{
				if ((headgear _x == protection_smug)or(goggles _x==protection_smug)or(uniform _x==protection_smug)or(vest _x==protection_smug)or(Backpack _x==protection_smug) or (protection_smug in (assigneditems _x + items _x))) then {
					/*hint "protejat"*/
				} else {
					private _fresh_spawn = _x getVariable ["teleported_in", 0];
					if (_fresh_spawn == 0) then {
						[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
						[_x] call fnc_teleportSFX_AI;
						if (isPlayer _x) then {
							[[_x,_obj_teleporter],QPATHTOF(Scripts\AL\Smuggler\teleport_effect.sqf)] remoteExec ["execVM"]
						} else {
							private _dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos;
							_x setPos _dest_tele;
							_x setDammage ((getDammage _x) + (random 0.25));
						};
					};
				};
			} foreach _list_teleport;
		};
	} else {
		{
			private _fresh_spawn = _x getVariable ["teleported_in", 0];
			if (_fresh_spawn == 0) then {
				[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
				[_x] call fnc_teleportSFX_AI;
				if (isPlayer _x) then {
					[[_x,_obj_teleporter],QPATHTOF(Scripts\AL\Smuggler\teleport_effect.sqf)] remoteExec ["execVM"]
				} else {
					private _dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos;
					_x setPos _dest_tele;
					_x setDammage ((getDammage _x) + (random 0.25));
				};
			};
		} foreach _list_teleport;
	};

	_list_vek_teleport = (position _obj_teleporter) nearEntities ["LandVehicle",15];
	if (count _list_vek_teleport>0) then {
		{
			private _fresh_spawn = _x getVariable ["teleported_in", 0];
			if (_fresh_spawn == 0) then {
				[_obj_teleporter,["tele_message",100]] remoteExec ["say3d"];
				[_x] call fnc_teleportSFX_AI;
				private _dest_tele = [getpos _obj_teleporter,300,-1,5,0,0.5,0] call BIS_fnc_findSafePos;
				_x setPos _dest_tele;
				_x setDammage ((getDammage _x)+(random 0.25));
			};
		} foreach _list_vek_teleport;
		_list_vek_teleport = [];
		_list_teleport = [];
	};
	sleep 2;
};
