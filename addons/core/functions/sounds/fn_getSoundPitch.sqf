/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_getSoundpitch.sqf
*	by Ojemineh
*
*	get pitch of a sound-class
*
*	Arguments:
*	0: soundClass - <strinG>
*
*	Return:
*	<NUMBER>
*
*	Example:
*	["AlarmBell"] call TFS_fnc_getSoundpitch;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_soundClass"];

_soundClass = [_this, 0, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

private _soundArray	= [];
private _return		= 0;

if (isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) then {
    _soundArray = getArray (missionConfigFile >> "CfgSounds" >> _soundClass >> "sound");
} else {
    if (isClass (configFile >> "CfgSounds" >> _soundClass)) then {
        _soundArray = getArray (configFile >> "CfgSounds" >> _soundClass >> "sound");
    };
};

if (count _soundArray > 2) then {
    _return = _soundArray select 2;
};

_return;