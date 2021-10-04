/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_playSoundlocal.sqf
*	by Ojemineh
*
*	play sound for single player
*
*	Arguments:
*	0: soundClass - <strinG>
*	1: isSpeech - <BOOLEAN>
*
*	Return:
*	nothing
*
*	Example:
*	["Earthquake_01"] call TFS_fnc_playSoundlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_soundClass", "_isSpeech"];

_soundClass	= [_this, 0, "", [""]] call BIS_fnc_param;
_isSpeech = [_this, 1, true, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_soundClass isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

playSound [_soundClass, _isSpeech];