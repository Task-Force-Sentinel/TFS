/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_play3dSoundlocal.sqf
* by Ojemineh
*
* play local sound at attached position
*
* Arguments:
* 0: object  - <OBJECT>
* 1: soundClass - <strinG>
* 2: position  - <ARRAY>
* 3: distance  - <NUMBER> (default: 100m)
* 4: maxdistance - <NUMBER> (default: no limitation)
* 5: duration  - <NUMBER> (seconds)
* 6: pitch  - <NUMBER>
* 7: isSpeech  - <BOOLEAN>
*
* Return:
* nothing
*
* Example:
* [player, "AlarmBell", [], -1, -1, 6] call TFS_fnc_play3dSoundlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass", "_position", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];

_object   = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass  = [_this, 1, "", [""]] call BIS_fnc_param;
_position  = [_this, 2, [], [[]]] call BIS_fnc_param;
_distance  = [_this, 3, -1, [0]] call BIS_fnc_param;
_maxdistance = [_this, 4, -1, [0]] call BIS_fnc_param;
_duration  = [_this, 5, -1, [0]] call BIS_fnc_param;
_pitch   = [_this, 6, -1, [0]] call BIS_fnc_param;
_isSpeech  = [_this, 7, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};
if (_soundClass isEqualto "") exitwith {};

if (_position isEqualto []) then {
    _position = [0, 0, 0];
};
if (_distance <= 0) then {
    _distance = [_soundClass] call TFS_fnc_getSounddistance;
};
if (_distance <= 0) then {
    _distance = 100;
};
// if ((_maxdistance > 0) && ((player distance _object) > _maxdistance)) exitwith {};

if (_duration <= 0) then {
    _duration = [_soundClass] call TFS_fnc_getSoundDuration;
};
if (_duration <= 0) exitwith {};

if (_pitch <= 0) then {
    _pitch = [_soundClass] call TFS_fnc_getSoundpitch;
};
if (_pitch <= 0) then {
    _pitch = 1;
};

// -------------------------------------------------------------------------------------------------

private _soundArray = _object getVariable ["tfs_sound3d", []];
private _soundinUse = false;

if (count _soundArray > 0) then {
    {
        if ((_x select 0) == _soundClass) then {
            _soundinUse = true;
        };
    } forEach _soundArray;
};

if (_soundinUse) exitwith {
    [_object, _soundClass, _position, _distance, _maxdistance, _duration, _pitch, _isSpeech] spawn {
        params ["_object", "_soundClass", "_position", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];
        [_object, _soundClass] call TFS_fnc_stop3dSoundlocal;
        sleep 0.1;
        [_object, _soundClass, _position, _distance, _maxdistance, _duration, _pitch, _isSpeech] call TFS_fnc_play3dSoundlocal;
    };
};

// -------------------------------------------------------------------------------------------------

private _soundobject = createSimpleObject [TFS_core_HELPER_OBJECT, [0, 0, 0], true];
_soundobject hideObject true;
_soundobject attachto [_object, _position];

_soundArray pushBackUnique [_soundClass, _soundobject];
_object setVariable ["tfs_sound3d", _soundArray];

private _handler = [_object, _soundobject, _soundClass, _distance, _maxdistance, _duration, _pitch, _isSpeech] spawn {
    params ["_object", "_soundobject", "_soundClass", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];
    [_soundobject, _soundClass, _distance, _maxdistance, _pitch, _isSpeech] call TFS_fnc_say3Dlocal;
    private _time = CBA_missiontime + _duration;
    waitUntil {
        if (!(alive _object) || (isNull _soundobject) || (_time < CBA_missiontime)) exitwith {
            true
        };
        false
    };
    [_object, _soundClass] call TFS_fnc_stop3dSoundlocal;
};

_handler;