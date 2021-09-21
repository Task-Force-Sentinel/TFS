/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\core\functions\common\fn_getUnitInsignia.sqf
 *	by Ojemineh
 *	
 *	get unit insignia
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	<STRING>
 *	
 *	Example:
 *	[player] call TFSRHS_fnc_getUnitInsignia;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {""};

// -------------------------------------------------------------------------------------------------

private _return = _unit getVariable ["BIS_fnc_setUnitInsignia_class", ""];

_return;