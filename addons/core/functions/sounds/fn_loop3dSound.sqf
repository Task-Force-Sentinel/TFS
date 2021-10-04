/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_loop3dSound.sqf
*	by Ojemineh
*
*	loop global sound at attached position
*
*	Arguments:
*	0: object		- <OBJECT>
*	1: soundClass	- <strinG>
*	2: position		- <ARRAY>
*	3: distance		- <NUMBER>	(default: 100m)
*	4: maxdistance	- <NUMBER>	(default: no limitation)
*	5: duration		- <NUMBER>	(seconds)
*	6: pitch		- <NUMBER>
*	7: isSpeech		- <BOOLEAN>
*
*	Return:
*	nothing
*
*	Example:
*	[player, "AlarmBell", [], -1, -1, 6] call TFS_fnc_loop3dSound;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_position", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];

_object			= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass		= [_this, 1, "", [""]] call BIS_fnc_param;
_position		= [_this, 2, [], [[]]] call BIS_fnc_param;
_distance		= [_this, 3, -1, [0]] call BIS_fnc_param;
_maxdistance	= [_this, 4, -1, [0]] call BIS_fnc_param;
_duration		= [_this, 5, -1, [0]] call BIS_fnc_param;
_pitch			= [_this, 6, -1, [0]] call BIS_fnc_param;
_isSpeech		= [_this, 7, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};
if (_soundClass isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _position, _distance, _maxdistance, _duration, _pitch, _isSpeech] remoteExecCall ["TFS_fnc_loop3dSoundlocal", 0, false];