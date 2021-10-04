/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_say3D.sqf
* by Ojemineh
*
* play global sound at object position
*
* Arguments:
* 0: object   - <OBJECT>
* 1: soundClass - <strinG>
* 2: distance  - <NUMBER> (default: 100m)
* 3: maxdistance - <NUMBER> (default: no limitation)
* 4: pitch  - <NUMBER>
* 5: isSpeech  - <BOOLEAN>
*
* Return:
* nothing
*
* Example:
* [player, "AlarmBell"] call TFS_fnc_say3D;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_distance", "_maxdistance", "_pitch", "_isSpeech"];

_object  = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass  = [_this, 1, "", [""]] call BIS_fnc_param;
_distance  = [_this, 2, -1, [0]] call BIS_fnc_param;
_maxdistance = [_this, 3, -1, [0]] call BIS_fnc_param;
_pitch  = [_this, 4, -1, [0]] call BIS_fnc_param;
_isSpeech  = [_this, 5, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};
if (_soundClass isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

[_object, _soundClass, _distance, _maxdistance, _pitch, _isSpeech] remoteExecCall ["TFS_fnc_say3Dlocal", 0, false];