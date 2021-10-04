/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_playSound3D.sqf
* by Ojemineh
*
* play global sound (classname) at object position
*
* Arguments:
* 0: soundClass - <strinG>
* 1: object - <OBJECT>
* 2: position - <ARRAY>
* 3: distance - <NUMBER>
* 4: volume - <NUMBER>
* 5: pitch - <NUMBER>
* 6: isinside - <BOOLEAN>
*
* Return:
* nothing
*
* Example:
* ["AlarmBell", player, (player modeltoWorld [0, 0, 3])] call TFS_fnc_playSound3D;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_object", "_position", "_distance", "_volume", "_pitch", "_isinside"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;
_object = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_position = [_this, 2, [], [[]]] call BIS_fnc_param;
_distance = [_this, 3, -1, [0]] call BIS_fnc_param;
_volume = [_this, 4, -1, [0]] call BIS_fnc_param;
_pitch = [_this, 5, -1, [0]] call BIS_fnc_param;
_isinside = [_this, 6, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualto "") exitwith {};
if (_position isEqualto []) then {
    _position = (getPosASL _object);
};

// -------------------------------------------------------------------------------------------------

private _missionRoot = str missionConfigFile select [0, count str missionConfigFile - 15];
private _soundArray  = [];
private _soundPath  = "";
private _soundFile  = "";
private _sounddistance = 100;
private _soundVolume = 1;
private _soundpitch  = 1;

if (isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) then {
    _soundArray = getArray (missionConfigFile >> "CfgSounds" >> _soundClass >> "sound");
    if (count _soundArray > 0) then {
        _soundPath = _soundArray select 0;
        if (_soundPath select [0, 1] == "\") then {
            _soundFile = _missionRoot + (_soundPath select [1]);
        } else {
            _soundFile = _missionRoot + _soundPath;
        };
    };
} else {
    if (isClass (configFile >> "CfgSounds" >> _soundClass)) then {
        _soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
        if (count _soundArray > 0) then {
            _soundPath = _soundArray select 0;
            if ((_soundPath select [0, 1]) == "\") then {
                _soundFile = _soundPath select [1];
            } else {
                _soundFile = _soundPath;
            };
        };
    };
};

if (count _soundArray > 0) then {
    if (_distance > 0) then {
        _sounddistance = _distance;
    } else {
        if ((count _soundArray) > 3) then {
            _sounddistance = (_soundArray select 3);
        };
    };
    
    if (_volume > 0) then {
        _soundVolume = _volume;
    } else {
        if ((_soundArray select 1) isEqualtype "") then {
            if (([(_soundArray select 1), "db"] call CBA_fnc_find) > -1) then {
                _soundVolume = [(_soundArray select 1)] call TFS_fnc_decibeltoGain;
            } else {
                _soundVolume = parseNumber (_soundArray select 1);
            };
        } else {
            _soundVolume = (_soundArray select 1);
        };
    };
    
    if (_pitch > 0) then {
        _soundpitch = _pitch;
    } else {
        _soundpitch = (_soundArray select 2);
    };
    
    if ((_soundFile != "") && ((_soundFile find ".") == -1)) then {
        _soundFile = _soundFile + ".wss";
    };
    
    if (_soundFile != "") then {
        playSound3D [_soundFile, _object, _isinside, _position, _soundVolume, _soundpitch, _sounddistance];
    };
};