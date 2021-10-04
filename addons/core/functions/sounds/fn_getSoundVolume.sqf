/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_getsoundVolume.sqf
*	by Ojemineh
*
*	get volume of a sound-class
*
*	Arguments:
*	0: soundClass - <strinG>
*
*	Return:
*	<NUMBER>
*
*	Example:
*	["AlarmBell"] call TFS_fnc_getsoundVolume;
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

if (count _soundArray > 1) then {
    if ((_soundArray select 1) isEqualtype "") then {
        if (([(_soundArray select 1), "db"] call CBA_fnc_find) > -1) then {
            _return = [(_soundArray select 1)] call TFS_fnc_decibeltoGain;
        } else {
            _return = parseNumber (_soundArray select 1);
        };
    } else {
        _return = (_soundArray select 1);
    };
};

_return;