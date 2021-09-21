/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\medical\area\functions\fn_doLightOn.sqf
 *	by Ojemineh
 *	
 *	switch light on
 *	
 *	Arguments:
 *	0: area - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[area1] call TFSRHS_medical_area_fnc_doLightOn;
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
	
	_area setVariable ["TFSRHS_MedicalArea_LightOnInProgress", true, true];
	
	private _lights = [];
	
	TFSRHS_MEDICAL_AREA_LIGHT_ON_SUCCESS = false;
	TFSRHS_MEDICAL_AREA_LIGHT_ON_FAILURE = false;
	
	[
		1,
		[],
		{ TFSRHS_MEDICAL_AREA_LIGHT_ON_SUCCESS = true; },
		{ TFSRHS_MEDICAL_AREA_LIGHT_ON_FAILURE = true; },
		localize "STR_TFSRHS_Medical_Area_Progress_LightOn"
	] call ACE_common_fnc_progressBar;
	
	waitUntil {if ((TFSRHS_MEDICAL_AREA_LIGHT_ON_SUCCESS) || (TFSRHS_MEDICAL_AREA_LIGHT_ON_FAILURE)) exitWith {true}; false};
	
	if (TFSRHS_MEDICAL_AREA_LIGHT_ON_SUCCESS) exitWith {
		private _light1 = "Chemlight_Blue" createVehicle (position _area); 
		_light1 attachTo [_area, [0,0,-0.3]];
		//_light1 attachTo [_area, [0,0,0.35]];
		_lights pushBack _light1;
		_area setVariable ["TFSRHS_MedicalArea_Lights", _lights, true];
		_area setVariable ["TFSRHS_MedicalArea_LightOnInProgress", nil, true];
	};
	
	if (TFSRHS_MEDICAL_AREA_LIGHT_ON_FAILURE) exitWith {
		_area setVariable ["TFSRHS_MedicalArea_LightOnInProgress", nil, true];
	};
	
};
