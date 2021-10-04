/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\interactions\functions\inventory\fn_backpack_access.sqf
*	by Ojemineh
*
*	access targets backpack
*
*	Arguments:
*	0: unit		- <OBJECT>
*	1: target	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player, unit1] call TFS_interactions_fnc_backpack_access;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_player", "_target"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitwith {};
if (isNull _target) exitwith {};

if !(isplayer _target) exitwith {};
if (_target getVariable ["ACE_isUnconscious", false]) exitwith {};

// -------------------------------------------------------------------------------------------------

enableCamShake true;
setCamShakeParams [0, 1, 0, 0, true];
addCamShake [5, 1, 5];

if (missionnamespace getVariable ["tfs_interactions_backpack_access_hint", true]) then {
    private _playername = format [hint_tpl_var_1, [_player] call ACE_common_fnc_getname];
    private _iconTemplate = "<img size='2.0' shadow='0' image='%1' />";
    private _iconFile = "\z\tfs\addons\interactions\data\icons\search_backpack_ca.paa";
    private _icon = format [_iconTemplate, _iconFile];
    private _hintMessage = format [localize "str_TFS_interactions_hint_backpack_Access", _playername, _icon];
    
    [format [hint_tpl_default, _hintMessage], -1, 0] call TFS_fnc_hint;
    
    if !(missionnamespace getVariable ["tfs_interactions_global_sounds", false]) then {
        private _soundClass = selectRandom ["TFS_action_backpack_Open_1", "TFS_action_backpack_Open_2"];
        playSound _soundClass;
    };
};