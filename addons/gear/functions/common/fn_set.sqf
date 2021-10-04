/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\common\fn_set.sqf
*	by Ojemineh
*
*	set unit role
*
*	Arguments:
*	0: unit	- <OBJECT>
*	1: role	- <strinG>
*	2: type	- <strinG>
*	3: team	- <strinG>
*
*	Return:
*	nothing
*
*	Example:
*	[player, "curator", "0", "nato"] call TFS_gear_fnc_set;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team", "_load"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 3, "", [""]] call BIS_fnc_param;
_load = [_this, 4, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit, _role, _type, _team, _load] remoteExecCall ["TFS_gear_fnc_set", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_loadoUT_PATH;
private _default_role = GEAR_default_ROLE;
private _default_type = GEAR_default_type;
private _default_team = GEAR_default_TEAM;

if (_role isEqualto "") then {
    _role = toUpper(_default_role);
};
if (_type isEqualto "") then {
    _type = toUpper(_default_type);
};
if (_team isEqualto "") then {
    _team = toUpper(_default_team);
};

_unit setVariable ["gear_role", _role, true];
_unit setVariable ["gear_type", _type, true];
_unit setVariable ["gear_team", _team, true];

// -------------------------------------------------------------------------------------------------

if (_load) then {
    [_unit] call TFS_gear_fnc_load;
};