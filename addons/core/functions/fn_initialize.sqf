#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\core\functions\fn_initialize.sqf
 *	by Ojemineh
 *	
 *	initialize core addon
 *	
 *	Arguments:
 *	nothing
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[] call TFSRHS_core_fnc_initialize;
 *	
 */

// -------------------------------------------------------------------------------------------------

private _version = ["tfsrhs_core"] call TFSRHS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "core"] call TFSRHS_fnc_log;

// -------------------------------------------------------------------------------------------------

TFSRHS_core_HELPER_OBJECT = "Sign_Sphere10cm_Geometry_F";

// -------------------------------------------------------------------------------------------------

[
	"tfsrhs_core_log", 
	{
		_this call TFSRHS_fnc_log;
	}
] call CBA_fnc_addEventHandler;

[
	"tfsrhs_core_diagLog", 
	{
		if (missionNamespace getVariable ["tfsrhs_debug_enabled", false]) then {
			_this call TFSRHS_fnc_log;
		};
	}
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------

if !(hasInterface) exitWith {};

// -------------------------------------------------------------------------------------------------
// KEY: SCREENSHOT

[
	"STR_TFSRHS_core_CBA_Category", 
	"TFSRHS_core_KEY_Screenshot", 
	["STR_TFSRHS_core_KEY_Screenshot_Title", "STR_TFSRHS_core_KEY_Screenshot_Tip"], 
	{
		[] call TFSRHS_fnc_screenshot;
	}, 
	{}, 
	[DIK_F12, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// TACTICAL VIEW

[{
	
	params ["_params", "_pfhHandler"];
	
	if (cameraView isEqualTo "GROUP") then {
		if !(missionNamespace getVariable ["tfsrhs_tactical_view_enabled", false]) then {
			player switchCamera "INTERNAL";
		};
	};
	
}, 0, []] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------
