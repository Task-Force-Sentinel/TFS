/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\medical\area\functions\fn_doLightOff.sqf
 *	by Ojemineh
 *	
 *	switch light off
 *	
 *	Arguments:
 *	0: area - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[area1] call TFSRHS_medical_area_fnc_doLightOff;
 *	
 */

// -------------------------------------------------------------------------------------------------

private ["_area"];

_area = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _area) exitWith {false};

// -------------------------------------------------------------------------------------------------

[_area] spawn {
	
	params ["_area"];
	
	private _lights = _area getVariable ["TFSRHS_MedicalArea_Lights", []];
	if (_lights isEqualTo []) exitWith {};
	
	_area setVariable ["TFSRHS_MedicalArea_LightOffInProgress", true, true];
	
	TFSRHS_MEDICAL_AREA_LIGHT_OFF_SUCCESS = false;
	TFSRHS_MEDICAL_AREA_LIGHT_OFF_FAILURE = false;
	
	[
		1,
		[],
		{ TFSRHS_MEDICAL_AREA_LIGHT_OFF_SUCCESS = true; },
		{ TFSRHS_MEDICAL_AREA_LIGHT_OFF_FAILURE = true; },
		localize "STR_TFSRHS_Medical_Area_Progress_LightOff"
	] call ACE_common_fnc_progressBar;
	
	waitUntil {if ((TFSRHS_MEDICAL_AREA_LIGHT_OFF_SUCCESS) || (TFSRHS_MEDICAL_AREA_LIGHT_OFF_FAILURE)) exitWith {true}; false};
	
	if (TFSRHS_MEDICAL_AREA_LIGHT_OFF_SUCCESS) exitWith {
		{deleteVehicle _x;} forEach _lights;
		_area setVariable ["TFSRHS_MedicalArea_Lights", nil, true];
		_area setVariable ["TFSRHS_MedicalArea_LightOffInProgress", nil, true];
	};
	
	if (TFSRHS_MEDICAL_AREA_LIGHT_OFF_FAILURE) exitWith {
		_area setVariable ["TFSRHS_MedicalArea_LightOffInProgress", nil, true];
	};
	
};
