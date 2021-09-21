/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\gear\functions\common\fn_restore.sqf
 *	by Ojemineh
 *
 *	restores unit loadout
 *
 *	Arguments:
 *	0: unit	- <OBJECT>
 *
 *	Return:
 *	nothing
 *
 *	Example:
 *	[player] call TFSRHS_gear_fnc_restore;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
	[_unit] remoteExecCall ["TFSRHS_gear_fnc_restore", _unit];
};

// -------------------------------------------------------------------------------------------------

private _array = _unit getVariable ["TFSRHS_gear_storage", []];
if (_array isEqualTo []) exitWith {};

private _loadout = (_array select 0);
_unit setUnitLoadout [_loadout, false];

private _insignia = (_array select 1);
if (_insignia != "") then {
	[_unit, ""] call BIS_fnc_setUnitInsignia;
	[_unit, _insignia] call BIS_fnc_setUnitInsignia;
};

_unit setVariable ["TFSRHS_gear_storage", nil, true];
