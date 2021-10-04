#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\fn_initialize.sqf
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
*	[] call TFS_core_fnc_initialize;
*
*/

// -------------------------------------------------------------------------------------------------

private _version = ["tfs_core"] call TFS_fnc_getAddonVersion;
[4, "Addon (v%1) loaded...", [_version], "core"] call TFS_fnc_log;

// -------------------------------------------------------------------------------------------------

TFS_core_HELPER_OBJECT = "Sign_Sphere10cm_Geometry_F";

// -------------------------------------------------------------------------------------------------

[
    "tfs_core_log",
    {
        _this call TFS_fnc_log;
    }
] call CBA_fnc_addEventHandler;

[
    "tfs_core_diaglog",
    {
        if (missionnamespace getVariable ["tfs_debug_enabled", false]) then {
            _this call TFS_fnc_log;
        };
    }
] call CBA_fnc_addEventHandler;

// -------------------------------------------------------------------------------------------------

if !(hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------
// KEY: screenshot

[
    "str_TFS_core_CBA_Category",
    "TFS_core_KEY_screenshot",
    ["str_TFS_core_KEY_screenshot_Title", "str_TFS_core_KEY_screenshot_Tip"],
    {
        [] call TFS_fnc_screenshot;
    },
    {},
    [DIK_F12, [false, true, false]]
] call CBA_fnc_addKeybind;

// -------------------------------------------------------------------------------------------------
// TACTICAL VIEW

[{
    params ["_params", "_pfhHandler"];
    
    if (cameraView isEqualto "group") then {
        if !(missionnamespace getVariable ["tfs_tactical_view_enabled", false]) then {
            player switchCamera "inTERNAL";
        };
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;

// -------------------------------------------------------------------------------------------------