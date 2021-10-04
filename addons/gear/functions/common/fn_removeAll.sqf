/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\common\fn_removeAll.sqf
*	by Ojemineh
*
*	remove gear from unit
*
*	Arguments:
*	0: unit	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player] call TFS_gear_fnc_removeAll;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit] remoteExecCall ["TFS_gear_fnc_removeAll", _unit];
};

// -------------------------------------------------------------------------------------------------

removeAllAssignedItems _unit;
removeAllItems _unit;
removeAllweapons _unit;

removeGoggles _unit;
removeHeadgear _unit;
removeBackpack _unit;
removevest _unit;
removeuniform _unit;