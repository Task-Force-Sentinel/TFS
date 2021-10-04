/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\medical\area\functions\fn_createactions.sqf
*	by Ojemineh
*
*	create medical area interactions
*
*	Arguments:
*	0: medical area	- <OBJECT>
*	1: medical menu	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[area1, menu1] call TFS_medical_area_fnc_createactions;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_area", "_menu"];

_area = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_menu = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _area) exitwith {};
if (isNull _menu) exitwith {};

// -------------------------------------------------------------------------------------------------

["_menu", 0] call ACE_interact_menu_fnc_addMainaction;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_dismantle = [
    "TFS_Medical_Area_action_Dismantle",
    localize "str_TFS_Area_action_Dismantle",
    "\z\tfs\addons\medical\data\icons\medical_cross_ca.paa",
    {
        params ["_target", "_player", "_params"];
        [_player, (_params select 0)] call TFS_medical_area_fnc_doDismantle;
    },
    {
        params ["_target", "_player", "_params"];
        [_player, (_params select 0)] call TFS_medical_area_fnc_candismantle
    },
    {},
    [_area]
] call ACE_interact_menu_fnc_createaction;

[_menu, 0, ["ACE_Mainactions"], _medical_area_action_dismantle] call ACE_interact_menu_fnc_addActiontoObject;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_lightoff = [
    "TFS_Medical_Area_action_Lightoff",
    localize "str_TFS_Area_action_Lightoff",
    "",
    {
        params ["_target", "_player", "_params"];
        [(_params select 0)] call TFS_medical_area_fnc_doLightoff;
    },
    {
        params ["_target", "_player", "_params"];
        [(_params select 0)] call TFS_medical_area_fnc_canLightoff
    },
    {},
    [_area]
] call ACE_interact_menu_fnc_createaction;

[_menu, 0, ["ACE_Mainactions"], _medical_area_action_lightoff] call ACE_interact_menu_fnc_addActiontoObject;

// -------------------------------------------------------------------------------------------------

private _medical_area_action_lighton = [
    "TFS_Medical_Area_action_Lighton",
    localize "str_TFS_Area_action_Lighton",
    "",
    {
        params ["_target", "_player", "_params"];
        [(_params select 0)] call TFS_medical_area_fnc_doLighton;
    },
    {
        params ["_target", "_player", "_params"];
        [(_params select 0)] call TFS_medical_area_fnc_canLighton
    },
    {},
    [_area]
] call ACE_interact_menu_fnc_createaction;

[_menu, 0, ["ACE_Mainactions"], _medical_area_action_lighton] call ACE_interact_menu_fnc_addActiontoObject;