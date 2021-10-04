/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\medical\area\functions\fn_canLightoff.sqf
*	by Ojemineh
*
*	check if light can be switched off
*
*	Arguments:
*	0: area - <OBJECT>
*
*	Return:
*	<BOOLEAN>
*
*	Example:
*	[area1] call TFS_medical_area_fnc_canLightoff;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_area"];

_area = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _area) exitwith {
    false
};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (!(_area getVariable ["TFS_MedicalArea_LightoffinProgress", false]) &&
(count (_area getVariable ["TFS_MedicalArea_Lights", []]) > 0));

_return;