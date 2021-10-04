/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\load\fn_load.sqf
*	by Ojemineh
*
*	load files
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
*	[player, "curator"] call TFS_gear_fnc_load;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 4, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit, _role, _type, _team] remoteExecCall ["TFS_gear_fnc_load", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_loadoUT_PATH;
private _default_role = GEAR_default_ROLE;
private _default_type = GEAR_default_type;
private _default_team = GEAR_default_TEAM;

private _gear_role = toUpper(_unit getVariable ["gear_role", _default_role]);
private _gear_type = toUpper(_unit getVariable ["gear_type", _default_type]);
private _gear_team = toUpper(_unit getVariable ["gear_team", _default_team]);

if (_role isEqualto "") then {
    _role = _gear_role;
};
if (_type isEqualto "") then {
    _type = _gear_type;
};
if (_team isEqualto "") then {
    _team = _gear_team;
};

// -------------------------------------------------------------------------------------------------
// playerS default goggles

if (GEAR_KEEP_goggles) then {
    if ((goggles _unit) != "") then {
        _unit setVariable ["TFS_gear_goggles", (goggles _unit)];
    };
};

// -------------------------------------------------------------------------------------------------

[_unit] call TFS_gear_fnc_removeAll;

[_unit, _role, _type, _team] call TFS_gear_fnc_load_loadout;
[_unit, _role, _type, _team] call TFS_gear_fnc_load_properties;