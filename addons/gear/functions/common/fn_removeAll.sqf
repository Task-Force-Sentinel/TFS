/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\gear\functions\common\fn_removeAll.sqf
 * by Ojemineh
 *
 * remove gear from unit
 *
 * Arguments:
 * 0: unit - <OBJECT>
 *
 * Return:
 * nothing
 *
 * Example:
 * [player] call TFS_gear_fnc_removeAll;
 *
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

if (Not local _unit) exitWith {
 [_unit] remoteExecCall ["TFS_gear_fnc_removeAll", _unit];
};

// -------------------------------------------------------------------------------------------------

removeAllAssignedItems _unit;
removeAllItems _unit;
removeAllWeapons _unit;

removeGoggles _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeVest _unit;
removeUniform _unit;
