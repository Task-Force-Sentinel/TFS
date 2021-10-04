/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\common\fn_initplayer.sqf
*	by Ojemineh
*
*	initialize player
*
*	Arguments:
*	0: unit	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player] call TFS_gear_fnc_initplayer;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit] remoteExecCall ["TFS_gear_fnc_initplayer", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_loadoUT_PATH;
private _default_role = GEAR_default_ROLE;
private _default_type = GEAR_default_type;
private _default_team = GEAR_default_TEAM;

private _gear_role = toUpper(_unit getVariable ["gear_role", _default_role]);
private _gear_type = toUpper(_unit getVariable ["gear_type", _default_type]);
private _gear_team = toUpper(_unit getVariable ["gear_team", _default_team]);

// -------------------------------------------------------------------------------------------------

[_unit, _gear_role, _gear_type, _gear_team] call TFS_gear_fnc_load;