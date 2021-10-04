/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\interactions\functions\tapshoulder\fn_tapshoulder_doTap.sqf
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
* [player, unit1, 0] call TFS_interactions_fnc_tapshoulder_doTap;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_player", "_target", "_shoulder"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_shoulder = [_this, 2, 0, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _player) exitwith {};
if (isNull _target) exitwith {};

if ((_shoulder < 0) || (_shoulder > 1)) exitwith {};

// -------------------------------------------------------------------------------------------------

[_player, _target, _shoulder] spawn {
    params ["_player", "_target", "_shoulder"];
    
    if (animationState _player isEqualto "amovpercmstpsnonwnondnon") then {
        [_player, "ace_Gestures_pointStandLowered"] call ACE_common_fnc_doGesture;
    } else {
        [_player, "gesturePoint"] call ACE_common_fnc_doGesture;
    };
    
    sleep 0.4;
    
    private _selectionname = "";
    if (_shoulder == 0) then {
        _selectionname = "LeftShoulder";
    } else {
        _selectionname = "RightShoulder";
    };
    
    if (missionnamespace getVariable ["tfs_interactions_global_sounds", false]) then {
        private _pitch = random [0.8, 1.0, 1.2];
        ["TFS_action_Shoulder_Tap_1", _target, AGLtoASL (_target modeltoWorld (_target selectionPosition _selectionname)), 20, 1, _pitch, false] call TFS_fnc_playSound3D;
    } else {
        playSound "TFS_action_Shoulder_Tap_1";
    };
    
    if (isplayer _target) then {
        [_player, _target, _shoulder] remoteExecCall ["TFS_interactions_fnc_tapshoulder_tap", _target];
    };
};