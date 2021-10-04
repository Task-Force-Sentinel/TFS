/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_say3Dlocal.sqf
* by Ojemineh
*
* play local sound at object position
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
* [player, "AlarmBell"] call TFS_fnc_say3Dlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

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

if (_distance <= 0) then {
    _distance = [_soundClass] call TFS_fnc_getSounddistance;
};
if (_distance <= 0) then {
    _distance = 100;
};
if ((_maxdistance > 0) && ((player distance _object) > _maxdistance)) exitwith {};

if (_pitch <= 0) then {
    _pitch = [_soundClass] call TFS_fnc_getSoundpitch;
};
if (_pitch <= 0) then {
    _pitch = 1;
};

// -------------------------------------------------------------------------------------------------

_object say3D [_soundClass, _distance, _pitch, _isSpeech];