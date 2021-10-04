/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\common\fn_getUnitinsignia.sqf
*	by Ojemineh
*
*	get unit insignia
*
*	Arguments:
*	0: unit - <OBJECT>
*
*	Return:
*	<strinG>
*
*	Example:
*	[player] call TFS_fnc_getUnitinsignia;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {
    ""
};

// -------------------------------------------------------------------------------------------------

private _return = _unit getVariable ["BIS_fnc_setUnitinsignia_class", ""];

_return;