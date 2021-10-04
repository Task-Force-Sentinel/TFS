/*
Function: TFS_fnc_Sound3donObject

Description:
Plays a sound on an object by attaching a dummy object to said object. Dummy
object can be deleted later to stop the sound from playing.

Arguments:
_pos - The position at which to play the sound <ARRAY>
_sound - The name of the sound class (CfgSounds) <strinG>
_distance - How far away the sound can be heard from _object. <SCALAR>
_pitch - pitch of the sound. Should usually be 1. <SCALAR>
_volume - Volume of the sound. if volume above 1 sound is multiplied <SCALAR>

Return Values:
Dummy object playing the sound

Examples:
nothing to see here.

Author:
Mokka
*/

// if run locally, run on server instead
if (!isServer) exitwith {
    _this remoteExec ["TFS_fnc_Sound3donObject", 2];
};

params [
    "_object",
    ["_SoundClass", "AirRaid"],
    ["_distance", 250],
    ["_pitch", 1],
    ["_volume", 1]
];

// Get the length property from the sound config entry
_lengthCfg = configFile >> "CfgSounds" >> _SoundClass >> "length";
_length = getNumber _lengthCfg;

// if length propery is not set, use a default value of 100 seconds
if (_length <= 0) then {
    _length = 100;
};

// Create dummy to play sound on
_dummy = "#particlesource" createvehicle [0, 0, 0];
_dummy setPos (getPos _object);
_dummy attachto [_object];

// Play sound on the created object
[_dummy, _SoundClass, _distance, _pitch] call tfs_fnc_Sound3D;

// Delete the dummy object after the sound is over (according to the config entry)
[
    {
        deletevehicle (_this select 0);
    },
    [_dummy],
    _length
] call CBA_fnc_waitandexecute;

_soundobjects = _object getVariable ["Soundobjects", []];
_soundobjects pushBack _dummy;
_object setVariable ["Soundobjects", _soundobjects, true];

_dummy;