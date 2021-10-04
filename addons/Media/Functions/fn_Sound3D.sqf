/*
Function: TFS_fnc_Sound3D

Description:
Plays a sound from CfgSounds on an object in 3D space. Sound follows object if moving.

Arguments:
_object - Object the Sound is played from. <OBJECT>
_SoundClass - Class name of sound from CfgSounds <strinG>
_distance - How far away the sound can be heard from _object. <SCALAR>
_pitch - pitch of the sound. Should usually be 1. <SCALAR>
_volume - Volume of the sound. if volume above 1 sound is multiplied <SCALAR>

Examples:
(begin example)
[speaker, "AirRaid", 500] call tfs_fnc_Sound3D;
[Jason, "JohnCena", 250] call tfs_fnc_Sound3D;
[this, "NukeAlarm", 250] call tfs_fnc_Sound3D;
(end)

Author:
MitchJC & Mokka
*/

// if run locally, run on server instead
if (!isServer) exitwith {
    _this remoteExec ["TFS_fnc_Sound3D", 2];
};

params [
    "_object",
    ["_SoundClass", "AirRaid"],
    ["_distance", 250],
    ["_pitch", 1],
    ["_volume", 1]
];

_volume = ceil _volume;

for "_i" from 0 to _volume do {
    [_object, [_SoundClass, _distance, _pitch]] remoteExec ["say3D", 0, true];
};