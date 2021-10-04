/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\medical\supplies\functions\fn_canUnpackFirstAid.sqf
*	by Ojemineh
*
*	check if medical supplies can be unpacked
*
*	Arguments:
*	0: unit - <OBJECT>
*
*	Return:
*	<BOOLEAN>
*
*	Example:
*	[player] call TFS_medical_supplies_fnc_canUnpackFirstAid;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {
    false
};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (("TFS_FirstAid" in items _unit) &&
(alive _unit) &&
!(_unit getVariable ["ace_captives_isSurrendering", false]) &&
!(_unit getVariable ["ace_captives_isHandcuffed", false]) &&
!(_unit getVariable ["ace_isUnconscious", false]) &&
(not visibleMap));

_return;