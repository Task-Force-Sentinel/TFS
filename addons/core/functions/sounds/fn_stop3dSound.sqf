/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_stop3dSound.sqf
* by Ojemineh
*
* stop 3d sound
*
* Arguments:
* 0: object - <OBJECT>
* 1: soundClass - <strinG>
*
* Return:
* nothing
*
* Example:
* [player, "AlarmBell"] call TFS_fnc_stop3dSound;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass"];

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass = [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass] remoteExecCall ["TFS_fnc_stop3dSoundlocal", 0, true];