/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\fn_initsettings.sqf
*	by Ojemineh
*
*	register cba settings
*
*	Arguments:
*	nothing
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_core_fnc_initsettings;
*
*/

// -------------------------------------------------------------------------------------------------

// core setTinGS

[
    "tfs_debug_enabled",
    "CHECKBOX",
    [
        localize "str_TFS_core_CBA_Debug_Enabled_Title",
        localize "str_TFS_core_CBA_Debug_Enabled_Tip"
    ],
    [
        localize "str_TFS_core_CBA_Category",
        localize "str_TFS_core_CBA_Category_core"
    ],
    false,
    0,
    {}
] call CBA_settings_fnc_init;

[
    "tfs_showNewsOnMainMenu",
    "CHECKBOX",
    [
        localize "str_TFS_core_CBA_Show_News_Title",
        localize "str_TFS_core_CBA_Show_News_Tip"
    ],
    [
        localize "str_TFS_core_CBA_Category",
        localize "str_TFS_core_CBA_Category_core"
    ],
    true,
    0,
    {
        params ["_value"];
        if (_value) then {
            profileNamespace setVariable ["tfs_showNewsOnMainMenu", true];
        } else {
            profileNamespace setVariable ["tfs_showNewsOnMainMenu", false];
        };
        saveProfileNamespace;
        [(uiNamespace getVariable "RscDisplayMain")] call compile preprocessFileLineNumbers '\z\tfs\addons\mainmenu\scripts\versioninfo.sqf';
    }
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
    "tfs_tactical_view_enabled",
    "CHECKBOX",
    [
        localize "str_TFS_core_CBA_Tactical_View_Title",
        localize "str_TFS_core_CBA_Tactical_View_Tip"
    ],
    [
        localize "str_TFS_core_CBA_Category",
        localize "str_TFS_core_CBA_Category_Options"
    ],
    false,
    1,
    {}
] call CBA_settings_fnc_init;

// -------------------------------------------------------------------------------------------------