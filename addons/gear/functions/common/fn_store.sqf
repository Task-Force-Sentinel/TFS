/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\common\fn_store.sqf
*	by Ojemineh
*
*	stores unit loadout
*
*	Arguments:
*	0: unit	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player] call TFS_gear_fnc_store;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit] remoteExecCall ["TFS_gear_fnc_store", _unit];
};

// -------------------------------------------------------------------------------------------------

private _array = [];

private _loadout = getUnitloadout _unit;
_array pushBack _loadout;

private _insignia = [_unit] call BIS_fnc_getUnitinsignia;
_array pushBack _insignia;

_unit setVariable ["TFS_gear_storage", _array, true];