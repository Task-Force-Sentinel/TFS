/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\interactions\functions\tapshoulder\fn_tapshoulder_tap.sqf
* by Ojemineh
*
* tap targets shoulder
*
* Arguments:
* 0: player - <OBJECT>
* 1: target - <OBJECT>
* 2: shoulder - <NUMBER> (0: left, 1: right)
*
* Return:
* nothing
*
* Example:
* [player, unit1, 0] call TFS_interactions_fnc_tapshoulder_tap;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_player", "_target", "_shoulder"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_shoulder = [_this, 2, 0, [0]] call BIS_fnc_param;

// ------------------------------------------------------------------------------------------------

if (isNull _player) exitwith {};
if (isNull _target) exitwith {};

if !(isplayer _target) exitwith {};
if (_target getVariable ["ACE_isUnconscious", false]) exitwith {};

if ((_shoulder < 0) || (_shoulder > 1)) exitwith {};

// -------------------------------------------------------------------------------------------------

enableCamShake true;
setCamShakeParams [0, 0, 1, 0, true];
addCamShake [5, 1, 5];

if (missionnamespace getVariable ["tfs_interactions_tapshoulder_hint", true]) then {
    private _playername = format [hint_tpl_var_1, [_player] call ACE_common_fnc_getname];
    private _shouldername = "";
    private _iconTemplate = "<img size='2.0' shadow='0' image='%1' /><br/>%2";
    private _iconFile = "";
    
    if (_shoulder == 0) then {
        _shouldername = format [hint_tpl_var_1, localize "str_TFS_interactions_hint_TapShoulder_Left"];
        _iconFile = "\z\tfs\addons\interactions\data\icons\shoulder_left_ca.paa";
    } else {
        _shouldername = format [hint_tpl_var_1, localize "str_TFS_interactions_hint_TapShoulder_Right"];
        _iconFile = "\z\tfs\addons\interactions\data\icons\shoulder_right_ca.paa";
    };
    
    private _shoulderIcon = format [_iconTemplate, _iconFile, _shouldername];
    private _hintMessage = format [localize "str_TFS_interactions_hint_TapShoulder", _playername, _shoulderIcon];
    [format [hint_tpl_default, _hintMessage]] call TFS_fnc_hint;
    
    if !(missionnamespace getVariable ["tfs_interactions_global_sounds", false]) then {
        playSound "TFS_action_Shoulder_Tap_1";
    };
};