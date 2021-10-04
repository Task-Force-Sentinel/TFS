/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_speak3dlocal.sqf
*	by Ojemineh
*
*	play local sound with random lip sync
*
*	Arguments:
*	0: unit			- <OBJECT>
*	1: soundClass	- <strinG>
*	2: distance		- <NUMBER>	(default: 30m)
*	3: maxdistance	- <NUMBER>	(default: no limitation)
*	4: duration		- <NUMBER>	(seconds)
*	5: pitch		- <NUMBER>
*	6: isSpeech		- <BOOLEAN>
*
*	Return:
*	nothing
*
*	Example:
*	[player, "cp_mission_accomplished_1", -1, -1, 4.5] call TFS_fnc_speak3dlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_unit", "_soundClass", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];

_unit 	= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass 	= [_this, 1, "", [""]] call BIS_fnc_param;
_distance 		= [_this, 2, -1, [0]] call BIS_fnc_param;
_maxdistance	= [_this, 3, -1, [0]] call BIS_fnc_param;
_duration 	= [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch 	= [_this, 5, -1, [0]] call BIS_fnc_param;
_isSpeech 	= [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};
if !(_unit isKindOf "CAManBase") exitwith {};
if !(alive _unit) exitwith {};
if (_unit getVariable ["ACE_isUnconscious", false]) exitwith {};
if (_soundClass isEqualto "") exitwith {};

if (_distance <= 0) then {
    _distance = [_soundClass] call TFS_fnc_getSounddistance;
};
if (_distance <= 0) then {
    _distance = 30;
};
if ((_maxdistance > 0) && ((player distance _unit) > _maxdistance)) exitwith {};

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

private _soundArray = _unit getVariable ["tfs_sound3d", []];
private _soundinUse = false;

if (count _soundArray > 0) then {
    {
        if ((_x select 0) == _soundClass) then {
            _soundinUse = true;
        };
    } forEach _soundArray;
};

if (_soundinUse) exitwith {
    [_unit, _soundClass, _distance, _maxdistance, _duration, _pitch, _isSpeech] spawn {
        params ["_unit", "_soundClass", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];
        [_unit, _soundClass] call TFS_fnc_stop3dSoundlocal;
        sleep 0.1;
        [_unit, _soundClass, _distance, _maxdistance, _duration, _pitch, _isSpeech] call TFS_fnc_speak3dlocal;
    };
};

// -------------------------------------------------------------------------------------------------

[_unit, _soundClass, _distance, _maxdistance, _duration, _pitch, _isSpeech] spawn {
    params ["_unit", "_soundClass", "_distance", "_maxdistance", "_duration", "_pitch", "_isSpeech"];
    
    private _helper = createSimpleObject [TFS_core_HELPER_OBJECT, [0, 0, 0], true];
    _helper hideObject true;
    _helper attachto [_unit, (_unit selectionPosition "head")];
    
    private _soundArray = _unit getVariable ["tfs_sound3d", []];
    _soundArray pushBackUnique [_soundClass, _helper];
    
    _unit setVariable ["tfs_sound3d", _soundArray];
    _unit setVariable ["tfs_speak3d", true, true];
    _unit setRandomLip true;
    
    private _timer = CBA_missiontime + _duration;
    
    _helper say3D [_soundClass, _distance, _pitch, _isSpeech];
    
    waitUntil {
        if ((_unit getVariable ["ACE_isUnconscious", false]) ||
        (not alive _unit) ||
        (isNull _helper) ||
        (_timer < CBA_missiontime)) exitwith {
            true
        };
        false
    };
    
    _unit setRandomLip false;
    _unit setVariable ["tfs_speak3d", nil, true];
    
    [_unit, _soundClass] call TFS_fnc_stop3dSoundlocal;
};