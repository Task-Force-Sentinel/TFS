/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\core\functions\fn_initSettings.sqf
 * by Ojemineh
 * 
 * register cba settings
 * 
 * Arguments:
 * nothing
 * 
 * Return:
 * nothing
 * 
 * Example:
 * [] call TFS_core_fnc_initSettings;
 * 
 */

// -------------------------------------------------------------------------------------------------

// core SETTINGS

[
 "tfs_debug_enabled",
 "CHECKBOX",
 [
  localize "STR_TFS_Core_CBA_Debug_Enabled_Title", 
  localize "STR_TFS_Core_CBA_Debug_Enabled_Tip"
 ],
 [
  localize "STR_TFS_Core_CBA_Category", 
  localize "STR_TFS_Core_CBA_Category_core"
 ],
 false,
 0,
 {}
] call CBA_Settings_fnc_init;

[
 "tfs_showNewsOnMainMenu",
 "CHECKBOX",
 [
  localize "STR_TFS_Core_CBA_Show_News_Title", 
  localize "STR_TFS_Core_CBA_Show_News_Tip"
 ],
 [
  localize "STR_TFS_Core_CBA_Category", 
  localize "STR_TFS_Core_CBA_Category_core"
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
  [(uiNamespace getVariable "RscDisplayMain")] call compile preprocessfilelinenumbers '\z\tfs\addons\mainmenu\scripts\versionInfo.sqf';
 }
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------

[
 "tfs_tactical_view_enabled",
 "CHECKBOX",
 [
  localize "STR_TFS_Core_CBA_Tactical_View_Title", 
  localize "STR_TFS_Core_CBA_Tactical_View_Tip"
 ],
 [
  localize "STR_TFS_Core_CBA_Category", 
  localize "STR_TFS_Core_CBA_Category_Options"
 ],
 false,
 1,
 {}
] call CBA_Settings_fnc_init;

// -------------------------------------------------------------------------------------------------
